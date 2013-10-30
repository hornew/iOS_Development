//
//  CustomView.m
//  UIViewDemo
//
//  Created by Horne, William Austin on 9/17/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CustomView.h"


@implementation CustomView

@synthesize red = _red;
@synthesize green = _green;
@synthesize blue = _blue;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.red = (CGFloat)(arc4random()%256/255.0);
        self.green = (CGFloat)(arc4random()%256/255.0);
        self.blue = (CGFloat)(arc4random()%256/255.0);
        UIColor * backgroundColor = [[UIColor alloc] initWithRed:self.red green:self.green blue:self.blue alpha:1.0];
        
        [self setBackgroundColor:backgroundColor];
    }
    return self;
}//initWithFrame

//assume this means someone put their finger on the screen
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIColor *semiTransparentColor = [UIColor colorWithRed:self.red green:self.green blue:self.blue alpha:0.5];
    
    [self setBackgroundColor:semiTransparentColor];
}//end touchesBegan()

//assuming this means someone pulled their finger off the screen
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIColor *nonTransparentColor = [UIColor colorWithRed:self.red green:self.green blue:self.blue alpha:1.0];
    
    [self setBackgroundColor:nonTransparentColor];
}//end touchesEnded()

@end
