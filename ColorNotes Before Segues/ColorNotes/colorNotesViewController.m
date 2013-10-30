//
//  colorNotesViewController.m
//  ColorNotes
//
//  Created by David Tarnoff on 2/11/12.
//  Copyright (c) 2012 Intermation. All rights reserved.
//

#import "colorNotesViewController.h"
#import "CustomView.h"
#import "ColorNoteDetailViewController.h"

#define NEWFRAME_X_POS 10
#define NEWFRAME_Y_POS 10
#define NEWFRAME_WIDTH 140
#define NEWFRAME_HEIGHT 100

@implementation colorNotesViewController
@synthesize customViewContainer = _customViewContainer;
@synthesize buttonNewColor = _buttonNewColor;
@synthesize buttonEditNote = _buttonEditNote;

- (IBAction)newViewRequested:(id)sender 
{
    CGRect newViewRectangle = CGRectMake(NEWFRAME_X_POS, NEWFRAME_Y_POS, NEWFRAME_WIDTH, NEWFRAME_HEIGHT);
    CustomView *newView = [[CustomView alloc] initWithFrame:newViewRectangle];
    [self.customViewContainer addSubview:newView];
    
    self.buttonEditNote.enabled = YES;
    self.buttonNewColor.enabled = YES;
}//newViewRequested()

- (IBAction)newColorRequested:(id)sender 
{
    [self.customViewContainer.subviews.lastObject randomizeBackgroundColor];
}//end newColorRequested()

-(IBAction)processTap:(UITapGestureRecognizer *)sender
{
    CustomView *topView = self.customViewContainer.subviews.lastObject;
    if([topView isMemberOfClass:[CustomView class]])
    {
        if([topView.textContent isFirstResponder])
            [topView.textContent resignFirstResponder];
    }
}//end processTap()




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(processTap:)];
    [self.customViewContainer addGestureRecognizer:tapRecognizer];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setCustomViewContainer:nil];
    [self setButtonNewColor:nil];
    [self setButtonEditNote:nil];
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
    if(![self.customViewContainer.subviews.lastObject isMemberOfClass:[CustomView class]])
    {
        self.buttonNewColor.enabled = NO;
        self.buttonEditNote.enabled = NO;
    }
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ColorNoteDetailSegue"])
    {
        CustomView * viewToEdit = nil;
        if([self.customViewContainer.subviews.lastObject 
                isMemberOfClass:[CustomView class]])
        {
            viewToEdit = self.customViewContainer.subviews.lastObject;
        }
        ColorNoteDetailViewController * segueDestination = segue.destinationViewController;
        
        segueDestination.note = viewToEdit;
    }
}//end prepareForSegue()
@end













