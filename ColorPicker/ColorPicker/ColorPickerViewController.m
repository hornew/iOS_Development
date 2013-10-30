//
//  ColorPickerViewController.m
//  ColorPicker
//
//  Created by Horne, William Austin on 9/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ColorPickerViewController.h"

@implementation ColorPickerViewController
@synthesize sampleText;
@synthesize redFontSlider;
@synthesize greenFontSlider;
@synthesize blueFontSlider;
@synthesize redFontLabel;
@synthesize greenFontLabel;
@synthesize blueFontLabel;
@synthesize redBGSlider;
@synthesize greenBGSlider;
@synthesize blueBGSlider;
@synthesize redBGFontLabel;
@synthesize greenBGFontLabel;
@synthesize blueBGFontLabel;
@synthesize segmentedControl;
@synthesize bgSegmentedControl;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setSampleText:nil];
    [self setRedFontSlider:nil];
    [self setGreenFontSlider:nil];
    [self setBlueFontSlider:nil];
    [self setRedFontLabel:nil];
    [self setGreenFontLabel:nil];
    [self setBlueFontLabel:nil];
    [self setRedBGSlider:nil];
    [self setGreenBGSlider:nil];
    [self setBlueBGSlider:nil];
    [self setRedBGFontLabel:nil];
    [self setGreenBGFontLabel:nil];
    [self setBlueBGFontLabel:nil];
    [self setSegmentedControl:nil];
    [self setBgSegmentedControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Display Methods

-(void)updateSampleText
{
    float redFontValue = self.redFontSlider.value;
    float greenFontValue = self.greenFontSlider.value;
    float blueFontValue = self.blueFontSlider.value;
    float redBGValue = self.redBGSlider.value;
    float greenBGValue = self.greenBGSlider.value;
    float blueBGValue = self.blueBGSlider.value;
    
    UIColor * fontColor = [UIColor colorWithRed:redFontValue green:greenFontValue blue:blueFontValue alpha:1.0];
    UIColor * backgroundColor = [UIColor colorWithRed:redBGValue green:greenBGValue blue:blueBGValue alpha:1.0];
    
    [[self sampleText] setTextColor:fontColor];
    [[self sampleText] setBackgroundColor:backgroundColor];
}

- (IBAction)sliderValueChanged:(id)sender 
{
    [self updateSampleText];
}



@end





















