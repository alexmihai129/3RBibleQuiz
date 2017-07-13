//
//  PlayViewController.h
//  Bible Quiz
//
//  Created by Sirisha.G on 10/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LevelsViewController.h"
#import "Singleton.h"
#import "Fonts.h"
@class LevelsViewController;
@interface PlayViewController : UIViewController


@property (nonatomic,strong) IBOutlet UIButton *people_Btn,*places_Btn,*events_Btn,*statements_Btn,*miscellaneous_Btn,*selectall_Btn;
@property (nonatomic,strong) IBOutlet UILabel *people_Lab,*places_Lab,*events_Lab,*statements_Lab,*miscellaneous_Lab,*selectall_Lab,*heading_Lab,*noOfCategories,*restart_Lab,*play_Lab;
@property (nonatomic,strong) IBOutlet UIImageView *background_ImgView;
@property (nonatomic,strong)NSMutableArray *controllersArray,*images;
@property (nonatomic,strong)NSArray *categoriesArray;

@property (nonatomic,strong)LevelsViewController *levelViewController;
@property (nonatomic,strong)Singleton *singletonClass;

- (void)shaowAlert:(NSString*)message tag:(int)tag button:(NSArray *)buttons;
- (IBAction)restart_Btn_Action:(id)sender;
- (IBAction)playButton_Action:(id)sender;

@end
