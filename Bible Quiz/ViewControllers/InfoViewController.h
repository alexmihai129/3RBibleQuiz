//
//  InfoViewController.h
//  Bible Quiz
//
//  Created by Sirisha.G on 09/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "TTTAttributedLabel.h"
#import "HelpViewController.h"
#import "PlayViewController.h"
@class HelpViewController;
@interface InfoViewController : UIViewController<UIAlertViewDelegate>


@property (nonatomic,strong) IBOutlet UIImageView *background_Img,*bottom_Img;
@property (nonatomic,strong) IBOutlet UILabel *help_Lab,*play_Lab;
@property (nonatomic,strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) IBOutlet UILabel *heading_Lab;
@property (nonatomic,strong) IBOutlet TTTAttributedLabel *info_lab;
@property (nonatomic,strong) HelpViewController *helpViewController;
@property (nonatomic,strong) PlayViewController *playViewController;
@end
