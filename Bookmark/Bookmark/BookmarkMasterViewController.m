//
//  BookmarkMasterViewController.m
//  Bookmark
//
//  Created by Horne, William Austin on 10/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "BookmarkMasterViewController.h"
#import "BookmarkEntry.h"
#import "BookmarkEntryDataController.h"
#import "BookmarkDetailViewController.h"

@implementation BookmarkMasterViewController

@synthesize dataController = _dataController;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

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


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return NO;
}

-(NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController numberOfEntries];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cellToReturn = nil;
    
    cellToReturn = [tableView dequeueReusableCellWithIdentifier:@"BookmarkCellIdentifier"];
    
    if(!cellToReturn)
        cellToReturn = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"BookmarkCellIdentifier"];
    
    BookmarkEntry * entryToDisplayInCell = [self.dataController objectInListAtIndex:indexPath.row];
    NSString * titleString = entryToDisplayInCell.title;
    [[cellToReturn textLabel] setText:titleString];
    [[cellToReturn detailTextLabel] setText:@""];
    
    return cellToReturn;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
     if([segue.identifier isEqualToString:@"displayEntry"])
     {
         BookmarkDetailViewController *viewController =
         segue.destinationViewController;
         BookmarkEntry * rowEntry = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
 
         NSString * mytitle = rowEntry.title;
 
         viewController.url = [NSURL URLWithString:mytitle];
         viewController.title = @"Web Browser";
     }
 }

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
