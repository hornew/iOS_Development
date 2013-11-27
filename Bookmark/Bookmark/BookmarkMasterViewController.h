//
//  BookmarkMasterViewController.h
//  Bookmark
//
//  Created by Horne, William Austin on 10/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BookmarkEntryDataController;
@interface BookmarkMasterViewController : UITableViewController

@property (nonatomic, strong) BookmarkEntryDataController * dataController;

@end
