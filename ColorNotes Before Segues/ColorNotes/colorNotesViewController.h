//
//  colorNotesViewController.h
//  ColorNotes
//
//  Created by David Tarnoff on 2/11/12.
//  Copyright (c) 2012 Intermation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface colorNotesViewController : UIViewController

//properties

@property (weak, nonatomic) IBOutlet UIView *customViewContainer;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonNewColor;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonEditNote;


//methods

-(IBAction)processTap:(UITapGestureRecognizer *)sender;
@end
