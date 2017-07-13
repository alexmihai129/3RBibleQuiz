//
//  QuestionsDisplayViewController.h
//  Bible Quiz
//
//  Created by Sirisha.G on 10/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "Singleton.h"
#import "BibleClass.h"
#import "ScoreViewController.h"
#import "Fonts.h"
#import "ScoreDisplayViewController.h"
#import "TTTAttributedLabel.h"
#import "DDProgressView.h"
@class AppDelegate;
@class ScoreViewController;
@interface QuestionsDisplayViewController : UIViewController
{
    UIAlertView *alert;
    BOOL isInteract;
}


@property (nonatomic,strong) IBOutlet TTTAttributedLabel *optionA_Lab,*optionB_Lab,*optionC_Lab,*optionD_Lab,*optionE_Lab;
@property (nonatomic,strong)IBOutlet UILabel *levelNo_Lab,*question_Lab,*restart_Lab,*submit_Lab,*questionNo_Lab,*rounds_Lab;
@property (nonatomic,strong) IBOutlet UIButton *optionA_Btn,*optionB_Btn,*optionC_Btn,*optionD_Btn,*optionE_Btn,*submit_Btn;
@property (nonatomic,strong) IBOutlet UIImageView *background_ImgView;
@property (nonatomic,strong) IBOutlet UIProgressView *progressView;
@property (nonatomic,strong) IBOutlet UIScrollView *scrollview;
@property (nonatomic,strong) NSMutableArray *optionsArray_Btns,*optionArray_Labs,*optionArray_Imgs;
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong) NSArray *noOfOptions;
@property (nonatomic,assign) int quesOf;
@property (nonatomic,assign) BOOL ischeck;

@property (nonatomic,strong) AppDelegate *appdelegate;
@property (nonatomic,strong) ScoreViewController *scroeViewController;
@property (nonatomic,strong) Singleton   *singletonClass;
@property (nonatomic,strong) BibleClass  *bible_Class;

- (void)shaowAlert:(NSString*)message tag:(int)tag button:(NSArray *)buttons;
- (void)images_OptionsBtns;
@end
