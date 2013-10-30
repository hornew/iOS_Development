//
//  CDEViewController.h
//  CoreDataExercise
//
//  Created by Horne, William Austin on 10/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDEAppDelegate.h"

@interface CDEViewController : UIViewController <UITextFieldDelegate> //makes the view controller capable of receiving messages from a UITextField

//NSManagedObjectContext

@property (weak, nonatomic) IBOutlet UITextField *departmentTextField;

@property (weak, nonatomic) IBOutlet UITextField *numberTextField;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextView *resultsTextView;

- (IBAction)addCourse:(id)sender;

- (IBAction)searchCourse:(id)sender;

- (IBAction)deleteCourse:(id)sender;

@end
