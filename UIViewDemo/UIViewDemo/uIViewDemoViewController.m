//
//  uIViewDemoViewController.m
//  UIViewDemo
//
//  Created by Horne, William Austin on 9/17/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "uIViewDemoViewController.h"
#import "CustomView.h"

@implementation uIViewDemoViewController

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

-(IBAction)createNewView:(id)sender
{
    CGRect newViewRect = CGRectMake(20, 20, 100, 150);
    
    CustomView * newView = [[CustomView alloc] initWithFrame:newViewRect];
    
    [[self view] addSubview:newView];
    
    NSLog(@"The number of subview is %d.", [[[self view]subviews]count]);
}



@end



































