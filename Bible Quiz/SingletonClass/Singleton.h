//
//  Singleton.h
//  Bible Quiz
//
//  Created by Sirisha.G on 10/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import "SBJSON.h"
@protocol SingletonDelegate <NSObject>
-(void)sendDataToViewController:(id)data;
-(void)sendErrorOccured:(NSError*)error;
@end

@interface Singleton : NSObject
@property (nonatomic,strong) NSMutableArray *selected_Categories;
@property (nonatomic,strong) NSMutableArray *selected_Questions,*selected_RandomQuestions;
@property (nonatomic,strong) NSString       *selected_Level,*selected_Answer;
@property (nonatomic,assign) int randomQues_No,correct_AnswerQues,noOfLevel,quesOf,selectedId,noOfRound;
@property (nonatomic) BOOL isReachable;
@property (nonatomic,strong) NSTimer *sixtySec_Timer,*tenSec_Timer;
@property (nonatomic,strong) NSString *entityName;
@property (nonatomic,assign) BOOL isQuestionView,ischeck,isSelect;
@property (nonatomic,assign) float progressval;
@property (nonatomic,strong) Reachability *internetReachable;
@property (nonatomic,assign) id<SingletonDelegate> delegate;

-(void)getMethodWithUrl:(NSString*)url;
+ (Singleton *)sharedSingleton;

@end
