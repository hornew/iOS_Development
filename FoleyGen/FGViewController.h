//
//  FGViewController.h
//  FoleyGen
//
//  Created by Horne, William Austin on 11/19/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface FGViewController : UIViewController <AVAudioPlayerDelegate, AVAudioRecorderDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *soundSwitch;

- (IBAction)volumeChangedBy:(UISlider *)sender;

- (IBAction)positionChangedBy:(UISlider *)sender;

- (IBAction)playPauseSound:(UIButton *)sender;

- (IBAction)loopSound:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *playButton;

@property (weak, nonatomic) IBOutlet UISlider *positionSlider;

@property (strong, nonatomic) NSTimer * timeToCheckPosition;

-(void)checkPosition;
@end
