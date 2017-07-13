//
//  HomeViewController.h
//  Bible Quiz
//
//  Created by Sirisha.G on 09/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewController.h"
#import "HelpViewController.h"
#import "PlayViewController.h"
#import "AppDelegate.h"
#import "Singleton.h"
#import "Fonts.h"
#import "MBProgressHUD.h"
#import "English.h"
#import "French.h"
#import "Spanish.h"
#import "Germen.h"
#import "Chinese.h"
#import "Portuguese.h"
#import "Russian.h"
#import "Italian.h"
#import "Arabic.h"
@class AppDelegate;
@class InfoViewController;
@class HelpViewController;
@class PlayViewController;
@interface HomeViewController : UIViewController<SingletonDelegate,MBProgressHUDDelegate>

@property (nonatomic,strong) IBOutlet UIImageView *background_Img,*bottom_Img;
@property (nonatomic,strong) IBOutlet UILabel *info_Lab,*help_Lab,*play_Lab;
@property (nonatomic,strong) NSManagedObjectContext *managesObjectContext;
@property (nonatomic,strong) InfoViewController *infoViewController;
@property (nonatomic,strong) HelpViewController *helpViewcontroller;
@property (nonatomic,strong) PlayViewController *playViewcontroller;
@property (nonatomic,strong) AppDelegate *appdelegate;
@property (nonatomic,strong) Singleton *singletonObject;
@property (nonatomic,strong) MBProgressHUD *loding_view;

@property (nonatomic,strong) English *english;
@property (nonatomic,strong) French  *french;
@property (nonatomic,strong) Spanish *spanish;
@property (nonatomic,strong) Germen *germen;
@property (nonatomic,strong) Portuguese  *portuguese;
@property (nonatomic,strong) Chinese *chinese;
@property (nonatomic,strong) Russian *russian;
@property (nonatomic,strong) Italian *italian;
@property (nonatomic,strong) Arabic *arabic;
@end
