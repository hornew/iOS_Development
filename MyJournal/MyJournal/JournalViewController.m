//
//  JournalViewController.m
//  MyJournal
//
//  Created by Horne, William Austin on 9/17/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "JournalViewController.h"
#import "JournalItem.h"

@implementation JournalViewController

@synthesize journalEntries = _journalEntries;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.journalEntries = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        //[self.journalEntries addObject:[NSString stringWithFormat:@"Journal item %d", i]];
        [self.journalEntries addObject:[[JournalItem alloc] 
                                        initWithTitle:[NSString stringWithFormat:@"Journal entry %d", i]]];
    }
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

#pragma mark -- UITableViewDataSource Required Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return [self.journalEntries count];
}//end numberOfRowsInSection()


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell * cellToReturn = nil;
    
    //tells if cells that dropped off the bottom of the view
    cellToReturn = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (!cellToReturn)
    {
        cellToReturn = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }
    
    JournalItem * itemToReturn = [self.journalEntries objectAtIndex:indexPath.row];
    
    //cellToReturn.textLabel.text = [[self journalEntries] objectAtIndex:[indexPath row]];
    
    cellToReturn.textLabel.text = itemToReturn.title;
    
    return cellToReturn;
}//end cellForRowAtIndexPath()

@end
























