//
//  FGViewController.m
//  FoleyGen
//
//  Created by Horne, William Austin on 11/19/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "FGViewController.h"
#define TWEET_BUTTON_TAG 101
#define POP_BUTTON_TAG 102
#define BOING_BUTTON_TAG 103

@interface FGViewController() 
{
    SystemSoundID tweetSound;
    SystemSoundID popSound;
    SystemSoundID boingSound;
    
    NSURL * recordedFile;
    AVAudioPlayer * longerTrack;
    AVAudioRecorder * recorder;
}
@end

@implementation FGViewController
@synthesize playButton;
@synthesize positionSlider;
@synthesize soundSwitch;
@synthesize timeToCheckPosition = _timeToCheckPosition;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL * tweetFilePath = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                    pathForResource:@"tweet" ofType:@"wav"]];
    NSURL * popFilePath = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                    pathForResource:@"pop" ofType:@"wav"]];
    NSURL * boingFilePath = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                                    pathForResource:@"boing" ofType:@"wav"]];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)tweetFilePath, &tweetSound);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)popFilePath, &popSound);
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)boingFilePath, &boingSound);
    
    recordedFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"iHaveUnderstanding" ofType:@"wav"]];
    
    NSError * error;
    longerTrack = [[AVAudioPlayer alloc] initWithContentsOfURL:recordedFile error:&error];
    
    if(longerTrack == nil)
        NSLog(@"Error: %@", [error localizedDescription]);
    
    longerTrack.delegate = self;
    longerTrack.volume = 0.5;
    
    self.timeToCheckPosition = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(checkPosition) userInfo:nil repeats:YES];
}
- (void)viewDidUnload
{
    [self setSoundSwitch:nil];
    [self setPlayButton:nil];
    [self setPositionSlider:nil];
    [super viewDidUnload];
    longerTrack = nil;
    recordedFile = nil;
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

- (IBAction)playSound:(UIButton *)sender
{
    if(!self.soundSwitch.isOn)
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        return;
    }
    switch (sender.tag) 
    {
        case TWEET_BUTTON_TAG:
            AudioServicesPlaySystemSound(tweetSound);
            break;
        case POP_BUTTON_TAG:
            AudioServicesPlaySystemSound(popSound);
            break;   
        case BOING_BUTTON_TAG:
            AudioServicesPlaySystemSound(boingSound);
            break;
        default:
            break;
    }
}


- (IBAction)volumeChangedBy:(UISlider *)sender
{
    longerTrack.volume = sender.value;
}

- (IBAction)positionChangedBy:(UISlider *)sender
{
    [longerTrack setCurrentTime:(sender.value * longerTrack.duration)];
}

- (IBAction)playPauseSound:(UIButton *)sender 
{
    if ([longerTrack isPlaying])
    {
        [longerTrack pause];
        [sender setTitle:@"Play" forState:UIControlStateNormal];
    }
    else
    {
        [longerTrack play];
        [sender setTitle:@"Pause" forState:UIControlStateNormal];
    }
}

- (IBAction)loopSound:(UIButton *)sender
{
    if (longerTrack.numberOfLoops == -1)
    {
        longerTrack.numberOfLoops = 0; //No loop back
        [sender setTitle:@"Loop" forState:UIControlStateNormal];
    }
    else
    {
        longerTrack.numberOfLoops = -1; //has not yet played
        [sender setTitle:@"Play once" forState:UIControlStateNormal];
    }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
}

-(void)checkPosition
{
    NSLog(@"Timer expired");
    self.positionSlider.value = longerTrack.currentTime/longerTrack.duration;
}
@end


























