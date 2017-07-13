//
//  LevelsViewController.h
//  Bible Quiz
//
//  Created by Sirisha.G on 10/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionsDisplayViewController.h"
#import "Singleton.h"
#import "AppDelegate.h"
#import "BibleClass.h"
#import "InAppPurchase.h"
#import "English.h"
#import "GADBannerView.h"
#import "GADAdSize.h"
@class QuestionsDisplayViewController;
@class AppDelegate;
@interface LevelsViewController : UIViewController<InAppPurchaseDelegate>


@property (nonatomic,strong) IBOutlet UIButton *easy_Btn,*intermediate_Btn,*advanced_Btn,*buy_Btn;
@property (nonatomic,strong) IBOutlet UILabel  *easy_Lab,*intermediate_Lab,*advanced_Lab,*noOfRounds_Lab,*heading_Lab,*noOfLevels,*restart_Lab,*buy_Lab,*play_Lab;
@property (nonatomic,strong) IBOutlet UIImageView *background_ImgView;
@property (nonatomic,strong) NSMutableArray *images;
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic,strong) QuestionsDisplayViewController *questionsViewController;
@property (nonatomic,strong) Singleton *singletonClass;
@property (nonatomic,strong) AppDelegate *appdelegate;
@property (nonatomic,strong) English       *bible_DB;
@property (nonatomic,strong) BibleClass  *bible_Class;
@property (nonatomic,strong) InAppPurchase *inAppPurchase;
@property (nonatomic, strong) GADBannerView *gadBannerView;
@property (nonatomic,assign) int tags;
@property (nonatomic,assign) BOOL isUpgrade;

- (void)showAlert:(NSString*)message tag:(int)tag button:(NSArray *)buttons;
- (IBAction)buy_Btn_Action:(id)sender;
- (IBAction)restore_BtnAction:(id)sender;

@end
