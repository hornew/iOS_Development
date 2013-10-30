//
//  ColorNoteDetailViewController.h
//  ColorNotes
//
//  Created by Horne, William Austin on 10/8/13.
//  Copyright (c) 2013 Intermation. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomView;

@interface ColorNoteDetailViewController : UIViewController

@property (strong, nonatomic) CustomView * note;

@property (weak, nonatomic) IBOutlet UITextView * noteContent;

@end
