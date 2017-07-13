//
//  InfoViewController.m
//  Bible Quiz
//
//  Created by Sirisha.G on 09/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import "InfoViewController.h"
#import "NSAttributedString+Attributes.h"
#import "Fonts.h"
@interface InfoViewController ()

@end

@implementation InfoViewController
@synthesize background_Img,bottom_Img;
@synthesize info_lab;
@synthesize scrollView;
@synthesize heading_Lab;
@synthesize helpViewController;
@synthesize playViewController;
@synthesize help_Lab,play_Lab;
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
   
}
- (void)viewWillAppear:(BOOL)animated
{
    help_Lab.text=NSLocalizedString(@"HELP", nil);
    play_Lab.text=NSLocalizedString(@"PLAY", nil);
    heading_Lab.text=NSLocalizedString(@"HEADING_TEXT", nil);
    help_Lab.adjustsFontSizeToFitWidth=YES;
    play_Lab.adjustsFontSizeToFitWidth=YES;
    
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        help_Lab.font=BUTTONS_FONT;
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
        help_Lab.font=BUTTONS_FONT_IPAD;
        play_Lab.font=BUTTONS_FONT_IPAD;
        heading_Lab.font=CHALLENGE_FONT_IPAD;
        size=20;
    }
     [self displayInfo];
}
#pragma  mark DISPLAY INFO
- (void)displayInfo
{
    NSString *details=[[NSString stringWithFormat:NSLocalizedString(@"DETAILS", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *bold=[[NSString stringWithFormat:NSLocalizedString(@"BOLD", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *afterbold=[[NSString stringWithFormat:NSLocalizedString(@"AFTER_BOLD", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *credits=[[NSString stringWithFormat:NSLocalizedString(@"INFO_CREDITS", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *authers_Details=[[[NSString stringWithFormat:NSLocalizedString(@"DESIGNER", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *designer=[[NSString stringWithFormat:NSLocalizedString(@"DESIGNER_NAME", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *contributor=[[NSString stringWithFormat:NSLocalizedString(@"CONTRIBUTOR", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *conmid=[[NSString stringWithFormat:NSLocalizedString(@"Scriptures", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *contributerName=[[NSString stringWithFormat:NSLocalizedString(@"CONTRIBUTOR_NAME", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *editor=[[NSString stringWithFormat:NSLocalizedString(@"EDITOR", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *editorName;
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPad) {
        editorName=[[NSString stringWithFormat:NSLocalizedString(@"EDITOR_NAME_IPAD", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    else
    {
         editorName=[[NSString stringWithFormat:NSLocalizedString(@"EDITOR_NAME", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    NSString *afteredit=[[NSString stringWithFormat:NSLocalizedString(@"AUTHOR", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *namesAuther=[[NSString stringWithFormat:NSLocalizedString(@"AUTHOR_NAME", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *bible=[[NSString stringWithFormat:NSLocalizedString(@"BIBLE", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *middle=[[NSString stringWithFormat:NSLocalizedString(@"BY", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *auther=[[NSString stringWithFormat:NSLocalizedString(@"NAME", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *end=[[NSString stringWithFormat:NSLocalizedString(@"END", nil)]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"es"]){
            info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                      %@\n%@ %@  %@\n%@            %@\n%@                           %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"fr"]){
        info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                       %@\n%@ %@  %@\n%@                    %@\n%@                          %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"de"]){
            info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                   %@\n%@ %@ %@\n%@                  %@\n%@                          %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"]){
            info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                   %@\n%@ %@        %@\n%@                   %@\n%@                      %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt"]||[[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt-PT"]){
            info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                       %@\n%@ %@ %@\n%@                    %@\n%@                           %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"]){
            info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                    %@\n%@ %@ %@\n%@                %@\n%@                          %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"it"]){
            info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                    %@\n%@%@  %@\n%@                     %@\n%@                           %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]){
            info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                    %@\n%@%@  %@\n%@                     %@\n%@                           %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else
        {
             info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                        %@\n%@ %@  %@\n%@                            %@\n%@                          %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
    }
    else
    {
          if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"es"]){
              info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                                                                              %@\n%@ %@                                                     %@\n%@                                                                            %@\n%@                                                                                     %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end]; 
          }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"fr"]){
             info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                                                                                 %@\n%@ %@                                                      %@\n%@                                                                            %@\n%@                                                                                   %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end]; 
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"]){
            info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                                                                                   %@\n%@ %@                                                                     %@\n%@                                                                                   %@\n%@                                                                                       %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"de"]){
            info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                                                                       %@\n%@ %@                                     %@\n%@                                                                      %@\n%@                                                                                %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt"]||[[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt-PT"]){
            info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                                                                                 %@\n%@ %@                                                      %@\n%@                                                                             %@\n%@                                                                                       %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"]){
            info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                                                                           %@\n%@ %@                                                    %@\n%@                                                                      %@\n%@                                                                                  %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"it"]){
            info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                                                                           %@\n%@ %@                                                   %@\n%@                                                                           %@\n%@                                                                                  %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"])
        {
             info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                                                                            %@\n%@ %@                                                 %@\n%@                                                                                 %@\n%@                                                                               %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end];
        }
        else
        {
             info_lab.text=[NSString stringWithFormat:@"%@ %@ %@\n\n%@\n%@                                                                            %@\n%@ %@                                                 %@\n%@                                                                                 %@\n%@                                                                               %@ %@ %@ %@ %@",details,bold,afterbold,credits,authers_Details,designer,contributor,conmid,contributerName,editor,editorName,afteredit,namesAuther,bible,middle,auther,end]; 
        }
    }
    NSRange name2Range = [info_lab.text rangeOfString:details];
    NSRange boldRange=[info_lab.text rangeOfString:bold];
    NSRange afterboldRange=[info_lab.text rangeOfString:afterbold];
    NSRange name3Range=[info_lab.text rangeOfString:credits];
    NSRange name4Range=[info_lab.text rangeOfString:authers_Details];
    NSRange designerRange=[info_lab.text rangeOfString:designer];
    NSRange contributorRange=[info_lab.text rangeOfString:contributor];
    NSRange conmidRange=[info_lab.text rangeOfString:conmid];
    NSRange contributerNameRange=[info_lab.text rangeOfString:contributerName];
    NSRange editorRange=[info_lab.text rangeOfString:editor];
    NSRange editorNameRange=[info_lab.text rangeOfString:editorName];
    NSRange aftereditRange=[info_lab.text rangeOfString:afteredit];
    NSRange name1Range=[info_lab.text rangeOfString:namesAuther];
    NSRange name6Range;
    if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"]){
        NSRange makeRange=NSMakeRange(name1Range.location+10, namesAuther.length+bible.length+10);
      name6Range=[info_lab.text rangeOfString:bible options:NSCaseInsensitiveSearch range:makeRange];
    }
    else
    {
          name6Range=[info_lab.text rangeOfString:bible];
    }

   
    NSRange name7Range=[info_lab.text rangeOfString:middle];
    NSRange name8Range;
    if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"])
    {
             name8Range=[info_lab.text rangeOfString:auther];
    }
    else
    {
        NSRange makeRange=NSMakeRange(name6Range.location, bible.length+middle.length+auther.length+10);
        name8Range=[info_lab.text rangeOfString:auther options:NSCaseInsensitiveSearch range:makeRange];
    }
   
    NSRange name9Range=[info_lab.text rangeOfString:end];
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
    
    [attrStr setFontName:REGULAR size:size range:name2Range];
    [attrStr setFontName:BOLd size:size range:boldRange];
    [attrStr setFontName:REGULAR size:size range:afterboldRange];
    [attrStr setFontName:BOLd size:size range:name3Range];
    [attrStr setFontName:BOLd size:size range:name4Range];
    [attrStr setFontName:REGULAR size:size range:designerRange];
    [attrStr setFontName:BOLd size:size range:contributorRange];
    [attrStr setFontName:REGULAR size:size range:conmidRange];
    [attrStr setFontName:REGULAR size:size range:contributerNameRange];
    [attrStr setFontName:BOLd size:size range:editorRange];
    [attrStr setFontName:REGULAR size:size range:editorNameRange];
    [attrStr setFontName:BOLd size:size range:aftereditRange];
    [attrStr setFontName:REGULAR size:size range:name1Range];
    [attrStr setFontName:BOLd size:size range:name6Range];
    [attrStr setFontName:REGULAR size:size range:name7Range];
    [attrStr setFontName:BOLd size:size range:name8Range];
    [attrStr setFontName:REGULAR size:size range:name9Range];
    NSString *str=[NSString stringWithFormat:@"%@",[attrStr string]];
//    CGSize size = [str sizeWithAttributes:
//                   @{NSFontAttributeName: INFO_FONT}];
//    CGSize nameViewSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    CGSize nameViewSize=[str sizeWithFont:INFO_FONT constrainedToSize:CGSizeMake(300, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    info_lab.attributedText = attrStr;
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        
        //CGRect screenRect = [[UIScreen mainScreen] bounds];
        //CGFloat screenHeight = screenRect.size.height;
        
       // if (screenHeight>500) {
        
        
            if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"])
            {
                if (SYSTEM_VERSION_LESS_THAN(@"7"))
                {
                info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,0, info_lab.frame.size.width, nameViewSize.height);
                }
                else{
                    info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,0, info_lab.frame.size.width, nameViewSize.height+50);
                }
            }
            else
            {
                 if (SYSTEM_VERSION_LESS_THAN(@"7"))
                 {
                      info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,0, info_lab.frame.size.width, nameViewSize.height-30);
                 }
                else
                {
                info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,0, info_lab.frame.size.width, nameViewSize.height+30);
                }
            }
        
        
       /* }
        else{
        if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"])
        {
           info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,0, info_lab.frame.size.width, nameViewSize.height);
            }
        else
            {
                info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,0, info_lab.frame.size.width, nameViewSize.height-60);
            }
        }*/
    }
    else
    {
         if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"])
         {
             if (SYSTEM_VERSION_LESS_THAN(@"7"))
             {
             info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,0, info_lab.frame.size.width, nameViewSize.height-100);
             }
             else{
                 info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,0, info_lab.frame.size.width, nameViewSize.height); 
             }
         }
         else{
             if (SYSTEM_VERSION_LESS_THAN(@"7")) {
                 info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,0, info_lab.frame.size.width, nameViewSize.height-150);
             }
             else
             {
                 info_lab.frame=CGRectMake(self.info_lab.frame.origin.x,0, info_lab.frame.size.width, nameViewSize.height);
             }
             
         }
        
    }
    
    [scrollView addSubview:info_lab];
    scrollView.contentSize=CGSizeMake(self.scrollView.frame.size.width, info_lab.frame.size.height+120);
}
#pragma mark HELP,PLAY BUTTON ACTIONS
- (IBAction)helpAbutton_Action:(id)sender
{
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
            helpViewController=[[HelpViewController alloc]initWithNibName:@"HelpView" bundle:nil];

        }
        else
        {
            helpViewController=[[HelpViewController alloc]initWithNibName:@"HelpView_iOS7" bundle:nil];

        }
        
    }
    else{
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
            helpViewController=[[HelpViewController alloc]initWithNibName:@"HelpView_Ipad" bundle:nil];

        }
        else
        {
            helpViewController=[[HelpViewController alloc]initWithNibName:@"HelpViewiOS7_iPad" bundle:nil];

        }
        
    }
    [self.navigationController pushViewController:helpViewController animated:YES];

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
   background_Img=nil; bottom_Img=nil;
    help_Lab=nil;play_Lab=nil;
    scrollView=nil;
    heading_Lab=nil;
   info_lab=nil;
    helpViewController=nil;
    playViewController=nil;
    [super viewDidUnload];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
