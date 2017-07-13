//
//  ScoreDisplayViewController.h
//  Bible Quiz
//
//  Created by Sirisha.G on 16/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Score.h"
#import "Fonts.h"
#import "Singleton.h"
#import "InAppPurchase.h"
#import "CustomTableViewCell.h"
@class AppDelegate;
@interface ScoreDisplayViewController : UIViewController<UIWebViewDelegate,InAppPurchaseDelegate,UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong) IBOutlet UILabel *heading_Lab,*access_Lab,*restart_Lab,*play_Lab,*upgrade_Lab;
@property (nonatomic,strong) IBOutlet UIImageView *background_ImgView;
@property (nonatomic,strong) IBOutlet UITableView *scoreTable;
@property (nonatomic,strong) NSMutableArray *resultArray;
@property (nonatomic,strong) IBOutlet UIButton *upgrade_Btn;
@property (nonatomic,strong) AppDelegate *appdelegate;
@property (nonatomic,strong) Score *score;
@property (nonatomic,strong) Singleton *singletonClass;
@property (nonatomic,strong) InAppPurchase *inAppPurchase;
@end
