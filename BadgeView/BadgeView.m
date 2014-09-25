//
//  BadgeView.m
//  BadgeView
//
//  Created by Durgesh Lal on 7/11/13.
//  Copyright (c) 2013 Durgesh Lal. All rights reserved.
//

#import "BadgeView.h"


static const CGFloat kMinimumWidth = 30.f;
static const CGFloat kHorizontalMargins = 20.f;
static const CGFloat kVerticalMargins = 10.f;
static const CGFloat kBadgeLineSize = 0.0f;

@implementation BadgeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
		
        [self setDefaultValues];
    }
    return self;
}

-(id) initWithText: (NSString*) text badgeColor: (UIColor*) badgeColor textColor: (UIColor*) textColor frame:(CGRect)frame font:(UIFont*) font
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
		
        self.badgeColor = badgeColor;
        self.font = font;
        self.textColor = textColor;
        self.text = text;
        
    }
    return self;
}

-(void)setDefaultValues{
    
    self.badgeColor = [UIColor purpleColor];
    self.font = [UIFont boldSystemFontOfSize:17];
    self.textColor = [UIColor whiteColor];
    self.text = @"1";
}

- (void)setText:(NSString *)text {
    _text = text;
    
    [self setNeedsDisplay];
    [self sizeToFit];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    
    [self setNeedsDisplay];
}

- (void)setBadgeColor:(UIColor *)badgeColor {
    _badgeColor = badgeColor;
    
    [self setNeedsDisplay];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    
    [self setNeedsDisplay];
    [self sizeToFit];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize stringSize = [self.text sizeWithFont:self.font];
    
    return CGSizeMake(MAX(kMinimumWidth, stringSize.width + kHorizontalMargins),
                      stringSize.height + kVerticalMargins);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    
    CGFloat minX = CGRectGetMinX(rect) + 4.f;
    CGFloat maxX = CGRectGetMaxX(rect) - 5.f;
    CGFloat minY = CGRectGetMinY(rect) + 3.5f;
    CGFloat maxY = CGRectGetMaxY(rect) - 6.5f;
    
    CGSize textSize = [self.text sizeWithFont:self.font];
  
    const CGFloat pi = (CGFloat)M_PI;
    const CGFloat kRadius = textSize.height / 2.f;
    
    // Draw the main rounded rectangle
    CGContextBeginPath(context);
    CGContextSetFillColorWithColor(context, self.badgeColor.CGColor);
    CGContextAddArc(context, maxX-kRadius, minY+kRadius, kRadius, pi+(pi/2), 0, 0);
    CGContextAddArc(context, maxX-kRadius, maxY-kRadius, kRadius, 0, pi/2, 0);
    CGContextAddArc(context, minX+kRadius, maxY-kRadius, kRadius, pi/2, pi, 0);
    CGContextAddArc(context, minX+kRadius, minY+kRadius, kRadius, pi, pi+pi/2, 0);
    // CGContextSetShadowWithColor(context, self.shadowOffset, self.shadowBlur, self.shadowColor.CGColor);
    CGContextFillPath(context);
    
    CGContextRestoreGState(context);
    
    // Draw the border
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, kBadgeLineSize);
    CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextAddArc(context, maxX-kRadius, minY+kRadius, kRadius, pi+(pi/2), 0, 0);
    CGContextAddArc(context, maxX-kRadius, maxY-kRadius, kRadius, 0, pi/2, 0);
    CGContextAddArc(context, minX+kRadius, maxY-kRadius, kRadius, pi/2, pi, 0);
    CGContextAddArc(context, minX+kRadius, minY+kRadius, kRadius, pi, pi+pi/2, 0);
    CGContextClosePath(context);
    CGContextStrokePath(context);
    
    // Draw text
    [self.textColor set];
    
    [self.text drawAtPoint:CGPointMake(floorf((rect.size.width - textSize.width) / 2.f) - 0.f,
                                       floorf((rect.size.height - textSize.height) / 2.f) - 2.f)
                  withFont:self.font];
    
}





@end
