//
//  ColorNoteDetailViewController.m
//  ColorNotes
//
//  Created by Horne, William Austin on 10/8/13.
//  Copyright (c) 2013 Intermation. All rights reserved.
//

#import "ColorNoteDetailViewController.h"
#import "CustomView.h"

@implementation ColorNoteDetailViewController

@synthesize note = _note;
@synthesize noteContent = _noteContent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) 
    {
        // Custom initialization
    }
    return self;
}//end initWithNibName()

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.noteContent setText:self.note.textContent.text];
    [self.noteContent becomeFirstResponder];    //brings up the keyboard
}
/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/


- (void)viewDidUnload
{
    [self setNoteContent:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)deleteNote:(id)sender 
{
    [self.note removeFromSuperview];
    
    [self dismissModalViewControllerAnimated:YES];
}//end deleteNote()


- (IBAction)cancelNote:(id)sender 
{
    [self dismissModalViewControllerAnimated:YES];
}//end cancelNote()


- (IBAction)saveNote:(id)sender 
{
    [self.note.textContent setText:self.noteContent.text];
    [self dismissModalViewControllerAnimated:YES];
}//end saveNote()




@end
