//
//  CDEViewController.m
//  CoreDataExercise
//
//  Created by Horne, William Austin on 10/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CDEViewController.h"
#import "CDEAppDelegate.h"
#import "CourseList.h"

@interface CDEViewController()
{
    NSManagedObjectContext * context;
}
@end

@implementation CDEViewController
@synthesize departmentTextField;
@synthesize numberTextField;
@synthesize titleTextField;
@synthesize resultsTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CDEAppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
    
    context = [appDelegate managedObjectContext];
    
    [[self resultsTextView] setUserInteractionEnabled:NO]; //make the text view non-editable
    [[self resultsTextView] setText:@""];
    
    [[self departmentTextField] setDelegate:self]; //when the department text field has something to pass to its delegate, our is the delegate to pass to
    [[self titleTextField] setDelegate:self];
    [[self numberTextField] setDelegate:self];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setDepartmentTextField:nil];
    [self setNumberTextField:nil];
    [self setTitleTextField:nil];
    [self setResultsTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)addCourse:(id)sender 
{
    NSManagedObject * courseToAdd = [NSEntityDescription insertNewObjectForEntityForName:@"CourseList" inManagedObjectContext:context];
    
    [courseToAdd setValue:[self.departmentTextField text] forKey:@"department"];
    
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    NSNumber * courseNumber = [formatter numberFromString:[self.numberTextField text]];
    
    [courseToAdd setValue:courseNumber forKey:@"number"];
    [courseToAdd setValue:[self.titleTextField text] forKey:@"title"];
    
    NSError * error;
    
    if(![context save:&error])
    {
        NSLog(@"Save error: %@", [error localizedDescription]);
    }
    
    [[self departmentTextField] setText:@""];
    [[self numberTextField] setText:@""];
    [[self titleTextField] setText:@""];
    
    [[self resultsTextView] setText:@"New Record Added"];
}

- (IBAction)searchCourse:(id)sender 
{
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"CourseList" inManagedObjectContext:context]];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"department like %@ or number like %@ or title like %@", self.departmentTextField.text, self.numberTextField.text, self.titleTextField.text];
    [request setPredicate:predicate];
    NSError * error;
    
    NSArray * resultsArray = [context executeFetchRequest:request error:&error];
    
    if([resultsArray count ] > 0)
    {
        NSMutableString * resultsString = [[NSMutableString alloc] init];
        for (CourseList * nextCourse in resultsArray)
        {
            [resultsString appendFormat:@"%@ %@ - %@\n", nextCourse.department, nextCourse.number, nextCourse.title];
        }
        [self.resultsTextView setText:resultsString];
    }
    else
    {
        [self.resultsTextView setText:@"No results returned"];
    }
}

- (IBAction)deleteCourse:(id)sender 
{
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"CourseList" inManagedObjectContext:context]];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"department like %@ and number like %@", self.departmentTextField.text, self.numberTextField.text];
    [request setPredicate:predicate];
    NSError * error;
    
    NSArray * resultsArray = [context executeFetchRequest:request error:&error];
    
    if([resultsArray count ] > 0)
    {
        for (CourseList * nextCourse in resultsArray)
        {
            [context deleteObject:nextCourse];
        }
        [context save:&error];  //save the context and send the error object to be used in case of error
        [self.resultsTextView setText:[NSString stringWithFormat:@"%d record(s) deleted", [resultsArray count]]];
    }
    else
    {
        [self.resultsTextView setText:@"No results returned"];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder]; //makes the keyboard go away 
}
@end











