//
//  JournalItem.m
//  MyJournal
//
//  Created by Horne, William Austin on 9/17/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "JournalItem.h"

@implementation JournalItem

@synthesize title = _title;
@synthesize author = _author;
@synthesize creationTimeStamp = _creationDateTimeStamp;
@synthesize lastEditTimeStamp = _lastEditTimeStamp;
@synthesize content = _content;

-(id) init
{
    if(self = [super init])
    {
        self.title = @"No title";
        self.author = nil;
        self.content = nil;
        self.creationTimeStamp = [[NSDate alloc] init];
        self.lastEditTimeStamp = [[NSDate alloc] init];
    }
    return self;
}

-(id) initWithTitle:(NSString *)initialTitle
{
    self = [self init];
    self.title = [NSString stringWithString:initialTitle];
    return self;
}

@end
