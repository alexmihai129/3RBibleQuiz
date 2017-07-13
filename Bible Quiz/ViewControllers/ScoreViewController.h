//
//  ScoreViewController.h
//  Bible Quiz
//
//  Created by Sirisha.G on 15/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "Singleton.h"
#import "Fonts.h"
#import "Score.h"
#import "ScoreDisplayViewController.h"
#import "InAppPurchase.h"
#import "GADBannerView.h"
#import "GADAdSize.h"

@class AppDelegate;
@class ScoreDisplayViewController;
@interface ScoreViewController : UIViewController<UITextFieldDelegate,InAppPurchaseDelegate>

@property (nonatomic,strong) IBOutlet UILabel *scroe_Lab,*heading_Lab,*message_Lab,*scroe_Name_Lab,*name_Lab,*access_Lab,*restart_Lab,*submit_Lab,*play_Lab,*upgrade_Lab;
@property (nonatomic,strong) IBOutlet UITextField *name_TextField;
@property (nonatomic,strong) IBOutlet UIImageView *background_ImgView;
@property (nonatomic,strong) IBOutlet UIButton *upgrade_Btn;
@property (nonatomic,strong) NSManagedObjectContext *nsmanagedObjectContext;
@property (nonatomic,strong) Singleton *singletonClass;
@property (nonatomic,strong) AppDelegate *appdelegate;
@property (nonatomic,strong) Score *scroe;
@property (nonatomic,strong) ScoreDisplayViewController *scoreDisplayViewController;
@property (nonatomic,strong) InAppPurchase *inAppPurchase;
@property (nonatomic, strong) GADBannerView *gadBannerView;

- (IBAction)hideKeyBoard:(id)sender;

@end
