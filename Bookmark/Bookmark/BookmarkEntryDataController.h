//
//  BookmarkEntryDataController.h
//  Bookmark
//
//  Created by Horne, William Austin on 10/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BookmarkEntry;

@interface BookmarkEntryDataController : NSObject

@property (nonatomic, copy) NSMutableArray * collectionOfURLs;

-(NSInteger)numberOfEntries;
-(BookmarkEntry *)objectInListAtIndex:(NSInteger)index;
-(void)addBookmarkEntryNamed:(NSString *)name;


@end
