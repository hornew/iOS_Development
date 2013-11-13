//
//  CRateViewController.m
//  Collaborate
//
//  Created by Horne, William Austin on 11/12/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CRateViewController.h"

@implementation CRateViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{    
    CGRect rect = CGRectInset(self.view.bounds, 0.0, 0.0);
    UIView * v = [[UIView alloc] initWithFrame:rect];
    
    [v setBackgroundColor:[UIColor greenColor]];
    [super viewDidLoad];
    [self.view addSubview:v];
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
    return YES;
}

@end
