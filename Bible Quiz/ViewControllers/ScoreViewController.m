//
//  ScoreViewController.m
//  Bible Quiz
//
//  Created by Sirisha.G on 15/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *star_lbl;
@property (strong, nonatomic) IBOutlet UIButton *rate_btn;
@property (strong, nonatomic) IBOutlet UILabel *rate_lbl;
- (IBAction)rate_BtnClicked:(id)sender;

@end

@implementation ScoreViewController
@synthesize scroe_Lab;
@synthesize singletonClass;
@synthesize heading_Lab,message_Lab,scroe_Name_Lab,name_Lab,access_Lab;
@synthesize name_TextField;
@synthesize nsmanagedObjectContext;
@synthesize appdelegate;
@synthesize scroe;
@synthesize scoreDisplayViewController;
@synthesize inAppPurchase;
@synthesize background_ImgView;
@synthesize restart_Lab,submit_Lab,play_Lab;
@synthesize upgrade_Lab,upgrade_Btn,gadBannerView;
@synthesize rate_btn,rate_lbl,star_lbl;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    	// Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:YES];
    if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
//        If arabic language buttons and text should be aligned to right
        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
//            If device is iPhone
            [self.scroe_Name_Lab setFrame:CGRectMake(179, 123, 115, 25)];
            [self.name_Lab setFrame:CGRectMake(179, 171, 118, 25)];
            
            [self.scroe_Lab setFrame:CGRectMake(92, 131, 115, 28)];
            [self.name_TextField setFrame:CGRectMake(92, 179, 118, 28)];
            
        }else {
//            If device is iPad
            [self.scroe_Name_Lab setFrame:CGRectMake(500, 318, 151, 56)];
            [self.name_Lab setFrame:CGRectMake(500, 398, 151, 56)];
            
            [self.scroe_Lab setFrame:CGRectMake(198, 309, 243, 72)];
            [self.name_TextField setFrame:CGRectMake(198, 391, 289, 61)];
        }
        
        [self.scroe_Name_Lab setTextAlignment:NSTextAlignmentRight];
        [self.name_Lab setTextAlignment:NSTextAlignmentRight];
        [self.scroe_Lab setTextAlignment:NSTextAlignmentRight];
        [self.name_TextField setTextAlignment:NSTextAlignmentRight];
        [self.message_Lab setTextAlignment:NSTextAlignmentRight];
        
    }else {
//        for language other than arabic buttons and text should be aligned to left
        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
//            If device is iPhone
            [self.scroe_Name_Lab setFrame:CGRectMake(20, 143, 150, 25)];
            [self.name_Lab setFrame:CGRectMake(20, 191, 150, 25)];
            
            [self.scroe_Lab setFrame:CGRectMake(178, 143, 115, 28)];
            [self.name_TextField setFrame:CGRectMake(178, 182, 118, 28)];
            
        }else {
//            If device is iPad
            [self.scroe_Name_Lab setFrame:CGRectMake(40, 318, 294, 56)];
            [self.name_Lab setFrame:CGRectMake(40, 398, 294, 56)];
            
            [self.scroe_Lab setFrame:CGRectMake(361, 309, 243, 72)];
            [self.name_TextField setFrame:CGRectMake(361, 391, 289, 61)];
        }
        
        [self.scroe_Name_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.name_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.scroe_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.name_TextField setTextAlignment:NSTextAlignmentLeft];
        [self.message_Lab setTextAlignment:NSTextAlignmentLeft];
    }
    heading_Lab.text=NSLocalizedString(@"INSPIRED", nil);
    scroe_Name_Lab.text=NSLocalizedString(@"SCORE", nil);
    name_Lab.text=NSLocalizedString(@"NAME LAB", nil);
    access_Lab.text=NSLocalizedString(@"GET_ACCESS", nil);
    upgrade_Lab.text=NSLocalizedString(@"UPGRADE_VERSION", nil);
    restart_Lab.text=NSLocalizedString(@"RESTART", nil);
    submit_Lab.text=NSLocalizedString(@"SUBMIT", nil);
    play_Lab.text=NSLocalizedString(@"PLAY", nil);
//    if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"])
//    {
//        heading_Lab.textAlignment=NSTextAlignmentRight;
//    }
//    else
//    {
        heading_Lab.textAlignment=NSTextAlignmentCenter;
    //}
    
    if (!singletonClass) {
        singletonClass=[Singleton sharedSingleton];
    }
    message_Lab.adjustsFontSizeToFitWidth=YES;
    scroe_Lab.text=[NSString stringWithFormat:@"%i %@",(self.singletonClass.correct_AnswerQues*100)/15,@"%"];
    if ((self.singletonClass.correct_AnswerQues*100)/15 <40) {
        message_Lab.text=[NSString stringWithFormat:NSLocalizedString(@"LESS_THAN_40", nil)];
    }
    else if ((self.singletonClass.correct_AnswerQues*100)/15 ==40) {
        message_Lab.text=[NSString stringWithFormat:NSLocalizedString(@"EQUAL_40", nil)];
    }
    else if((self.singletonClass.correct_AnswerQues*100)/15>40 &&(self.singletonClass.correct_AnswerQues*100)/15<60)
    {
      message_Lab.text=[NSString stringWithFormat:NSLocalizedString(@"LESS_THAN_60", nil)];
    }
    else if((self.singletonClass.correct_AnswerQues*100)/15==60)
    {
        message_Lab.text=[NSString stringWithFormat:NSLocalizedString(@"EQUAL_60", nil)];
    }
    else if((self.singletonClass.correct_AnswerQues*100)/15>60 && (self.singletonClass.correct_AnswerQues*100)/15<=80)
    {
        message_Lab.text=[NSString stringWithFormat:NSLocalizedString(@"LESS_THAN_80", nil)];
    }
    else if((self.singletonClass.correct_AnswerQues *100)/15>80 &&(self.singletonClass.correct_AnswerQues*100)/15<100)
    {
        message_Lab.text=[NSString stringWithFormat:NSLocalizedString(@"GREATER_THAN_80", nil)];
    }
    else if((self.singletonClass.correct_AnswerQues*100)/15==100)
    {
       message_Lab.text=[NSString stringWithFormat:NSLocalizedString(@"EQUAL_100", nil)];
    }
    else{
        message_Lab.text=@"";
    }
    name_TextField.delegate=self;
    
  
     name_TextField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        rate_lbl.font = RATELABEL_FONT_IPHONE;
        restart_Lab.font=BUTTONS_FONT;
        submit_Lab.font=BUTTONS_FONT;
        play_Lab.font=BUTTONS_FONT;
        heading_Lab.font=Heading_FONT_Iphone;
        scroe_Lab.font=SCORELABEL_FONT_IPHONE;
        scroe_Name_Lab.font=SCORELABEL_FONT_IPHONE;
        name_Lab.font=SCORELABEL_FONT_IPHONE;
        upgrade_Lab.font=UPGRADE_BTN_FONT;
        access_Lab.font=ACCESSLABEL_FONT;
        message_Lab.font=MESSAGE_FONT_SIZE_IPHONE;
        name_TextField.font=[UIFont fontWithName:BOLd size:20];
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        
        CGFloat screenHeight = screenRect.size.height;
        if (screenHeight>500) {
            background_ImgView.image=[UIImage imageNamed:@"background_640x1136.png"];
        }
        else
        {
            background_ImgView.image=[UIImage imageNamed:@"background.png"];
        }
//        CGSize size = [message_Lab.text sizeWithAttributes:
//                       @{NSFontAttributeName: message_Lab.font}];
//        CGSize messageframe = CGSizeMake(ceilf(size.width), ceilf(size.height));
        CGSize messageframe=[message_Lab.text sizeWithFont:message_Lab.font constrainedToSize:CGSizeMake(message_Lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:message_Lab.lineBreakMode];
        message_Lab.frame=CGRectMake(message_Lab.frame.origin.x, message_Lab.frame.origin.y, message_Lab.frame.size.width, messageframe.height+30);
        
        if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
            //        If arabic language buttons and text should be aligned to right
            [self.scroe_Name_Lab setFrame:CGRectMake(179, message_Lab.frame.origin.y + message_Lab.frame.size.height + 15, 115, 25)];
            [self.name_Lab setFrame:CGRectMake(179, self.scroe_Name_Lab.frame.origin.y + self.scroe_Name_Lab.frame.size.height + 12, 118, 25)];
            
            [self.scroe_Lab setFrame:CGRectMake(92, message_Lab.frame.origin.y + message_Lab.frame.size.height + 15, 115, 28)];
            [self.name_TextField setFrame:CGRectMake(92, self.scroe_Name_Lab.frame.origin.y + self.scroe_Name_Lab.frame.size.height + 12, 118, 28)];
            
            
            [self.scroe_Name_Lab setTextAlignment:NSTextAlignmentRight];
            [self.name_Lab setTextAlignment:NSTextAlignmentRight];
            [self.scroe_Lab setTextAlignment:NSTextAlignmentRight];
            [self.name_TextField setTextAlignment:NSTextAlignmentRight];
            [self.message_Lab setTextAlignment:NSTextAlignmentRight];
            
        }else {
            //        for language other than arabic buttons and text should be aligned to left
            [self.scroe_Name_Lab setFrame:CGRectMake(20, message_Lab.frame.origin.y + message_Lab.frame.size.height + 15, 150, 25)];
            [self.name_Lab setFrame:CGRectMake(20, self.scroe_Name_Lab.frame.origin.y + self.scroe_Name_Lab.frame.size.height + 12, 150, 25)];
            
            [self.scroe_Lab setFrame:CGRectMake(178, message_Lab.frame.origin.y + message_Lab.frame.size.height + 15, 115, 28)];
            [self.name_TextField setFrame:CGRectMake(178, self.scroe_Name_Lab.frame.origin.y + self.scroe_Name_Lab.frame.size.height + 12, 118, 28)];
            
            [self.scroe_Name_Lab setTextAlignment:NSTextAlignmentLeft];
            [self.name_Lab setTextAlignment:NSTextAlignmentLeft];
            [self.scroe_Lab setTextAlignment:NSTextAlignmentLeft];
            [self.name_TextField setTextAlignment:NSTextAlignmentLeft];
            [self.message_Lab setTextAlignment:NSTextAlignmentLeft];
        }
        
        [self.rate_lbl setFrame:CGRectMake(0, self.name_Lab.frame.origin.y + self.name_Lab.frame.size.height + 20, 320, 37)];
        [self.star_lbl setFrame:CGRectMake(18, self.rate_lbl.frame.origin.y + self.rate_lbl.frame.size.height, 289, 47)];
        [self.rate_btn setFrame:CGRectMake(18, self.rate_lbl.frame.origin.y + self.rate_lbl.frame.size.height, 289, 47)];

//        CGSize access_size = [NSLocalizedString(@"GET_ACCESS", nil) sizeWithAttributes:
//                       @{NSFontAttributeName: access_Lab.font}];
//        CGSize accessframe = CGSizeMake(ceilf(access_size.width), ceilf(access_size.height));
        CGSize accessframe=[NSLocalizedString(@"GET_ACCESS", nil) sizeWithFont:access_Lab.font constrainedToSize:CGSizeMake(access_Lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:access_Lab.lineBreakMode];
//        CGSize upgrade_size = [NSLocalizedString(@"UPGRADE_VERSION", nil) sizeWithAttributes:
//                              @{NSFontAttributeName: upgrade_Lab.font}];
//        CGSize upgrade = CGSizeMake(ceilf(upgrade_size.width), ceilf(upgrade_size.height));

        CGSize upgrade=[NSLocalizedString(@"UPGRADE_VERSION", nil) sizeWithFont:upgrade_Lab.font constrainedToSize:CGSizeMake(access_Lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:upgrade_Lab.lineBreakMode];
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"fr"] || ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"es"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"de"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt-PT"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"]) ||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"it"]) ||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"])) {
          if (screenHeight>500) {
        access_Lab.frame=CGRectMake(access_Lab.frame.origin.x, self.rate_btn.frame.origin.y + self.scroe_Name_Lab.frame.size.height + 30, access_Lab.frame.size.width, accessframe.height);
        upgrade_Lab.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
        upgrade_Btn.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
    
          }
          else{
              access_Lab.frame=CGRectMake(access_Lab.frame.origin.x, self.rate_btn.frame.origin.y + self.scroe_Name_Lab.frame.size.height + 30, access_Lab.frame.size.width, accessframe.height);
              upgrade_Lab.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
              upgrade_Btn.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
          }
        }
        else
        {
             if (screenHeight>500) {
            access_Lab.frame=CGRectMake(access_Lab.frame.origin.x, access_Lab.frame.origin.y+80, access_Lab.frame.size.width, accessframe.height);
            upgrade_Lab.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
            upgrade_Btn.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
             }
            else
            {
                access_Lab.frame=CGRectMake(access_Lab.frame.origin.x, access_Lab.frame.origin.y+60, access_Lab.frame.size.width, accessframe.height);
                upgrade_Lab.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
                 upgrade_Btn.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
            }
        }
    }
    else
    {
        rate_lbl.font = RATELABEL_FONT_IPAD;
        restart_Lab.font=BUTTONS_FONT_IPAD;
        submit_Lab.font=BUTTONS_FONT_IPAD;
        play_Lab.font=BUTTONS_FONT_IPAD;
        heading_Lab.font=Heading_FONT_IPAD;
        scroe_Lab.font=SCORELABEL_FONT_IPAD;
        scroe_Name_Lab.font=SCORELABEL_FONT_IPAD;
        name_Lab.font=SCORELABEL_FONT_IPAD;
        upgrade_Lab.font=UPGRADE_BTN_FONT_IPAD;
        access_Lab.font=ACCESSLABEL_FONT_IPAD;
        message_Lab.font=MESSAGE_FONT_SIZE_IPAD;
        name_TextField.font=[UIFont fontWithName:BOLd size:50];
//        CGSize size = [message_Lab.text sizeWithAttributes:
//                       @{NSFontAttributeName: message_Lab.font }];
//        CGSize messageframe = CGSizeMake(ceilf(size.width), ceilf(size.height));
        CGSize messageframe=[message_Lab.text sizeWithFont:message_Lab.font constrainedToSize:CGSizeMake(message_Lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:message_Lab.lineBreakMode];
        message_Lab.frame=CGRectMake(message_Lab.frame.origin.x, message_Lab.frame.origin.y, message_Lab.frame.size.width, messageframe.height);
        
        
       /*
        if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
            //        If arabic language buttons and text should be aligned to right
            
            [self.scroe_Name_Lab setFrame:CGRectMake(500, message_Lab.frame.origin.y + message_Lab.frame.size.height + 30, 151, 56)];
            [self.name_Lab setFrame:CGRectMake(500, self.scroe_Name_Lab.frame.origin.y + self.scroe_Name_Lab.frame.size.height + 24, 151, 56)];
            
            [self.scroe_Lab setFrame:CGRectMake(198, message_Lab.frame.origin.y + message_Lab.frame.size.height + 30, 243, 72)];
            [self.name_TextField setFrame:CGRectMake(198, self.scroe_Name_Lab.frame.origin.y + self.scroe_Name_Lab.frame.size.height + 24, 289, 61)];
            
            
            [self.scroe_Name_Lab setTextAlignment:NSTextAlignmentRight];
            [self.name_Lab setTextAlignment:NSTextAlignmentRight];
            [self.scroe_Lab setTextAlignment:NSTextAlignmentRight];
            [self.name_TextField setTextAlignment:NSTextAlignmentRight];
            [self.message_Lab setTextAlignment:NSTextAlignmentRight];
            
        }else {
            //        for language other than arabic buttons and text should be aligned to left
            
            
            [self.scroe_Name_Lab setFrame:CGRectMake(40, message_Lab.frame.origin.y + message_Lab.frame.size.height + 30, 294, 56)];
            [self.name_Lab setFrame:CGRectMake(40, self.scroe_Name_Lab.frame.origin.y + self.scroe_Name_Lab.frame.size.height + 24, 294, 56)];
            
            [self.scroe_Lab setFrame:CGRectMake(361, message_Lab.frame.origin.y + message_Lab.frame.size.height + 30, 243, 72)];
            [self.name_TextField setFrame:CGRectMake(361, self.scroe_Name_Lab.frame.origin.y + self.scroe_Name_Lab.frame.size.height + 24, 289, 61)];
            
            [self.scroe_Name_Lab setTextAlignment:NSTextAlignmentLeft];
            [self.name_Lab setTextAlignment:NSTextAlignmentLeft];
            [self.scroe_Lab setTextAlignment:NSTextAlignmentLeft];
            [self.name_TextField setTextAlignment:NSTextAlignmentLeft];
            [self.message_Lab setTextAlignment:NSTextAlignmentLeft];
        }
        
        [self.rate_lbl setFrame:CGRectMake(0, self.name_Lab.frame.origin.y + self.name_Lab.frame.size.height + 20, 768, 50)];
        [self.star_lbl setFrame:CGRectMake(79, self.rate_lbl.frame.origin.y + self.rate_lbl.frame.size.height + 10, 611, 89)];
        [self.rate_btn setFrame:CGRectMake(79, self.rate_lbl.frame.origin.y + self.rate_lbl.frame.size.height + 10, 611, 89)];
*/
//        CGSize access_size = [NSLocalizedString(@"GET_ACCESS", nil) sizeWithAttributes:
//                              @{NSFontAttributeName: access_Lab.font}];
//        CGSize accessframe = CGSizeMake(ceilf(access_size.width), ceilf(access_size.height));
        CGSize accessframe=[NSLocalizedString(@"GET_ACCESS", nil) sizeWithFont:access_Lab.font constrainedToSize:CGSizeMake(access_Lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:access_Lab.lineBreakMode];
//        CGSize upgrade_size = [NSLocalizedString(@"UPGRADE_VERSION", nil) sizeWithAttributes:
//                               @{NSFontAttributeName: upgrade_Lab.font}];
//        CGSize upgrade = CGSizeMake(ceilf(upgrade_size.width), ceilf(upgrade_size.height));

        CGSize upgrade=[NSLocalizedString(@"UPGRADE_VERSION", nil) sizeWithFont:upgrade_Lab.font constrainedToSize:CGSizeMake(access_Lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:upgrade_Lab.lineBreakMode];
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"fr"] || ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"es"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"de"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt-PT"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"]) ||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"it"]) ||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"])) {
            access_Lab.frame=CGRectMake(access_Lab.frame.origin.x, access_Lab.frame.origin.y-20, access_Lab.frame.size.width, accessframe.height);
            upgrade_Lab.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height+5, upgrade_Lab.frame.size.width, upgrade.height);
             upgrade_Btn.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height+5, upgrade_Lab.frame.size.width, upgrade.height);
        }
        else{
            access_Lab.frame=CGRectMake(access_Lab.frame.origin.x, access_Lab.frame.origin.y+60, access_Lab.frame.size.width, accessframe.height);
            upgrade_Lab.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
            upgrade_Btn.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
        }
        }
   
    name_TextField.layer.borderColor=[[UIColor redColor]CGColor];
    name_TextField.layer.borderWidth=2.0f;
    name_TextField.delegate=self;
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"purchase"]) {
        access_Lab.hidden=YES;
        upgrade_Lab.hidden=YES;
        upgrade_Btn.hidden=YES;
    }
    else
    {
        access_Lab.hidden=NO;
        upgrade_Lab.hidden=NO;
        upgrade_Btn.hidden=NO;
    }
    restart_Lab.adjustsFontSizeToFitWidth=YES;
    submit_Lab.adjustsFontSizeToFitWidth=YES;
    play_Lab.adjustsFontSizeToFitWidth  =YES;
    [self addsDisplay];
    
    self.rate_lbl.text = NSLocalizedString(@"Rate This App", nil);
    self.star_lbl.text = @"\u2605\u2605\u2605\u2605\u2605";
    
    
    NSLog(@"%s : %@",__func__,NSStringFromCGRect(access_Lab.frame));
}
- (void)addsDisplay
{
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        CGFloat screenWidth = screenRect.size.width;
        
        if( screenHeight > 480 && screenHeight < 667 ){
            NSLog(@"iPhone 5/5s");
            gadBannerView = [[GADBannerView alloc]
                             initWithFrame:CGRectMake(0.0,
                                                      475,
                                                      GAD_SIZE_320x50.width,
                                                      GAD_SIZE_320x50.height)];
        } else if ( screenHeight > 480 && screenHeight < 736 ){
            NSLog(@"iPhone 6:%f",self.view.frame.size.width);
            gadBannerView = [[GADBannerView alloc]
                             initWithFrame:CGRectMake((screenWidth-320)/2,
                                                      573,
                                                      self.view.frame.size.width,
                                                      GAD_SIZE_320x50.height)];
            
        } else if ( screenHeight > 480 ){
            NSLog(@"iPhone 6 Plus");
            gadBannerView = [[GADBannerView alloc]
                             initWithFrame:CGRectMake((screenWidth-320)/2,
                                                      642,
                                                      self.view.frame.size.width,
                                                      GAD_SIZE_320x50.height)];
            
        } else {
            NSLog(@"iPhone 4/4s");
            gadBannerView = [[GADBannerView alloc]
                             initWithFrame:CGRectMake(0.0,
                                                      390,
                                                      GAD_SIZE_320x50.width,
                                                      GAD_SIZE_320x50.height)];
        }
        
    }
    else
    {
        gadBannerView = [[GADBannerView alloc]
                         initWithFrame:CGRectMake(0.0,
                                                  890,
                                                  768,
                                                  GAD_SIZE_320x50.height)];
    }
    gadBannerView.adUnitID=ADMOB_ID;
    gadBannerView.rootViewController=self;
    [self.view addSubview:gadBannerView];
    [gadBannerView loadRequest:[GADRequest request]];
    
    
}

#pragma mark PLAY BUTTON ACTION
- (IBAction)playBtn_Action:(id)sender
{
    if (!self.singletonClass) {
        self.singletonClass=[Singleton sharedSingleton];
    }
    self.singletonClass.correct_AnswerQues=0;
    if ([self.singletonClass.selected_Questions count]>15) {
        self.singletonClass.noOfRound++;
         [self.navigationController popViewControllerAnimated:NO];
    }
    else{
        self.singletonClass.noOfRound=0;
        NSArray *view=[self.navigationController viewControllers];
        UIViewController *viewControl=[view objectAtIndex:[view count]-4];
        [self.navigationController popToViewController:viewControl animated:YES];
    }
}
#pragma mark SUBMIT BUTTON ACTION
- (IBAction)submit_Btn_Action:(id)sender
{
    if ([name_TextField.text length]==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Bible Quiz" message:NSLocalizedString(@"SCORE_NAME", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"OKAY", nil) otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        int scores=(self.singletonClass.correct_AnswerQues *100)/15;
        appdelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        nsmanagedObjectContext=appdelegate.managedObjectContext;
        NSError *error = nil;
        NSFetchRequest *request1 = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity1 = [NSEntityDescription entityForName:@"Score" inManagedObjectContext:nsmanagedObjectContext];
        [request1 setEntity:entity1];
        NSArray *scoreDetail = [[nsmanagedObjectContext executeFetchRequest:request1 error:&error] mutableCopy];
        NSSortDescriptor *sortDescriptor = [[ NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
        NSSortDescriptor *dateSortDescriptor = [[ NSSortDescriptor alloc] initWithKey:@"date" ascending:NO];
        NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor,dateSortDescriptor, nil];
        [request1 setSortDescriptors:sortDescriptors];
        NSArray *finalResult = [scoreDetail sortedArrayUsingDescriptors:sortDescriptors];
        NSMutableArray *array=[NSMutableArray arrayWithArray:finalResult];
        if ([array count]>=10) {
            NSManagedObject *managedObject;
            for (int i=9; i<[array count]; i++) {
              
                managedObject=[finalResult objectAtIndex:i];
                [nsmanagedObjectContext deleteObject:managedObject];
                [nsmanagedObjectContext save:&error];
            }
        }
        scroe =(Score *)[NSEntityDescription insertNewObjectForEntityForName:@"Score" inManagedObjectContext:nsmanagedObjectContext];
        [scroe setValue:name_TextField.text forKey:@"name"];
        [scroe setValue:[NSNumber numberWithInt:scores] forKey:@"score"];
        [scroe setValue:[NSDate date] forKey:@"date"];
        if (![nsmanagedObjectContext save:&error]) {
             abort();
        }
        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
            if (SYSTEM_VERSION_LESS_THAN(@"7")) {
                scoreDisplayViewController=[[ScoreDisplayViewController alloc]initWithNibName:@"ScoreDisplayView" bundle:nil];
            }
            else{
                scoreDisplayViewController=[[ScoreDisplayViewController alloc]initWithNibName:@"ScoreDisplayView_iOS7" bundle:nil];
            }
            
        }
        else{
            if (SYSTEM_VERSION_LESS_THAN(@"7")) {
                 scoreDisplayViewController=[[ScoreDisplayViewController alloc]initWithNibName:@"ScoreDisplayView_Ipad" bundle:nil];
            }
            else
            {
                 scoreDisplayViewController=[[ScoreDisplayViewController alloc]initWithNibName:@"ScoreDisplayViewiOS7_iPad" bundle:nil];
            }
           
        }
        [self.navigationController pushViewController:scoreDisplayViewController animated:YES];
    }
}
#pragma mark RESTART BUTTON ACTION
- (IBAction)restart_Btn_Action:(id)sender
{
    if (!self.singletonClass) {
        self.singletonClass=[Singleton sharedSingleton];
    }
    [self.singletonClass.selected_Categories removeAllObjects];
    [self.singletonClass.selected_Questions removeAllObjects];
    [self.singletonClass.selected_RandomQuestions removeAllObjects];
    self.singletonClass.selected_Level=@"";
    self.singletonClass.selected_Answer=@"";
    self.singletonClass.randomQues_No=0;
    self.singletonClass.correct_AnswerQues=0;
    self.singletonClass.noOfLevel=0;
    self.singletonClass.progressval=0.0;
    self.singletonClass.selectedId=nil;
    self.singletonClass.isSelect=NO;
    self.singletonClass.noOfRound=0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark UPGRADE BUTTON ACTION
- (IBAction)upgradeVersion_Btn_Action:(id)sender
{
    
    inAppPurchase = [InAppPurchase SharedInApp];
    inAppPurchase.delegate=self;
    [inAppPurchase purchaseProduct:[NSString stringWithFormat:INAPPPURCHASE_PRODUCT]];
}
#pragma  mark INAPP PURCHASE DELEGATE METHODS
-(void)purchaseCompleted:(id)sender
{
    NSUserDefaults *userdefaults=[NSUserDefaults standardUserDefaults];
    [userdefaults setValue:@"purchase" forKey:@"purchase"];
    [userdefaults synchronize];
    access_Lab.hidden=YES;
    upgrade_Lab.hidden=YES;
    upgrade_Btn.hidden=YES;
}
-(void)errorOccured:(NSError*)error
{
    NSLog(@"error");
}
#pragma mark textfield delegate methods
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    textField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField==name_TextField) {
       
            if ([textField.text length]==0 && [string isEqualToString:@" "])
                return NO;
            NSUInteger oldLength = [textField.text length];
            NSUInteger replacementLength = [string length];
            NSUInteger rangeLength = range.length;
            NSUInteger newLength = oldLength - rangeLength + replacementLength;
            
            return newLength <11 ;
        return NO;
    }
    return YES;
}

- (IBAction)hideKeyBoard:(id)sender
{
    [name_TextField resignFirstResponder];
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    }
    else{
        return NO;
    }
    
}
- (void)viewDidUnload
{
    scoreDisplayViewController=nil;
    [super viewDidUnload];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rate_BtnClicked:(id)sender {
//    https://itunes.apple.com/nl/app/3r-bible-quiz/id638693246?mt=8
    
    /*
     (Xcode 5 - iOS 7 - Device!):
     
     itms-apps://itunes.apple.com/app/idYOUR_APP_ID
     
     
     For versions lower than iOS 7 use the old one:
     
     itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=YOUR_APP_ID
     */
    
    
    // http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=638693246&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8
    
    NSString *urlStr = [NSString stringWithFormat:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=638693246&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8" ];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
}
@end
