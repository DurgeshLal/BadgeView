import UIKit
import Combine

class AppSettings:  ObservableObject {
    @Published var language = "English"
}

class Environment {
    static let updateChanged = Notification.Name("EnvironmentChangeUpdate")
    static let shared = Environment()
    
    private var sinks  = [AnyCancellable]()
    
    var values = [Any]()
    
    private init() { }
    
    
    func register<T: ObservableObject>(_ value: T) {
        values.append(value)
        
        let sink = value.objectWillChange.sink { _ in
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: Self.updateChanged, object: value)
            }
        }
        sinks.append(sink)
    }
}


protocol GlobalUpdating {
    func update()
}

extension GlobalUpdating {
    func registerForUpdate() {
        update()
    }
}

@propertyWrapper struct Global<ObjectType: ObservableObject> {
    var wrappedValue: ObjectType

    init() {
        if let value = Environment.shared.values.first(where: { $0 is ObjectType }) as? ObjectType {
            self.wrappedValue = value
        } else {
            fatalError("Missing Type in Environment")
        }
            
    }
}


class SecondViewController: UIViewController, GlobalUpdating {
    
    @Global var appSettings: AppSettings
    
    func update() {
        print("Value of app Settings in second view controller is \(appSettings.language)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForUpdate()
    }
    
}




class ViewController: UIViewController, GlobalUpdating {
    
    
    @Global var appSettings: AppSettings
    
    func update() {
        print("Value of app Settings in ViewController controller is \(appSettings.language)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForUpdate()
        
        let second = SecondViewController()
        
        print("Value from second view controller = \(second.appSettings.language)")
        
        appSettings.language = "Hindi"
        
        print("Value from second view controller after change = \(second.appSettings.language)")
      
    }
}

