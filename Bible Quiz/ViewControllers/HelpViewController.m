//
//  HelpViewController.m
//  Bible Quiz
//
//  Created by Sirisha.G on 10/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import "HelpViewController.h"
#import "NSAttributedString+Attributes.h"
@interface HelpViewController ()

@end

@implementation HelpViewController

@synthesize background_Img,bottom_Img;
@synthesize info_lab;
@synthesize scrollView;
@synthesize heading_Lab;
@synthesize infoViewController;
@synthesize playViewController;
@synthesize info_Lab,play_Lab;
 int size;
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
    info_Lab.text=NSLocalizedString(@"INFO", nil);
    play_Lab.text=NSLocalizedString(@"PLAY", nil);
    heading_Lab.text=NSLocalizedString(@"HEADING_TEXT", nil);
    info_Lab.adjustsFontSizeToFitWidth=YES;
    play_Lab.adjustsFontSizeToFitWidth=YES;
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        info_Lab.font=BUTTONS_FONT;
        play_Lab.font=BUTTONS_FONT;
        heading_Lab.font=CHALLENGE_FONT_IPHONE;
        size=16;
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        if (screenHeight>500) {
            background_Img.image=[UIImage imageNamed:@"background_640x1136.png"];
        }
        else
        {
            background_Img.image=[UIImage imageNamed:@"background.png"];
        }
    }
    else{
        info_Lab.font=BUTTONS_FONT_IPAD;
        play_Lab.font=BUTTONS_FONT_IPAD;
        heading_Lab.font=CHALLENGE_FONT_IPAD;
        size=20;
    }

    [self displayInstructions];
}
#pragma mark DISPLAY HELP
- (void)displayInstructions
{
    
    info_lab.numberOfLines = 0;
    NSString *heading=[NSString stringWithFormat:NSLocalizedString(@"HELP_HEADING", nil)];
    NSString *details=[[NSString stringWithFormat:NSLocalizedString(@"HELP_DETAILS", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *categoriesSel=[[NSString stringWithFormat:NSLocalizedString(@"CATEGORIES_SELECT", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *afterCat=[[NSString stringWithFormat:NSLocalizedString(@"AFTER_CATEGORY", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *level=[[NSString stringWithFormat:NSLocalizedString(@"LEVEL", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *afterLevel=[[NSString stringWithFormat:NSLocalizedString(@"AFTER_LEVEL", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *levelname=[[NSString stringWithFormat:NSLocalizedString(@"LEVEL_NAME", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *afterlevelName=[[NSString stringWithFormat:NSLocalizedString(@"AFT_LEVEL_NAME", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *buyStr=[[NSString stringWithFormat:NSLocalizedString(@"BUY", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *afterBuy=[[NSString stringWithFormat:NSLocalizedString(@"AFT_BUY", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *upgrade=[[NSString stringWithFormat:NSLocalizedString(@"UPGRADE", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *endStr=[[NSString stringWithFormat:NSLocalizedString(@"END_STR", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *credits=[NSString stringWithFormat:NSLocalizedString(@"CREDITS", nil)];
    NSString *authers_Details=[[NSString stringWithFormat:NSLocalizedString(@"AUTHER_DETAILS", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *endstring=[[NSString stringWithFormat:NSLocalizedString(@"END_STRING", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *endbold=[[NSString stringWithFormat:NSLocalizedString(@"BIBLE", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *by=[NSString stringWithFormat:NSLocalizedString(@"BY", nil)];
    NSString *endstr=[NSString stringWithFormat:NSLocalizedString(@"NAME", nil)];
    NSString *endall=[[NSString stringWithFormat:NSLocalizedString(@"END", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
      if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"de"]){
    info_lab.text=[NSString stringWithFormat:@"%@ \n%@ %@ %@ %@ %@%@ %@%@ %@%@ %@ \n\n%@\n  %@\n\n%@ %@ %@ %@ %@",heading,details,categoriesSel,afterCat,level,afterLevel,levelname,afterlevelName,buyStr,afterBuy,upgrade,endStr,credits,authers_Details,endstring,endbold,by,endstr,endall];
      }
      else{
          info_lab.text=[NSString stringWithFormat:@"%@ \n%@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ \n\n%@\n  %@\n\n%@ %@ %@ %@ %@",heading,details,categoriesSel,afterCat,level,afterLevel,levelname,afterlevelName,buyStr,afterBuy,upgrade,endStr,credits,authers_Details,endstring,endbold,by,endstr,endall];
      }
    NSRange name1Range=[info_lab.text rangeOfString:heading];
    NSRange name2Range = [info_lab.text rangeOfString:details];
    NSRange categoryRange=[info_lab.text rangeOfString:categoriesSel];
    NSRange aftercatRange=[info_lab.text rangeOfString:afterCat];
    NSRange levelRange=[info_lab.text rangeOfString:level];
    NSRange afterlevelRange=[info_lab.text rangeOfString:afterLevel];
    NSRange levelnameRange=[info_lab.text rangeOfString:levelname];
    NSRange afterlevelnameRange=[info_lab.text rangeOfString:afterlevelName];
    NSRange buyStrRange=[info_lab.text rangeOfString:buyStr];
    NSRange afterBuyRange=[info_lab.text rangeOfString:afterBuy];
    NSRange upgradeRange=[info_lab.text rangeOfString:upgrade];
    NSRange endStrRange=[info_lab.text rangeOfString:endStr];
    NSRange name3Range=[info_lab.text rangeOfString:credits];
    NSRange name4Range=[info_lab.text rangeOfString:authers_Details];
    NSRange name5Range=[info_lab.text rangeOfString:endstring ];
    NSRange endboldRange=[info_lab.text rangeOfString:endbold];
    NSRange byRange=[info_lab.text rangeOfString:by];
    NSRange endstrRange=[info_lab.text rangeOfString:endstr];
    NSRange endallRange=[info_lab.text rangeOfString:endall];
    NSMutableAttributedString* attrStr = [info_lab.attributedText mutableCopy];
    
    if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init] ;
        [paragraphStyle setAlignment:NSTextAlignmentRight];
        
        [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [[info_lab.attributedText mutableCopy] length])];
        
    } else {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init] ;
        [paragraphStyle setAlignment:NSTextAlignmentLeft];
        
        [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [[info_lab.attributedText mutableCopy] length])];
    }
    
    [attrStr setFontName:NSLocalizedString(@"MSEMIBOLD", nil) size:18 range:name1Range];
    [attrStr setFontName:REGULAR size:size range:name2Range];
    [attrStr setFontName:BOLd size:size range:categoryRange];
    [attrStr setFontName:REGULAR size:size range:aftercatRange];
    [attrStr setFontName:BOLd size:size range:levelRange];
    [attrStr setFontName:REGULAR size:size range:afterlevelRange];
    [attrStr setFontName:BOLd size:size range:levelnameRange];
    [attrStr setFontName:REGULAR size:size range:afterlevelnameRange];
    [attrStr setFontName:BOLd size:size range:buyStrRange];
    [attrStr setFontName:REGULAR size:size range:afterBuyRange];
    [attrStr setFontName:BOLd size:size range:upgradeRange];
    [attrStr setFontName:REGULAR size:size range:endStrRange];
    [attrStr setFontName:REGULAR size:size range:name3Range];
    [attrStr setFontName:REGULAR size:size range:name4Range];
    [attrStr setFontName:REGULAR size:size range:name5Range];
    [attrStr setFontName:BOLd size:size range:endboldRange];
    [attrStr setFontName:REGULAR size:size range:byRange];
    [attrStr setFontName:BOLd size:size range:endstrRange];
    [attrStr setFontName:REGULAR size:size range:endallRange];
    [attrStr setTextIsUnderlined:YES range:name1Range];
    NSString *str=[NSString stringWithFormat:@"%@",[attrStr string]];
    
//    CGSize size = [str sizeWithAttributes:
//                   @{NSFontAttributeName: INFO_FONT}];
//    CGSize nameViewSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    
    CGSize nameViewSize=[str sizeWithFont:INFO_FONT constrainedToSize:CGSizeMake(300, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
         if ([[[UIDevice currentDevice]systemVersion] integerValue]<7)
         {
             info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,info_lab.frame.origin.y, info_lab.frame.size.width, nameViewSize.height-70);
         }
         else{
             info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,info_lab.frame.origin.y, info_lab.frame.size.width, nameViewSize.height+70);
         }
        
    }
    else{
        if ([[[UIDevice currentDevice]systemVersion] integerValue]<7)
        {
        info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,info_lab.frame.origin.y, info_lab.frame.size.width, nameViewSize.height-200);
        }
        else{
            info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,info_lab.frame.origin.y, info_lab.frame.size.width, nameViewSize.height);
        }
    }
    info_lab.attributedText = attrStr;
    [scrollView addSubview:info_lab];
    scrollView.contentSize=CGSizeMake(self.scrollView.frame.size.width, info_lab.frame.size.height+120);
    
}
#pragma mark INFO,PLAY BUTTON ACTIONS
- (IBAction)infoButton_Action:(id)sender
{
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
            infoViewController=[[InfoViewController alloc]initWithNibName:@"InfoView" bundle:nil];
        }
        else
        {
            infoViewController=[[InfoViewController alloc]initWithNibName:@"InfoViewiOS7" bundle:nil];
        }
        
        
    }
    else{
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
            infoViewController=[[InfoViewController alloc]initWithNibName:@"InfoView_Ipad" bundle:nil];
        }
        else
        {
            
            infoViewController=[[InfoViewController alloc]initWithNibName:@"InfoViewiOS7_iPad" bundle:nil];
        }
        
        
    }
    [self.navigationController pushViewController:infoViewController animated:YES];

}
- (IBAction)PlayButton_Action:(id)sender
{
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
            playViewController=[[PlayViewController alloc]initWithNibName:@"PlayView" bundle:nil];
        }
        else
        {
            playViewController=[[PlayViewController alloc]initWithNibName:@"PlayView_iOS7" bundle:nil];
        }
        
    }
    else{
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
            playViewController=[[PlayViewController alloc]initWithNibName:@"PlayView_Ipad" bundle:nil];
        }
        else
        {
            playViewController=[[PlayViewController alloc]initWithNibName:@"PlayViewiOS7_iPad" bundle:nil];
        }
        
    }
    [self.navigationController pushViewController:playViewController animated:YES];

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
    background_Img=nil;bottom_Img=nil;
    info_lab=nil;play_Lab=nil;
    scrollView=nil;
    heading_Lab=nil;
    infoViewController=nil;
   playViewController=nil;
    [super viewDidUnload];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
