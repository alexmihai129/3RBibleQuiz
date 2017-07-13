//
//  Chinese.h
//  3R Bible Quiz
//
//  Created by Sirisha.G on 06/08/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Chinese : NSManagedObject

@property (nonatomic, retain) NSString * answer;
@property (nonatomic, retain) NSString * biblereference;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * level;
@property (nonatomic, retain) NSString * okindex;
@property (nonatomic, retain) NSString * questionId;
@property (nonatomic, retain) NSString * quiz;

@end
