//
//  BookmarkEntryDataController.m
//  Bookmark
//
//  Created by Horne, William Austin on 10/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "BookmarkEntryDataController.h"
#import "BookmarkEntry.h"

@implementation BookmarkEntryDataController

@synthesize collectionOfURLs = _collectionOfURLs;

-(id)init   //standard object initializer
{
    if (self = [super init]) {
        NSMutableArray * blankList = [[NSMutableArray alloc] init];
        self.collectionOfURLs = blankList;
    }
    return self;
}//end init()

//setter to override the default.  Makes collectionOfURLs a copy
-(void)setCollectionOfURLs:(NSMutableArray *)newList
{
    if (_collectionOfURLs != newList)
    {
        _collectionOfURLs = [newList mutableCopy];
    }
}//end setCollectionOfURLs()

-(NSInteger)numberOfEntries
{
    return self.collectionOfURLs.count;
}//end numberOfEntries()

-(BookmarkEntry *)objectInListAtIndex:(NSInteger)index
{
    if((index >= 0) && (index < [self numberOfEntries]))
        return [self.collectionOfURLs objectAtIndex:index];
    
    return nil; //if the requested index was out of bounds
}

-(void)addBookmarkEntryNamed:(NSString *)name
{
    BookmarkEntry * newEntry = [[BookmarkEntry alloc] initWithTitle:name];
    [self.collectionOfURLs addObject:newEntry];
}//end addBookmarkEntryNamed()

/*-(void)setURL:(NSURL *)newUrl
{
    if (_url != newUrl) 
    {
        [self configureView];
    }
}*/

//-(void)configureView

@end
