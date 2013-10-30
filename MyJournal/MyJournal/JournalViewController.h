//
//  JournalViewController.h
//  MyJournal
//
//  Created by Horne, William Austin on 9/17/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JournalViewController : UIViewController <UITableViewDataSource>
{
    NSMutableArray * journalEntries;
}

@property (strong, nonatomic) NSMutableArray * journalEntries;
@end
