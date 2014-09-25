//
//  ViewController.m
//  BadgeView
//
//  Created by Durgesh Lal on 7/11/13.
//  Copyright (c) 2013 Durgesh Lal. All rights reserved.
//

#import "ViewController.h"
#import "BadgeView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  
    
    BadgeView *badgeView = [[BadgeView alloc]initWithText:@"2" badgeColor:[UIColor redColor] textColor:[UIColor whiteColor] frame:CGRectMake(55, -10, 50, 50) font:[UIFont boldSystemFontOfSize:17]];
    [_cartButton addSubview:badgeView];
    
  
  
    
    BadgeView *cBadge = [[BadgeView alloc]initWithFrame:CGRectMake(55, -10, 50, 50)];
 
    
    [_cartButton2 addSubview:cBadge];
    
    BadgeView *cBadge2 = [[BadgeView alloc]initWithFrame:CGRectMake(55, -10, 50, 50)];
    
     [_cartButton3 addSubview:cBadge2];
    
    
    [cBadge2 setText:@"22222222222222222222"];
    [cBadge2 setBadgeColor:[UIColor blackColor]];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
