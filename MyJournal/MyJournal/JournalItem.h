//
//  JournalItem.h
//  MyJournal
//
//  Created by Horne, William Austin on 9/17/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JournalItem : NSObject
{
    NSString * title;
    id author;
    NSDate * creationTimeStamp;
    NSDate * lastEditTimeStamp;
    id content; //generic journal item    
}

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) id author;
@property (strong, nonatomic) NSDate * creationTimeStamp;
@property (strong, nonatomic) NSDate * lastEditTimeStamp;
@property (strong, nonatomic) id content; //generic journal item

-(id) init;
-(id) initWithTitle:(NSString *)initialTitle;

@end
