//
//  CustomView.m
//  ColorNotes
//
//  Created by David Tarnoff on 2/11/12.
//  Copyright (c) 2012 Intermation. All rights reserved.
//

#import "CustomView.h"

#define LEFTPADDING 10
#define RIGHTPADDING 10
#define TOPPADDING 10
#define BOTTOMPADDING 0

@implementation CustomView

@synthesize red = _red;
@synthesize green = _green;
@synthesize blue = _blue;
@synthesize textContent = _textContent;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        [self randomizeBackgroundColor];
        UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(processPinch:)];
        [self addGestureRecognizer:pinchRecognizer];
        UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(processRotation:)];
        [self addGestureRecognizer:rotationRecognizer];
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(processPan:)];
        [self addGestureRecognizer:panRecognizer];
        UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(processLongPress:)];
        [self addGestureRecognizer:longPressRecognizer];
        CGRect currentBounds = self.bounds;
        self.textContent = [[UITextView alloc] initWithFrame:currentBounds];
        [self.textContent setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.0]];
        [self addSubview:self.textContent];
    }
    return self;
}

#pragma mark Property Modification

-(void)randomizeBackgroundColor
{
    self.red = (CGFloat)(arc4random() % 256)/255;
    self.green = (CGFloat)(arc4random() % 256)/255;
    self.blue = (CGFloat)(arc4random() % 256)/255;
    UIColor *newBackgroundColor = [[UIColor alloc] initWithRed:self.red green:self.green blue:self.blue alpha:1.0];
    self.backgroundColor = newBackgroundColor;
}

-(void)adjustBoundsAndOriginToSuperView
{
    
    if(self.frame.size.width > (self.superview.bounds.size.width - (LEFTPADDING + RIGHTPADDING)))
    {
        CGFloat scaleToFitFrame = (self.superview.bounds.size.width - (LEFTPADDING + RIGHTPADDING))/self.frame.size.width;
        self.transform = CGAffineTransformScale(self.transform, scaleToFitFrame, scaleToFitFrame);
    }
    if(self.frame.origin.x < LEFTPADDING)
    {
        CGPoint newCenter = CGPointMake(self.superview.bounds.origin.x + 0.5*(self.frame.size.width) + LEFTPADDING, self.center.y);
        [self setCenter:newCenter];
    }
    else if(self.frame.origin.x > (self.superview.bounds.size.width - RIGHTPADDING - self.frame.size.width))
    {
        CGPoint newCenter = CGPointMake((self.superview.frame.size.width - RIGHTPADDING - 0.5*(self.frame.size.width)), self.center.y);
        [self setCenter:newCenter];
    }
    
    if(self.frame.origin.y < TOPPADDING)
    {
        CGPoint newCenter = CGPointMake(self.center.x, self.superview.bounds.origin.y + 0.5*(self.frame.size.height) + TOPPADDING);
        [self setCenter:newCenter];
    }
    else if(self.frame.origin.y > (self.superview.bounds.size.height - BOTTOMPADDING - self.frame.size.height))
    {
        CGPoint newCenter = CGPointMake(self.center.x, (self.superview.frame.size.height - BOTTOMPADDING - 0.5*(self.frame.size.height)));
        [self setCenter:newCenter];
    }
    
}

#pragma mark Gesture Methods

-(IBAction)processPinch:(UIPinchGestureRecognizer *)sender
{
    if(sender.state == UIGestureRecognizerStateChanged)
    {
        self.transform = CGAffineTransformScale(self.transform, sender.scale, sender.scale);
        [sender setScale:1.0];
    }
    else if(sender.state == UIGestureRecognizerStateEnded)
    {
        [self adjustBoundsAndOriginToSuperView];
    }
}


-(IBAction)processRotation:(UIRotationGestureRecognizer *)sender
{
    if(sender.state == UIGestureRecognizerStateChanged)
    {
        self.transform = CGAffineTransformRotate(self.transform, sender.rotation);
        [sender setRotation:0.0];
    }
    else if(sender.state == UIGestureRecognizerStateEnded)
    {
        [self adjustBoundsAndOriginToSuperView];
    }
}

-(IBAction)processLongPress:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) 
    {
        [self.superview bringSubviewToFront:self];
    }
    [self.textContent becomeFirstResponder];
}

-(IBAction)processPan:(UIPanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        self.alpha = 0.5;
        [self.superview bringSubviewToFront:self];
    }
    else if (sender.state == UIGestureRecognizerStateEnded)
    {
        self.alpha = 1.0;
        [self adjustBoundsAndOriginToSuperView];
    }
    else if (sender.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [sender translationInView:self.superview];
        CGPoint newCenter = CGPointMake(self.center.x + translation.x, self.center.y + translation.y);
        [self setCenter:newCenter];
        [sender setTranslation:CGPointMake(0, 0) inView:self.superview];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
