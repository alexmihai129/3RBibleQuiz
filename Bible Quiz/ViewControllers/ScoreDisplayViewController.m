//
//  ScoreDisplayViewController.m
//  Bible Quiz
//
//  Created by Sirisha.G on 16/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import "ScoreDisplayViewController.h"

@interface ScoreDisplayViewController ()

@end

@implementation ScoreDisplayViewController
@synthesize appdelegate;
@synthesize score;
@synthesize managedObjectContext;
@synthesize singletonClass;
@synthesize inAppPurchase;
@synthesize heading_Lab;
@synthesize access_Lab;
@synthesize scoreTable;
@synthesize resultArray;
@synthesize background_ImgView;
@synthesize restart_Lab,play_Lab,upgrade_Lab,upgrade_Btn;
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
    heading_Lab.text=NSLocalizedString(@"SCOREBOARD", nil);
    access_Lab.text=NSLocalizedString(@"GET_ACCESS", nil);
    upgrade_Lab.text=NSLocalizedString(@"UPGRADE_VERSION", nil);
    restart_Lab.text=NSLocalizedString(@"RESTART", nil);
    play_Lab.text=NSLocalizedString(@"PLAY", nil);
    appdelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    managedObjectContext=appdelegate.managedObjectContext;
    NSError *errors = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Score" inManagedObjectContext:managedObjectContext];
	[request setEntity:entity];
    
    NSArray *scoreDetails = [[managedObjectContext executeFetchRequest:request error:&errors] mutableCopy];
    //scoreDetails=[[scoreDetails reverseObjectEnumerator]allObjects];
    NSMutableArray *arrays=[NSMutableArray arrayWithArray:scoreDetails];

   // resultArray=[[NSMutableArray alloc]init];
    resultArray=arrays;
    scoreTable.delegate=self;
    scoreTable.dataSource=self;
    [scoreTable reloadData];
    
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        restart_Lab.font=BUTTONS_FONT;
        play_Lab.font=BUTTONS_FONT;
        heading_Lab.font=Heading_FONT_Iphone;
        upgrade_Lab.font=UPGRADE_BTN_FONT;
        access_Lab.font=ACCESSLABEL_FONT;
//        CGSize size = [access_Lab.text sizeWithAttributes:
//                       @{NSFontAttributeName: access_Lab.font}];
//        CGSize accessframe = CGSizeMake(ceilf(size.width), ceilf(size.height));
        CGSize accessframe=[access_Lab.text sizeWithFont:access_Lab.font constrainedToSize:CGSizeMake(access_Lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:access_Lab.lineBreakMode];
//        CGSize size1 = [upgrade_Lab.text sizeWithAttributes:
//                       @{NSFontAttributeName: upgrade_Lab.font}];
//        CGSize upgrade = CGSizeMake(ceilf(size1.width), ceilf(size1.height));
        CGSize upgrade=[upgrade_Lab.text sizeWithFont:upgrade_Lab.font constrainedToSize:CGSizeMake(access_Lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:upgrade_Lab.lineBreakMode];
        
        access_Lab.numberOfLines=0;
        upgrade_Lab.numberOfLines=0;
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        if (screenHeight>500) {
            background_ImgView.image=[UIImage imageNamed:@"background_640x1136.png"];
        }
        else
        {
            background_ImgView.image=[UIImage imageNamed:@"background.png"];
        }
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"fr"] || ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"es"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"de"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt-PT"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"]) ||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"it"]) ||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"])) {
        if (screenHeight>500) {
        access_Lab.frame=CGRectMake(access_Lab.frame.origin.x, access_Lab.frame.origin.y+40, access_Lab.frame.size.width, accessframe.height);
        upgrade_Lab.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
        upgrade_Btn.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
        }
        else
        {
            access_Lab.frame=CGRectMake(access_Lab.frame.origin.x, access_Lab.frame.origin.y+20, access_Lab.frame.size.width, accessframe.height);
            upgrade_Lab.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
            upgrade_Btn.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
        }
        }
        else
        {
             if (screenHeight>500) {
            access_Lab.frame=CGRectMake(access_Lab.frame.origin.x, access_Lab.frame.origin.y+90, access_Lab.frame.size.width, accessframe.height);
            upgrade_Lab.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
            upgrade_Btn.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
             }
             else{
                 access_Lab.frame=CGRectMake(access_Lab.frame.origin.x, access_Lab.frame.origin.y+60, access_Lab.frame.size.width, accessframe.height);
                 upgrade_Lab.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
                upgrade_Btn.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
             }
        }
    }
    else
    {
        restart_Lab.font=BUTTONS_FONT_IPAD;
        play_Lab.font=BUTTONS_FONT_IPAD;
        heading_Lab.font=Heading_FONT_IPAD;
        upgrade_Lab.font=UPGRADE_BTN_FONT_IPAD;
        access_Lab.font=ACCESSLABEL_FONT_IPAD;
        
//        CGSize size = [access_Lab.text sizeWithAttributes:
//                       @{NSFontAttributeName: access_Lab.font}];
//        CGSize accessframe = CGSizeMake(ceilf(size.width), ceilf(size.height));

        CGSize accessframe=[access_Lab.text sizeWithFont:access_Lab.font constrainedToSize:CGSizeMake(access_Lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:access_Lab.lineBreakMode];
//        CGSize size1 = [upgrade_Lab.text sizeWithAttributes:
//                       @{NSFontAttributeName: upgrade_Lab.font}];
//        CGSize upgrade = CGSizeMake(ceilf(size1.width), ceilf(size1.height));
        CGSize upgrade=[upgrade_Lab.text sizeWithFont:upgrade_Lab.font constrainedToSize:CGSizeMake(upgrade_Lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:upgrade_Lab.lineBreakMode];
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"fr"] || ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"es"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"de"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt-PT"])||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"]) ||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"it"]) ||([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"])) {
        access_Lab.frame=CGRectMake(access_Lab.frame.origin.x, access_Lab.frame.origin.y-20,access_Lab.frame.size.width, accessframe.height);
        upgrade_Lab.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height+5, upgrade_Lab.frame.size.width, upgrade.height);
        upgrade_Btn.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height+5, upgrade_Lab.frame.size.width, upgrade.height);
        }
        else
        {
            access_Lab.frame=CGRectMake(access_Lab.frame.origin.x, access_Lab.frame.origin.y+60,access_Lab.frame.size.width, accessframe.height);
            upgrade_Lab.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
            upgrade_Btn.frame=CGRectMake(upgrade_Lab.frame.origin.x, access_Lab.frame.origin.y+access_Lab.frame.size.height, upgrade_Lab.frame.size.width, upgrade.height);
        }
        access_Lab.numberOfLines=0;
        upgrade_Lab.numberOfLines=0;
    }
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
    [self createTableHeader];
    restart_Lab.adjustsFontSizeToFitWidth=YES;
    play_Lab.adjustsFontSizeToFitWidth  =YES;
}
- (void)createTableHeader
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(scoreTable.frame.origin.x,0,scoreTable.frame.size.width,50)];
    UILabel *name ;
    UILabel *scorelab ;
    UILabel *date ;
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        name = [[UILabel alloc]initWithFrame:CGRectMake(headerView.frame.origin.x+20, 1, 100, 50)];
        scorelab = [[UILabel alloc]initWithFrame:CGRectMake(name.frame.origin.x+name.frame.size.width-30, 1, 140, 50)];
        date = [[UILabel alloc]initWithFrame:CGRectMake(scoreTable.frame.size.width-80, 1, 70, 50)];
    }
    else
    {
        name = [[UILabel alloc]initWithFrame:CGRectMake(headerView.frame.origin.x+45, 1, 200, 60)];
        scorelab = [[UILabel alloc]initWithFrame:CGRectMake(name.frame.origin.x+name.frame.size.width+30, 1, 280, 60)];
        date = [[UILabel alloc]initWithFrame:CGRectMake(scoreTable.frame.size.width-230, 1, 200, 60)];
    }
    name.text = NSLocalizedString(@"NAME LAB", nil);
    [name setBackgroundColor:[UIColor clearColor]];
    
    [headerView addSubview:name];
    
    scorelab.text = [NSString stringWithFormat:@"%@ %s",NSLocalizedString(@"SCORE", nil),"%"];
    [scorelab setBackgroundColor:[UIColor clearColor]];
    
    [headerView addSubview:scorelab];
    
    date.text =NSLocalizedString(@"DATE", nil);
    
    [date setBackgroundColor:[UIColor clearColor]];
    [headerView addSubview:date];
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        name .font=HEADER_LAB_FONT_IPHONE;
        scorelab.font=HEADER_LAB_FONT_IPHONE;
        date.font=HEADER_LAB_FONT_IPHONE;
        name.textAlignment=NSTextAlignmentLeft;
        scorelab.textAlignment=NSTextAlignmentCenter;
        date.textAlignment=NSTextAlignmentCenter;
    }
    else
    {
        name .font=[UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:40];
        scorelab.font=[UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:40];
        date.font=[UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:40];
        name.textAlignment=NSTextAlignmentLeft;
        scorelab.textAlignment=NSTextAlignmentCenter;
        date.textAlignment=NSTextAlignmentCenter;
    }
    self.scoreTable.tableHeaderView=headerView;
}
#pragma mark restart button action
- (IBAction)restart_Btn_Action:(id)sender
{
    if (!self.singletonClass) {
         singletonClass=[Singleton sharedSingleton];
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
    {
        
    }
#pragma mark UPGRADE BUTTON ACTION
- (IBAction)upgradeVersion_Btn_Action:(id)sender
{
    inAppPurchase = [InAppPurchase SharedInApp];
    inAppPurchase.delegate=self;
    [inAppPurchase purchaseProduct:[NSString stringWithFormat:INAPPPURCHASE_PRODUCT]];
}
#pragma mark inapp purchase action
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
}
#pragma mark play button action
- (IBAction)playBtn_Action:(id)sender
{
    if (!self.singletonClass) {
         singletonClass=[Singleton sharedSingleton];
    }
    self.singletonClass.correct_AnswerQues=0;
   
    if ([self.singletonClass.selected_Questions count]>15) {
        self.singletonClass.noOfRound++;
        NSArray *view=[self.navigationController viewControllers];
        UIViewController *viewControl=[view objectAtIndex:[view count]-3];
        [self.navigationController popToViewController:viewControl animated:YES];
    }
    else{
        self.singletonClass.noOfRound=0;
        NSArray *view=[self.navigationController viewControllers];
        UIViewController *viewControl=[view objectAtIndex:[view count]-5];
        [self.navigationController popToViewController:viewControl animated:YES];
    }
}
#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [resultArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier=@"cellidentifier";
    CustomTableViewCell *cell=(CustomTableViewCell*)[tableView dequeueReusableCellWithIdentifier:cellidentifier];
    
    if (cell == nil)
    {
        NSMutableArray *coupns;
        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
             coupns=[[[NSBundle mainBundle]loadNibNamed:@"CustomTableViewCell" owner:self options:nil] mutableCopy];
        }
       
        else{
           coupns=[[[NSBundle mainBundle]loadNibNamed:@"CustomTableViewCell_iPad" owner:self options:nil] mutableCopy]; 
        }
        
        for (id object in coupns){
            if ([object isKindOfClass:[UITableViewCell class]]) {
                cell=(CustomTableViewCell*)object;
            }
        }
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
      score=[resultArray objectAtIndex:indexPath.row];
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        cell .lab1.font=SCOREDETAILS_FONT_IPHONE;
        cell.lab2.font=SCOREDETAILS_FONT_IPHONE;
        cell.lab3.font=SCOREDETAILS_FONT_IPHONE;
    }
    else
    {
        cell .lab1.font=SCOREDETAILS_FONT_IPAD;
        cell.lab2.font=SCOREDETAILS_FONT_IPAD;
        cell.lab3.font=SCOREDETAILS_FONT_IPAD;
    }
      cell.lab1.text=score.name;
      cell.lab2.text=[NSString stringWithFormat:@"%@",score.score];
    [cell setBackgroundColor:[UIColor clearColor]];
    NSDateFormatter *dateformater=[[NSDateFormatter alloc]init];
    [dateformater setDateFormat:@"dd/MM/yy HH:mm:ss"];
    NSString *str=[NSString stringWithFormat:@"%@",[dateformater stringFromDate:score.date]];
     NSArray *dateArr=[str componentsSeparatedByString:@" "];
    NSString *date=[NSString stringWithFormat:@"%@",[dateArr objectAtIndex:0]];
    date=[date stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
      cell.lab3.text=date;
return cell;

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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
