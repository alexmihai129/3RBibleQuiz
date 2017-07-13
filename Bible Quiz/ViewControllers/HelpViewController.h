//
//  HelpViewController.h
//  Bible Quiz
//
//  Created by Sirisha.G on 10/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "TTTAttributedLabel.h"
#import "InfoViewController.h"
#import "PlayViewController.h"
@class InfoViewController;
@class PlayViewController;
@interface HelpViewController : UIViewController

@property (nonatomic,strong) IBOutlet UIImageView *background_Img,*bottom_Img;
@property (nonatomic,strong) IBOutlet UILabel *info_Lab,*play_Lab;
@property (nonatomic,strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) IBOutlet UILabel *heading_Lab;
@property (nonatomic,strong) IBOutlet TTTAttributedLabel *info_lab;
@property (nonatomic,strong) InfoViewController *infoViewController;
@property (nonatomic,strong) PlayViewController *playViewController;
@end
