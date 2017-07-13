//
//  PlayViewController.m
//  Bible Quiz
//
//  Created by Sirisha.G on 10/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController
@synthesize people_Btn,places_Btn,events_Btn,statements_Btn,miscellaneous_Btn,selectall_Btn;
@synthesize people_Lab,places_Lab,events_Lab,statements_Lab,miscellaneous_Lab,selectall_Lab;
@synthesize controllersArray;
@synthesize singletonClass,categoriesArray;
@synthesize levelViewController,images;
@synthesize heading_Lab;
@synthesize noOfCategories;
@synthesize background_ImgView;
@synthesize restart_Lab;
@synthesize play_Lab;

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
            self.people_Btn.frame = CGRectMake(243, 95, 40, 41);
            self.places_Btn.frame = CGRectMake(243, 151, 40, 41);
            self.events_Btn.frame = CGRectMake(243, 210, 40, 41);
            self.statements_Btn.frame = CGRectMake(243, 270, 40, 41);
            self.miscellaneous_Btn.frame = CGRectMake(243, 329, 40, 41);
            self.selectall_Btn.frame = CGRectMake(243, 389, 40, 41);
            
            self.people_Lab.frame = CGRectMake(7, 102, 226, 33);
            self.places_Lab.frame = CGRectMake(7, 159, 226, 33);
            self.events_Lab.frame = CGRectMake(7, 215, 226, 33);
            self.statements_Lab.frame = CGRectMake(7, 277, 226, 33);
            self.miscellaneous_Lab.frame = CGRectMake(7, 337, 226, 33);
            self.selectall_Lab.frame = CGRectMake(7, 396, 226, 33);
            
        }else {
//            If device is iPad
            self.people_Btn.frame = CGRectMake(581, 221, 60, 61);
            self.places_Btn.frame = CGRectMake(581, 311, 60, 61);
            self.events_Btn.frame = CGRectMake(581, 400, 60, 61);
            self.statements_Btn.frame = CGRectMake(581, 490, 60, 61);
            self.miscellaneous_Btn.frame = CGRectMake(581, 580, 60, 61);
            self.selectall_Btn.frame = CGRectMake(581, 670, 60, 61);
            
            self.people_Lab.frame = CGRectMake(15, 231, 537, 52);
            self.places_Lab.frame = CGRectMake(15, 322, 537, 52);
            self.events_Lab.frame = CGRectMake(15, 405, 537, 52);
            self.statements_Lab.frame = CGRectMake(15, 502, 537, 52);
            self.miscellaneous_Lab.frame = CGRectMake(15, 596, 537, 52);
            self.selectall_Lab.frame = CGRectMake(15, 684, 537, 52);
            
        }
        [self.people_Lab setTextAlignment:NSTextAlignmentRight];
        [self.places_Lab setTextAlignment:NSTextAlignmentRight];
        [self.events_Lab setTextAlignment:NSTextAlignmentRight];
        [self.statements_Lab setTextAlignment:NSTextAlignmentRight];
        [self.miscellaneous_Lab setTextAlignment:NSTextAlignmentRight];
        [self.selectall_Lab setTextAlignment:NSTextAlignmentRight];
    }else {
//        for language other than arabic buttons and text should be aligned to left
        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
//            If device is iPhone
            
            self.people_Btn.frame = CGRectMake(37, 95, 40, 41);
            self.places_Btn.frame = CGRectMake(37, 151, 40, 41);
            self.events_Btn.frame = CGRectMake(37, 210, 40, 41);
            self.statements_Btn.frame = CGRectMake(37, 270, 40, 41);
            self.miscellaneous_Btn.frame = CGRectMake(37, 329, 40, 41);
            self.selectall_Btn.frame = CGRectMake(37, 389, 40, 41);
            
            self.people_Lab.frame = CGRectMake(87, 102, 226, 33);
            self.places_Lab.frame = CGRectMake(87, 159, 226, 33);
            self.events_Lab.frame = CGRectMake(87, 215, 226, 33);
            self.statements_Lab.frame = CGRectMake(87, 277, 226, 33);
            self.miscellaneous_Lab.frame = CGRectMake(87, 337, 226, 33);
            self.selectall_Lab.frame = CGRectMake(87, 396, 226, 33);
            

        }else {
//            If device is iPad
            self.people_Btn.frame = CGRectMake(128, 221, 60, 61);
            self.places_Btn.frame = CGRectMake(128, 311, 60, 61);
            self.events_Btn.frame = CGRectMake(128, 400, 60, 61);
            self.statements_Btn.frame = CGRectMake(128, 490, 60, 61);
            self.miscellaneous_Btn.frame = CGRectMake(128, 580, 60, 61);
            self.selectall_Btn.frame = CGRectMake(128, 670, 60, 61);
            
            self.people_Lab.frame = CGRectMake(211, 231, 537, 52);
            self.places_Lab.frame = CGRectMake(211, 322, 537, 52);
            self.events_Lab.frame = CGRectMake(211, 405, 537, 52);
            self.statements_Lab.frame = CGRectMake(211, 502, 537, 52);
            self.miscellaneous_Lab.frame = CGRectMake(211, 596, 537, 52);
            self.selectall_Lab.frame = CGRectMake(211, 684, 537, 52);
        }
        [self.people_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.places_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.events_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.statements_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.miscellaneous_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.selectall_Lab setTextAlignment:NSTextAlignmentLeft];
    }
    
    
    restart_Lab.text=NSLocalizedString(@"RESTART", nil);
    play_Lab.text=NSLocalizedString(@"PLAY", nil);
    controllersArray=[[NSMutableArray alloc]initWithObjects:people_Btn,places_Btn,events_Btn,statements_Btn,miscellaneous_Btn, nil];
    categoriesArray=[[NSArray alloc]initWithObjects:NSLocalizedString(@"PEOPLE", nil),NSLocalizedString(@"PLACES", nil),NSLocalizedString(@"EVENTS", nil),NSLocalizedString(@"STATEMENTS", nil),NSLocalizedString(@"MISCELLANEOUS", nil), nil];
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
    {
        images=[[NSMutableArray alloc]initWithObjects:@"uncheckiphone.png",@"checkiphone_img.png",@"all_check_chkbox.png", nil];
    }
    else{
        images=[[NSMutableArray alloc]initWithObjects:@"uncheck_Ipad.png",@"checkipad_img.png",@"all_check_chkbox_Ipad", nil];
    }
    people_Lab.text=NSLocalizedString(@"PEOPLE", nil);
    places_Lab.text=NSLocalizedString(@"PLACES", nil);
    events_Lab.text=NSLocalizedString(@"EVENTS", nil);
    statements_Lab.text=NSLocalizedString(@"STATEMENTS", nil);
    miscellaneous_Lab.text=NSLocalizedString(@"MISCELLANEOUS", nil);
    selectall_Lab.text=NSLocalizedString(@"SELECTALL", nil);
    heading_Lab.text=NSLocalizedString(@"HEADING", nil);
    noOfCategories.text=NSLocalizedString(@"MIN CATEGORIES", nil);
    noOfCategories.adjustsFontSizeToFitWidth=YES;
//    if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"]&&[[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
//    {
//        heading_Lab.textAlignment=NSTextAlignmentRight;
//    }
//    else
//    {
        heading_Lab.textAlignment=NSTextAlignmentCenter;
    //}
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        restart_Lab.font=BUTTONS_FONT;
        play_Lab.font=BUTTONS_FONT;
        heading_Lab.font=Heading_FONT_Iphone;
        people_Lab.font=CATEGORIES_FONT_Iphone;
        places_Lab.font=CATEGORIES_FONT_Iphone;
        events_Lab.font=CATEGORIES_FONT_Iphone;
        statements_Lab.font=CATEGORIES_FONT_Iphone;
        miscellaneous_Lab.font=CATEGORIES_FONT_Iphone;
        selectall_Lab.font=CATEGORIES_FONT_Iphone;
      
        noOfCategories.font=NOOFSELECTED_CATEGORIES_FONT_Iphone;
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        if (screenHeight>500) {
            background_ImgView.image=[UIImage imageNamed:@"background_640x1136.png"];
        }
        else
        {
            background_ImgView.image=[UIImage imageNamed:@"background.png"];
        }
    }
    else{
        restart_Lab.font=BUTTONS_FONT_IPAD;
        play_Lab.font=BUTTONS_FONT_IPAD;
        
        heading_Lab.font=Heading_FONT_IPAD;
        people_Lab.font=CATEGORIES_FONT_IPAD;
        places_Lab.font=CATEGORIES_FONT_IPAD;
        events_Lab.font=CATEGORIES_FONT_IPAD;
        statements_Lab.font=CATEGORIES_FONT_IPAD;
        miscellaneous_Lab.font=CATEGORIES_FONT_IPAD;
        selectall_Lab.font=CATEGORIES_FONT_IPAD;
        noOfCategories.font=NOOFSELECTED_CATEGORIES_FONT_IPAD;
    }
    for (int i=0; i<[controllersArray count]; i++) {
        UIButton *btn=[controllersArray objectAtIndex:i];
        btn.selected=NO;
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
    }
    [selectall_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
    selectall_Btn.selected=NO;
    restart_Lab.adjustsFontSizeToFitWidth=YES;
    play_Lab.adjustsFontSizeToFitWidth=YES;

}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    selectall_Btn.selected=NO;
    people_Btn.selected=NO;
    places_Btn.selected=NO;
    events_Btn.selected=NO;
    statements_Btn.selected=NO;
    miscellaneous_Btn.selected=NO;
}
#pragma mark CATEGORY SELECT ACTION
- (IBAction)categoriesSelect:(UIButton *)sender
{
    if (!sender.selected)
    {
        sender.selected=YES;
        [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:1]]] forState:UIControlStateNormal];
    }
    else
    {
         sender.selected=NO;
        [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];

    }
    if (people_Btn.selected==YES&&places_Btn.selected==YES && events_Btn.selected==YES &&statements_Btn.selected==YES && miscellaneous_Btn.selected==YES)
    {
        selectall_Btn.selected=YES;
        [selectall_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:2]]] forState:UIControlStateNormal];
    }
    else{
        selectall_Btn.selected=NO;
        [selectall_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
    }
}
#pragma mark SELECT ALL BUTTON ACTION
- (IBAction)selectAllButton_Action:(UIButton *)sender
{
    if (!sender.selected)
    {
     sender.selected=YES;
        for (int i=0; i<[controllersArray count]; i++) {
            UIButton *btn=[controllersArray objectAtIndex:i];
            btn.selected=YES;
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:1]]] forState:UIControlStateNormal];
        }
        [selectall_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:2]]] forState:UIControlStateNormal];
    }
    else
    {
        sender.selected=NO;
        for (int i=0; i<[controllersArray count]; i++) {
            UIButton *btn=[controllersArray objectAtIndex:i];
            btn.selected=NO;
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
        }
        [selectall_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
    }
   
}
#pragma mark PLAY BUTTON ACTION
- (IBAction)playButton_Action:(id)sender
{
    if (!singletonClass) {
        singletonClass=[Singleton sharedSingleton];
    }
    [singletonClass.selected_Categories removeAllObjects];
    for (int k=0; k<[controllersArray count]; k++) {
        UIButton *btn=[controllersArray objectAtIndex:k];
        if (btn.selected==YES) {
            [singletonClass.selected_Categories addObject:[categoriesArray objectAtIndex:k]];
        }
    }
    if ([singletonClass.selected_Categories count]<2)
    {
        [self shaowAlert:NSLocalizedString(@"NO OF CATEGORIES SELECT", nil) tag:2 button:[NSArray arrayWithObjects:NSLocalizedString(@"OKAY", nil), nil]];
        [singletonClass.selected_Categories removeAllObjects];
    }
    else{
         if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
             if (SYSTEM_VERSION_LESS_THAN(@"7")) {
                  levelViewController=[[LevelsViewController alloc]initWithNibName:@"LevelsView" bundle:nil];
             }
             else
             {
                  levelViewController=[[LevelsViewController alloc]initWithNibName:@"LevelsView_iOS7" bundle:nil];
             }
           
        }
        else{
            if (SYSTEM_VERSION_LESS_THAN(@"7")) {
                 levelViewController=[[LevelsViewController alloc]initWithNibName:@"LevelsView_Ipad" bundle:nil];
            }
            else
            {
                 levelViewController=[[LevelsViewController alloc]initWithNibName:@"LevelsViewiOS7_iPad" bundle:nil];
            }
           
        }
        [self.navigationController pushViewController:levelViewController animated:YES];
    }
}
#pragma mark RESTART BUTTON ACTION
- (IBAction)restart_Btn_Action:(id)sender
{
  
    if (!self.singletonClass) {
        self.singletonClass=[Singleton sharedSingleton];
    }
    [self.singletonClass.selected_Categories removeAllObjects];
    self.singletonClass.progressval=0.0;
    self.singletonClass.selectedId=nil;
    self.singletonClass.isSelect=NO;
    self.singletonClass.noOfRound=0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark ALERT SHOW METHOD
- (void)shaowAlert:(NSString*)message tag:(int)tag button:(NSArray *)buttons{
    UIAlertView *alert;
    if ([buttons count]==1) {
        alert=[[UIAlertView alloc]initWithTitle:@"Bible Quiz" message:message delegate:self cancelButtonTitle:nil otherButtonTitles:[buttons objectAtIndex:0], nil];
    }
    else{
        alert=[[UIAlertView alloc]initWithTitle:@"Bible Quiz" message:message delegate:self cancelButtonTitle:nil otherButtonTitles:[buttons objectAtIndex:0],[buttons objectAtIndex:1], nil];
    }
    alert.tag=tag;
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   
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
        
   levelViewController=nil;
    [super viewDidUnload];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
