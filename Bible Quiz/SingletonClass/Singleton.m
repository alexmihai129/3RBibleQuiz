//
//  Singleton.m
//  Bible Quiz
//
//  Created by Sirisha.G on 10/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
@synthesize selected_Categories;
@synthesize selected_Questions;
@synthesize selected_Level;
@synthesize selected_RandomQuestions;
@synthesize randomQues_No;
@synthesize selected_Answer;
@synthesize correct_AnswerQues;
@synthesize noOfLevel;
@synthesize delegate;
@synthesize internetReachable;
@synthesize isReachable;
@synthesize quesOf;
@synthesize sixtySec_Timer,tenSec_Timer;
@synthesize isQuestionView;
@synthesize entityName;
@synthesize ischeck;
@synthesize progressval;
@synthesize selectedId;
@synthesize noOfRound;
+ (Singleton *)sharedSingleton
{
    static Singleton *singleton=nil;
    if (singleton==nil) {
        singleton=[[Singleton alloc]init];
    }
    return singleton;
}
- (id)init
{
    self=[super init];
    if (self) {
        selected_Categories=[[NSMutableArray alloc]init];
        selected_Questions=[[NSMutableArray alloc]init];
        selected_RandomQuestions=[[NSMutableArray alloc]init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkNetworkStatus:) name:kReachabilityChangedNotification object:nil];
        
        internetReachable = [Reachability reachabilityForInternetConnection] ;
        [internetReachable startNotifier];
        [self checkNetworkStatus:nil];
    }
    return self;
}
-(void) checkNetworkStatus:(NSNotification *)notice
{
    // called after network status changes
    NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
    switch (internetStatus)
    {
        case NotReachable:
        {
            NSLog(@"The internet is down.");
            isReachable = NO;
            
            break;
        }
        case ReachableViaWiFi:
        {
            NSLog(@"The internet is working via WIFI.");
            isReachable = YES;
            
            break;
        }
        case ReachableViaWWAN:
        {
            NSLog(@"The internet is working via WWAN.");
            isReachable = YES;
            
            break;
        }
    }
}
-(void)getMethodWithUrl:(NSString*)url
{
        NSError *error=nil;
        NSURL *getUrl=[NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
        NSData *receivedData=[NSData dataWithContentsOfURL:getUrl options:NSDataReadingMappedAlways error:&error];
        if (error==nil) {
            NSString *response=[[NSString alloc]initWithData:receivedData encoding:NSUTF8StringEncoding];
            
            SBJSON *parser=[[SBJSON alloc]init];
            NSDictionary *dataDict=[parser objectWithString:response error:nil];
                [self.delegate sendDataToViewController:dataDict];
        }
        else{
            [self.delegate sendErrorOccured:error];
        }
}
@end
