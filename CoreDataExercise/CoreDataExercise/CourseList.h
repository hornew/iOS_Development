//
//  CourseList.h
//  CoreDataExercise
//
//  Created by Horne, William Austin on 10/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CourseList : NSManagedObject

@property (nonatomic, retain) NSString * department;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) NSString * title;

@end
