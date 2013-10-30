//
//  ColorPickerViewController.h
//  ColorPicker
//
//  Created by Horne, William Austin on 9/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorPickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *sampleText;

@property (weak, nonatomic) IBOutlet UISlider *redFontSlider;

@property (weak, nonatomic) IBOutlet UISlider *greenFontSlider;

@property (weak, nonatomic) IBOutlet UISlider *blueFontSlider;

@property (weak, nonatomic) IBOutlet UILabel *redFontLabel;

@property (weak, nonatomic) IBOutlet UILabel *greenFontLabel;

@property (weak, nonatomic) IBOutlet UILabel *blueFontLabel;

@property (weak, nonatomic) IBOutlet UISlider *redBGSlider;

@property (weak, nonatomic) IBOutlet UISlider *greenBGSlider;

@property (weak, nonatomic) IBOutlet UISlider *blueBGSlider;

@property (weak, nonatomic) IBOutlet UILabel *redBGFontLabel;

@property (weak, nonatomic) IBOutlet UILabel *greenBGFontLabel;

@property (weak, nonatomic) IBOutlet UILabel *blueBGFontLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet UISegmentedControl *bgSegmentedControl;


-(void)updateSampleText;

- (IBAction)sliderValueChanged:(id)sender;



@end
