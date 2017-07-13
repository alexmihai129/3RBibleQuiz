//
//  LevelsViewController.m
//  Bible Quiz
//
//  Created by Sirisha.G on 10/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import "LevelsViewController.h"

@interface LevelsViewController ()

@end

@implementation LevelsViewController
@synthesize easy_Btn,intermediate_Btn,advanced_Btn;
@synthesize easy_Lab,intermediate_Lab,advanced_Lab;
@synthesize noOfRounds_Lab;
@synthesize singletonClass;
@synthesize questionsViewController;
@synthesize appdelegate;
@synthesize managedObjectContext;
@synthesize bible_DB,bible_Class;
@synthesize images;
@synthesize heading_Lab,noOfLevels;
@synthesize background_ImgView;
@synthesize inAppPurchase;
@synthesize tags;
@synthesize isUpgrade;
@synthesize restart_Lab,buy_Lab,play_Lab,buy_Btn;
@synthesize gadBannerView;
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
    if (!singletonClass) {
        singletonClass=[Singleton sharedSingleton];
    }
   
   	// Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
//        If arabic language buttons and text should be aligned to right
        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
//            If device is iPhone
            self.easy_Btn.frame = CGRectMake(243, 107, 40, 41);
            self.intermediate_Btn.frame = CGRectMake(243, 167, 40, 41);
            self.advanced_Btn.frame = CGRectMake(243, 226, 40, 41);
            
            self.easy_Lab.frame = CGRectMake(7, 114, 226, 33);
            self.intermediate_Lab.frame = CGRectMake(7, 175, 226, 33);
            self.advanced_Lab.frame = CGRectMake(7, 232, 226, 33);
            
        }else {
//            If device is iPad
            self.easy_Btn.frame = CGRectMake(542, 225, 60, 61);
            self.intermediate_Btn.frame = CGRectMake(542, 315, 60, 61);
            self.advanced_Btn.frame = CGRectMake(542, 405, 60, 61);
            
            self.easy_Lab.frame = CGRectMake(20, 225, 494, 61);
            self.intermediate_Lab.frame = CGRectMake(20, 315, 494, 61);
            self.advanced_Lab.frame = CGRectMake(20, 415, 494, 61);
            
        }
        [self.easy_Lab setTextAlignment:NSTextAlignmentRight];
        [self.intermediate_Lab setTextAlignment:NSTextAlignmentRight];
        [self.advanced_Lab setTextAlignment:NSTextAlignmentRight];
    }else {
//        for language other than arabic buttons and text should be aligned to left
        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
//            If device is iPhone
            self.easy_Btn.frame = CGRectMake(37, 107, 40, 41);
            self.intermediate_Btn.frame = CGRectMake(37, 167, 40, 41);
            self.advanced_Btn.frame = CGRectMake(37, 226, 40, 41);
            
            self.easy_Lab.frame = CGRectMake(87, 114, 226, 33);
            self.intermediate_Lab.frame = CGRectMake(87, 175, 226, 33);
            self.advanced_Lab.frame = CGRectMake(87, 226, 226, 33);
            
        }else {
//            If device is iPad
            self.easy_Btn.frame = CGRectMake(166, 225, 60, 61);
            self.intermediate_Btn.frame = CGRectMake(166, 315, 60, 61);
            self.advanced_Btn.frame = CGRectMake(166, 405, 60, 61);
            
            self.easy_Lab.frame = CGRectMake(254, 225, 494, 61);
            self.intermediate_Lab.frame = CGRectMake(254, 315, 494, 61);
            self.advanced_Lab.frame = CGRectMake(254, 415, 494, 61);
        }
        [self.easy_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.intermediate_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.advanced_Lab setTextAlignment:NSTextAlignmentLeft];
    }
    heading_Lab.text=NSLocalizedString(@"QUIZ_LEVEL", nil);
    noOfLevels.text=NSLocalizedString(@"MIN LEVELS", nil);
    easy_Lab.text=NSLocalizedString(@"EASY", nil);
    intermediate_Lab.text=NSLocalizedString(@"INTERMEDIATE", nil);
    play_Lab.text=NSLocalizedString(@"PLAY", nil);
    buy_Lab.text=NSLocalizedString(@"BUY_BUTTON", nil);
    restart_Lab.text=NSLocalizedString(@"RESTORE", nil);
    advanced_Lab.text=NSLocalizedString(@"ADVANCED", nil);
    restart_Lab.adjustsFontSizeToFitWidth=YES;
    [super viewWillAppear:YES];
    if([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
    {
        images=[[NSMutableArray alloc]initWithObjects:@"uncheckiphone.png",@"checkiphone_img.png", nil];
    }
    else
    {
        images=[[NSMutableArray alloc]initWithObjects:@"uncheck_Ipad.png",@"checkipad_img.png", nil];
    }
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        buy_Lab.font=BUTTONS_FONT;
        restart_Lab.font=BUTTONS_FONT;
        play_Lab.font=BUTTONS_FONT;
        heading_Lab.font=Heading_FONT_Iphone;
        easy_Lab.font=CATEGORIES_FONT_Iphone;
        intermediate_Lab.font=CATEGORIES_FONT_Iphone;
        advanced_Lab.font=CATEGORIES_FONT_Iphone;
        noOfLevels.font=NOOFSELECTED_CATEGORIES_FONT_Iphone;
        noOfRounds_Lab.font=NOOFROUNDS_FONT_Iphone;
        
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
    else
    {
        buy_Lab.font=BUTTONS_FONT_IPAD;
        restart_Lab.font=BUTTONS_FONT_IPAD;
        play_Lab.font=BUTTONS_FONT_IPAD;
        heading_Lab.font=Heading_FONT_IPAD;
        easy_Lab.font=CATEGORIES_FONT_IPAD;
        intermediate_Lab.font=CATEGORIES_FONT_IPAD;
        advanced_Lab.font=CATEGORIES_FONT_IPAD;
        noOfLevels.font=NOOFSELECTED_CATEGORIES_FONT_IPAD;
        noOfRounds_Lab.font=NOOFROUNDS_FONT_IPAD;
    }
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"purchase"]) {
        buy_Lab.hidden=YES;
        buy_Btn.hidden=YES;
    }
    else
    {
        buy_Lab.hidden=NO;
        buy_Btn.hidden=NO;
    }
    easy_Btn.selected=NO;
    intermediate_Btn.selected=NO;
    advanced_Btn.selected=NO;
    restart_Lab.adjustsFontSizeToFitWidth=YES;
    buy_Lab.adjustsFontSizeToFitWidth=YES;
    play_Lab.adjustsFontSizeToFitWidth  =YES;
    [self addsDisplay];
    
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
                                                  self.view.frame.size.width,
                                                  GAD_SIZE_320x50.height)];
    }
      gadBannerView.adUnitID=ADMOB_ID;
      gadBannerView.rootViewController=self;
    [self.view addSubview:gadBannerView];
    [gadBannerView loadRequest:[GADRequest request]];
    

}
- (void)viewDidDisappear:(BOOL)animated {
    isUpgrade=NO;
    intermediate_Btn.selected=NO;
    easy_Btn.selected=NO;
    advanced_Btn.selected=NO;
}
#pragma mark LEVELS BUTTON ACTION
- (IBAction)levelButton_Action:(UIButton * )sender
{
    if (sender.tag==10) {
        if (!sender.selected)
        {
            sender.selected=YES;
            tags=10;
            [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:1]]] forState:UIControlStateNormal];
            [self easyBtn_Action];
        }
        else{
            sender.selected=NO;
            intermediate_Btn.selected=NO;
            advanced_Btn.selected=NO;
            [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
            [intermediate_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
            [advanced_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
        }
    }
    else if(sender.tag==11 )
    {
        tags=11;
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"purchase"]) {
        if (!sender.selected)
        {
            sender.selected=YES;
            [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:1]]] forState:UIControlStateNormal];
            [self intermediateBtn_Action];
        }
        else{
            sender.selected=NO;
            easy_Btn.selected=NO;
            advanced_Btn.selected=NO;
            [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
            [easy_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
            [advanced_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
        }
    }
       else
       {
           sender.selected=NO;
           [self showAlert:NSLocalizedString(@"UPGRADE_PLZ", nil) tag:2 button:[NSArray arrayWithObjects:NSLocalizedString(@"OKAY", nil),NSLocalizedString(@"CANCEL", nil), nil]];
       }
    }
    else if(sender.tag==12)
    {
        tags=12;
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"purchase"]) {
        if (!sender.selected)
        {
            sender.selected=YES;
            [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:1]]] forState:UIControlStateNormal];
            [self advanceBtn_Action];
           
        }
        else{
            sender.selected=NO;
            intermediate_Btn.selected=NO;
            easy_Btn.selected=NO;
            [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
            [intermediate_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
            [easy_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
        }
    }
    else{
        sender.selected=NO;
        [self showAlert:NSLocalizedString(@"UPGRADE_PLZ", nil) tag:2 button:[NSArray arrayWithObjects:NSLocalizedString(@"OKAY", nil),NSLocalizedString(@"CANCEL", nil), nil]];
    }
    }
    [self getQuestionFromDB];
}
#pragma mark LEVELS ACTION
- (void)easyBtn_Action
{
    singletonClass.selected_Level=NSLocalizedString(@"EASY", nil);
    singletonClass.noOfLevel=1;
    intermediate_Btn.selected=NO;
    advanced_Btn.selected=NO;
    [intermediate_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
    [advanced_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
}
- (void)intermediateBtn_Action
{
    singletonClass.selected_Level=NSLocalizedString(@"INTERMEDIATE_LEVEL", nil);
    singletonClass.noOfLevel=2;
    easy_Btn.selected=NO;
    advanced_Btn.selected=NO;
    [advanced_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
    [easy_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
}
- (void)advanceBtn_Action
{
    easy_Btn.selected=NO;
    intermediate_Btn.selected=NO;
    singletonClass.selected_Level=NSLocalizedString(@"ADVANCED_LEVEL", nil);
    singletonClass.noOfLevel=3;
    [intermediate_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
    [easy_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:0]]] forState:UIControlStateNormal];
}
#pragma mark GET QUESTIONS FROM COREDATA
- (void)getQuestionFromDB
{
    appdelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (!singletonClass) {
        singletonClass=[Singleton sharedSingleton];
    }
    [singletonClass.selected_Questions removeAllObjects];
    managedObjectContext=appdelegate.managedObjectContext;
    NSError *error = nil;
    NSFetchRequest *request1 = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity1 = [NSEntityDescription entityForName:singletonClass.entityName inManagedObjectContext:managedObjectContext];
	[request1 setEntity:entity1];
    NSPredicate *requestPredicate = [NSPredicate predicateWithFormat:@"category IN %@ and level=%@", singletonClass.selected_Categories,singletonClass.selected_Level];
    [request1 setPredicate:requestPredicate];
    NSArray *questionaArray = [[managedObjectContext executeFetchRequest:request1 error:&error] mutableCopy];

    if ([questionaArray count]>0) {
        for (bible_DB in questionaArray) {
            bible_Class=[[BibleClass alloc]init];
            bible_Class.questionID=bible_DB.questionId;
            bible_Class.quiz=bible_DB.quiz;
            bible_Class.answer=bible_DB.answer;
            bible_Class.okindex=bible_DB.okindex;
            bible_Class.biblereference=bible_DB.biblereference;
            bible_Class.level=bible_DB.level;
            bible_Class.category=bible_DB.category;
            [singletonClass.selected_Questions addObject:bible_Class];
        }
    }
    if ([self.singletonClass.selected_Questions count] > 1) {
        for (int shuffleIndex = (int)[self.singletonClass.selected_Questions count] - 1; shuffleIndex > 0; shuffleIndex--)
            [self.singletonClass.selected_Questions exchangeObjectAtIndex:shuffleIndex withObjectAtIndex:random() % (shuffleIndex + 1)];
    }
    if (easy_Btn.selected==YES || intermediate_Btn.selected==YES || advanced_Btn.selected==YES) {
        noOfRounds_Lab.text=[NSString stringWithFormat:@"%@ %lu %@",NSLocalizedString(@"NO OF ROUNDS", nil),(unsigned long)[singletonClass.selected_Questions count]/15,NSLocalizedString(@"ROUNDS", nil)];
        if ([self.singletonClass.selected_Questions count]>1) {
        }
        else
        {
            
          [self showAlert:[NSString stringWithFormat:@"%@\n%@",noOfRounds_Lab.text,NSLocalizedString(@"NETWORK_MESSAGE", nil)] tag:10 button:[NSArray arrayWithObjects:NSLocalizedString(@"OKAY", nil), nil]];
        }
    }
    else
    {
        noOfRounds_Lab.text=@"";
    }
}
#pragma mark PLAY BUTTON ACTION
- (IBAction)playButton_Action:(id)sender
{
    if (easy_Btn.selected==NO && intermediate_Btn.selected==NO && advanced_Btn.selected==NO)
    {
        singletonClass.selected_Level=@"";
        [self showAlert:NSLocalizedString(@"NO OF LEVELS", nil) tag:1 button:[NSArray arrayWithObjects:NSLocalizedString(@"OKAY", nil), nil]];
    }
    else
    {
        if (!self.singletonClass) {
            self.singletonClass=[Singleton sharedSingleton];
        }
        if ([self.singletonClass.selected_Questions count]>1) {
            if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
                
                if (SYSTEM_VERSION_LESS_THAN(@"7")) {
                    questionsViewController=[[QuestionsDisplayViewController alloc]initWithNibName:@"QuestionsDisplayView" bundle:nil];
                }
                else
                {
                    if(IS_IPHONE_5)
                    {
                        questionsViewController=[[QuestionsDisplayViewController alloc]initWithNibName:@"QuestionsDisplayView_iOS7_iPhone5" bundle:nil];
                    }
                    else if (IS_STANDARD_IPHONE_6)
                    {
                        questionsViewController=[[QuestionsDisplayViewController alloc]initWithNibName:@"QuestionsDisplayView_iOS7_iPhone6" bundle:nil];
                    }
                    else if (IS_STANDARD_IPHONE_6_PLUS)
                    {
                        questionsViewController=[[QuestionsDisplayViewController alloc]initWithNibName:@"QuestionsDisplayView_iOS7_iPhone6plus" bundle:nil];
                    }
                    else
                    {
                        questionsViewController=[[QuestionsDisplayViewController alloc]initWithNibName:@"QuestionsDisplayView_iOS7" bundle:nil];
                    }
                }
                
            }
            else{
                if (SYSTEM_VERSION_LESS_THAN(@"7")) {
                    questionsViewController=[[QuestionsDisplayViewController alloc]initWithNibName:@"QuestionsDisplayView_Ipad" bundle:nil];
                }
                else
                {
                    questionsViewController=[[QuestionsDisplayViewController alloc]initWithNibName:@"QuestionsDisplayViewiOS7_iPad" bundle:nil];
                }
                
            }
            self.singletonClass.noOfRound=1;
            [self.navigationController pushViewController:questionsViewController animated:YES];
        }
        else
        {
            self.singletonClass.noOfRound=0;
            [self showAlert:[NSString stringWithFormat:@"%@\n%@",noOfRounds_Lab.text,NSLocalizedString(@"NETWORK_MESSAGE", nil)] tag:10 button:[NSArray arrayWithObjects:NSLocalizedString(@"OKAY", nil), nil]];
        }
       
    }
}
#pragma mark BUY BUTTON ACTION
- (IBAction)buy_Btn_Action:(id)sender
{
    inAppPurchase = [InAppPurchase SharedInApp];
    inAppPurchase.delegate=self;
    [inAppPurchase purchaseProduct:[NSString stringWithFormat:INAPPPURCHASE_PRODUCT]];
}
#pragma mark RESTORE BUTTON ACTION
- (IBAction)restore_BtnAction:(id)sender {
    
    inAppPurchase = [InAppPurchase SharedInApp];
    inAppPurchase.delegate=self;
    [inAppPurchase restTransaction];

    
}
#pragma mark INAPP PURCHASE DELEGATE METHODS
-(void)purchaseCompleted:(id)sender
    {
        NSUserDefaults *userdefaults=[NSUserDefaults standardUserDefaults];
        [userdefaults setValue:@"purchase" forKey:@"purchase"];
        [userdefaults synchronize];
        buy_Lab.hidden=YES;
        buy_Btn.hidden=YES;
        if (isUpgrade==YES) {
            isUpgrade=NO;
            if (tags==10) {
                easy_Btn.selected=YES;
                [easy_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:1]]] forState:UIControlStateNormal];
                [self easyBtn_Action];
            }
            else if(tags==11)
            {
                intermediate_Btn.selected=YES;
                [intermediate_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:1]]] forState:UIControlStateNormal];
                [self intermediateBtn_Action];
               
            }
            else if(tags==12)
            {
                [advanced_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[images objectAtIndex:1]]] forState:UIControlStateNormal];
                advanced_Btn.selected=YES;
                [self advanceBtn_Action];
            }
            [self getQuestionFromDB];
        }
}
-(void)errorOccured:(NSError*)error
{
    NSLog(@"error %@",error.description);
}
#pragma mark SHOW ALERT METHOD
- (void)showAlert:(NSString*)message tag:(int)tag button:(NSArray *)buttons{
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
        if (alertView.tag==2) {
            if (buttonIndex==0) {
                isUpgrade=YES;
                [self buy_Btn_Action:nil];
            }
            else{
                isUpgrade=NO;
            }
        }
        if (alertView.tag==10) {
            if (!self.singletonClass) {
                self.singletonClass=[Singleton sharedSingleton];
            }
            [self.singletonClass.selected_Categories removeAllObjects];
            self.singletonClass.progressval=0.0;
            self.singletonClass.selectedId=nil;
            self.singletonClass.isSelect=NO;
            self.singletonClass.selected_Level=nil;
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
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
    questionsViewController=nil;
    [super viewDidUnload];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
