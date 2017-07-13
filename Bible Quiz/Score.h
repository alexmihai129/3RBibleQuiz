//
//  Score.h
//  3R Bible Quiz
//
//  Created by Sirisha.G on 06/08/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Score : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * score;

@end
