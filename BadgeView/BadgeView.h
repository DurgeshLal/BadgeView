//
//  BadgeView.h
//  BadgeView
//
//  Created by Durgesh Lal on 7/11/13.
//  Copyright (c) 2013 Durgesh Lal. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface BadgeView : UIView
@property (nonatomic, readwrite) NSString* text;

@property (nonatomic, strong) UIFont* font;
@property (nonatomic, strong) UIColor* textColor;
@property (nonatomic, strong) UIColor* badgeColor;

-(id) initWithText: (NSString*) text badgeColor: (UIColor*) badgeColor textColor: (UIColor*) textColor frame:(CGRect)frame font:(UIFont*) font;

@end
