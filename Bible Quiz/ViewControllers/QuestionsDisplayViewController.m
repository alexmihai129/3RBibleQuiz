//
//  QuestionsDisplayViewController.m
//  Bible Quiz
//
//  Created by Sirisha.G on 10/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import "QuestionsDisplayViewController.h"
#import "NSAttributedString+Attributes.h"
@interface QuestionsDisplayViewController ()

@end

@implementation QuestionsDisplayViewController
@synthesize questionNo_Lab,levelNo_Lab,question_Lab;
@synthesize appdelegate,singletonClass;
@synthesize managedObjectContext;
@synthesize bible_Class;
@synthesize optionA_Lab,optionB_Lab,optionC_Lab,optionD_Lab,optionE_Lab;
@synthesize optionA_Btn,optionB_Btn,optionC_Btn,optionD_Btn,optionE_Btn;
@synthesize optionsArray_Btns;
@synthesize optionArray_Labs;
@synthesize progressView;
@synthesize submit_Btn;
@synthesize noOfOptions;
@synthesize optionArray_Imgs;
@synthesize scroeViewController;
@synthesize quesOf;
@synthesize scrollview;
@synthesize background_ImgView;
@synthesize ischeck;
@synthesize restart_Lab,submit_Lab,rounds_Lab;
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
            self.optionA_Btn.frame = CGRectMake(260, 114, 40, 40);
            self.optionB_Btn.frame = CGRectMake(260, 169, 40, 40);
            self.optionC_Btn.frame = CGRectMake(260, 222, 40, 40);
            self.optionD_Btn.frame = CGRectMake(260, 270, 40, 40);
            self.optionE_Btn.frame = CGRectMake(260, 318, 40, 40);
            
            self.optionA_Lab.frame = CGRectMake(20, 114, 233, 40);
            self.optionB_Lab.frame = CGRectMake(20, 168, 233, 40);
            self.optionC_Lab.frame = CGRectMake(20, 218, 233, 40);
            self.optionD_Lab.frame = CGRectMake(20, 271, 233, 40);
            self.optionE_Lab.frame = CGRectMake(20, 319, 233, 40);
            
            
        }else {
//            If device is iPad
            self.optionA_Btn.frame = CGRectMake(678, 186, 60, 61);
            self.optionB_Btn.frame = CGRectMake(678, 270, 60, 61);
            self.optionC_Btn.frame = CGRectMake(678, 353, 60, 61);
            self.optionD_Btn.frame = CGRectMake(678, 436, 60, 61);
            self.optionE_Btn.frame = CGRectMake(678, 530, 60, 61);
            
            self.optionA_Lab.frame = CGRectMake(30, 181, 627, 65);
            self.optionB_Lab.frame = CGRectMake(30, 266, 627, 65);
            self.optionC_Lab.frame = CGRectMake(30, 370, 627, 65);
            self.optionD_Lab.frame = CGRectMake(30, 432, 627, 65);
            self.optionE_Lab.frame = CGRectMake(30, 531, 627, 65);
            
        }
        [self.optionA_Lab setTextAlignment:NSTextAlignmentRight];
        [self.optionB_Lab setTextAlignment:NSTextAlignmentRight];
        [self.optionC_Lab setTextAlignment:NSTextAlignmentRight];
        [self.optionD_Lab setTextAlignment:NSTextAlignmentRight];
        [self.optionE_Lab setTextAlignment:NSTextAlignmentRight];
        
        [self.question_Lab setTextAlignment:NSTextAlignmentRight];

    }else {
//        for language other than arabic buttons and text should be aligned to left
        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
//            If device is iPhone
            self.optionA_Btn.frame = CGRectMake(20, 114, 40, 40);
            self.optionB_Btn.frame = CGRectMake(20, 169, 40, 40);
            self.optionC_Btn.frame = CGRectMake(20, 222, 40, 40);
            self.optionD_Btn.frame = CGRectMake(20, 270, 40, 40);
            self.optionE_Btn.frame = CGRectMake(20, 318, 40, 40);
            
            self.optionA_Lab.frame = CGRectMake(67, 114, 233, 35);
            self.optionB_Lab.frame = CGRectMake(67, 168, 233, 35);
            self.optionC_Lab.frame = CGRectMake(67, 218, 233, 35);
            self.optionD_Lab.frame = CGRectMake(67, 271, 233, 35);
            self.optionE_Lab.frame = CGRectMake(67, 319, 233, 35);
            
        }else {
//            If device is iPad
            self.optionA_Btn.frame = CGRectMake(30, 186, 60, 61);
            self.optionB_Btn.frame = CGRectMake(30, 270, 60, 61);
            self.optionC_Btn.frame = CGRectMake(30, 353, 60, 61);
            self.optionD_Btn.frame = CGRectMake(30, 436, 60, 61);
            self.optionE_Btn.frame = CGRectMake(30, 530, 60, 61);
            
            self.optionA_Lab.frame = CGRectMake(110, 181, 627, 65);
            self.optionB_Lab.frame = CGRectMake(110, 266, 627, 65);
            self.optionC_Lab.frame = CGRectMake(110, 370, 627, 65);
            self.optionD_Lab.frame = CGRectMake(110, 432, 627, 65);
            self.optionE_Lab.frame = CGRectMake(110, 531, 627, 65);

        }
        [self.optionA_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.optionB_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.optionC_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.optionD_Lab setTextAlignment:NSTextAlignmentLeft];
        [self.optionE_Lab setTextAlignment:NSTextAlignmentLeft];
        
        [self.question_Lab setTextAlignment:NSTextAlignmentLeft];

    }

    
    ischeck=NO;
    progressView.progress=0.0;
    submit_Lab.text=NSLocalizedString(@"SUBMIT", nil);
    restart_Lab.text=NSLocalizedString(@"RESTART", nil);
    if (!singletonClass) {
         singletonClass=[Singleton sharedSingleton];
    }
    singletonClass.correct_AnswerQues=0;
    singletonClass.progressval=0.0;
    singletonClass.isQuestionView=YES;
    singletonClass.ischeck=NO;
    singletonClass.selectedId=nil;
    self.singletonClass.quesOf=1;
    optionsArray_Btns=[[NSMutableArray alloc]initWithObjects:optionA_Btn,optionB_Btn,optionC_Btn,optionD_Btn,optionE_Btn, nil];
    optionArray_Labs=[[NSMutableArray alloc]initWithObjects:optionA_Lab,optionB_Lab,optionC_Lab,optionD_Lab,optionE_Lab, nil];
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        optionArray_Imgs=[[NSMutableArray alloc]initWithObjects:@"btn_a.png",@"btn_b.png",@"btn_c.png",@"btn_d.png",@"btn_e.png", nil];
    }
    else{
        optionArray_Imgs=[[NSMutableArray alloc]initWithObjects:@"btn_a_Ipad.png",@"btn_b_Ipad.png",@"btn_c_Ipad.png",@"btn_d_Ipad.png",@"btn_e_Ipad.png", nil];
    }
    
    for (int i=0; i<[optionsArray_Btns count]; i++) {
        UIButton *btn=[optionsArray_Btns objectAtIndex:i];
        btn.hidden=YES;
    }
    if ([self.singletonClass.selected_Questions count]>=15) {
    for (int i=0; i<15; i++) {
        int index= [self getRandomNumber:1 to:(int)[self.singletonClass.selected_Questions count]-1];
        [self.singletonClass.selected_RandomQuestions insertObject:[self.singletonClass.selected_Questions objectAtIndex:index] atIndex:i];
        [self.singletonClass.selected_Questions removeObjectAtIndex:index];
    }
        if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"])
        {
            levelNo_Lab.text=[NSString stringWithFormat:@"%i %@",self.singletonClass.noOfLevel,NSLocalizedString(@"LEVEL_SELECT", nil)];
        }
        else
        {
        levelNo_Lab.text=[NSString stringWithFormat:@"%@ %i",NSLocalizedString(@"LEVEL_SELECT", nil),self.singletonClass.noOfLevel];
        }
        
    }
    else{
        levelNo_Lab.text=@"";
    }
   
    
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        restart_Lab.font=BUTTONS_FONT;
        submit_Lab.font=BUTTONS_FONT;
        questionNo_Lab.font=Heading_FONT_Iphone;
        levelNo_Lab.font=Heading_FONT_Iphone;
        rounds_Lab.font=BUTTONS_FONT;
        progressView.layer.cornerRadius=2.0f;
        CGAffineTransform transform ;
//        CATransform3D transform_ios7;
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
            transform = CGAffineTransformMakeScale(1.0f,1.5f);
            progressView.transform = transform;
        }
        else{
            transform = CGAffineTransformMakeScale(1.0f,6.0f);
//            transform_ios7 = CATransform3DScale(progressView.layer.transform, 1.0f, 6.0f, 1.0f);
            progressView.transform = transform;
        }
        
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
        restart_Lab.font=BUTTONS_FONT_IPAD;
        submit_Lab.font=BUTTONS_FONT_IPAD;
        questionNo_Lab.font=Heading_FONT_IPAD;
        levelNo_Lab.font=Heading_FONT_IPAD;
        rounds_Lab.font=BUTTONS_FONT_IPAD;
        progressView.layer.cornerRadius=3.0f;
        CGAffineTransform transform;
//        CATransform3D transform_ios7;
        if (SYSTEM_VERSION_LESS_THAN(@"7"))
        {
            transform = CGAffineTransformMakeScale(1.0f,3.0f);
            progressView.transform = transform;
        }
        else
        {
            transform = CGAffineTransformMakeScale(1.0f,12.0f);
//            transform_ios7 = CATransform3DScale(progressView.layer.transform, 1.0f, 10.0f, 1.0f);
            progressView.transform = transform;
        }
    }
    if ([self.singletonClass.selected_RandomQuestions count] >0) {
        rounds_Lab.text=[NSString stringWithFormat:@"%@ %i",NSLocalizedString(@"ROUNDTEXT", nil),self.singletonClass.noOfRound];
        for (int shuffleIndex = (int)[self.singletonClass.selected_RandomQuestions count] - 1; shuffleIndex > 0; shuffleIndex--)
            [self.singletonClass.selected_RandomQuestions exchangeObjectAtIndex:shuffleIndex withObjectAtIndex:random() % (shuffleIndex + 1)];
    
    singletonClass.randomQues_No  =[self getRandomNumber:0 to:(int)[singletonClass.selected_RandomQuestions count]-1];
    [self questionsDisplay];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(activeQuestion) name:@"active" object:nil];
    }
    else
    {
        rounds_Lab  .text=@"";
        
    }
    restart_Lab.adjustsFontSizeToFitWidth=YES;
    submit_Lab.adjustsFontSizeToFitWidth=YES;
    rounds_Lab.adjustsFontSizeToFitWidth=YES;
    levelNo_Lab.adjustsFontSizeToFitWidth=YES;
   }
- (void)activeQuestion
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"active" object:nil];
    if (!self.singletonClass) {
        self.singletonClass=[Singleton sharedSingleton];
    }
    [singletonClass.sixtySec_Timer invalidate];
    singletonClass.sixtySec_Timer=nil;
    [singletonClass.tenSec_Timer invalidate];
    singletonClass.tenSec_Timer=nil;
    if (self.singletonClass.ischeck==YES) {
        [self submitAction];
    }
    else
    {
      [self questionsDisplay];  
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(activeQuestion) name:@"active" object:nil];
   
    
     
}
- (void)viewDidAppear:(BOOL)animated
{
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    if (!singletonClass) {
        singletonClass=[Singleton sharedSingleton];
    }
    [super viewWillDisappear:YES];
    singletonClass.isQuestionView=NO;
    [singletonClass.sixtySec_Timer invalidate];
    singletonClass.sixtySec_Timer=nil;
    [singletonClass.tenSec_Timer invalidate];
    singletonClass.tenSec_Timer=nil;
    
}
#pragma mark QUESTION DISPLAY
- (void)questionsDisplay
{
    
    [alert dismissWithClickedButtonIndex:-1 animated:YES];
    submit_Lab.text=NSLocalizedString(@"SUBMIT", nil);
    ischeck=NO;
    submit_Btn.titleLabel.adjustsFontSizeToFitWidth=YES;
    UIButton *btn;
    TTTAttributedLabel *lab;
    if (!singletonClass) {
        singletonClass=[Singleton sharedSingleton];
    }
    self.singletonClass.selected_Answer=@"";
    //self.singletonClass.progressval=0.0;
    self.singletonClass.ischeck=NO;
    
    if ([self.singletonClass.selected_RandomQuestions count]>0) {
         rounds_Lab.text=[NSString stringWithFormat:@"%@ %i",NSLocalizedString(@"ROUNDTEXT", nil),self.singletonClass.noOfRound];
        for (int i=0; i<[optionsArray_Btns count]; i++) {
            btn=[optionsArray_Btns objectAtIndex:i];
            btn.hidden=YES;
        }
        for (int i=0; i<[optionArray_Labs count]; i++) {
            lab=[optionArray_Labs objectAtIndex:i];
            lab.text=@"";
            lab.hidden=YES;
        }
        question_Lab.text=@"";
        bible_Class=[self.singletonClass.selected_RandomQuestions objectAtIndex:singletonClass.randomQues_No];
        NSString *quiz=[NSString stringWithFormat:@"%@",bible_Class.quiz];
        quiz=[quiz stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        question_Lab.text=quiz;
        NSRange name2Range = [question_Lab.text rangeOfString:quiz];
        NSMutableAttributedString* attrStr = [question_Lab.attributedText mutableCopy];
        
        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
        {
            if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                question_Lab.font=ARABIC_QUESTION_FONT_SIZE;
            }else {
                question_Lab.font=QUESTION_FONT_SIZE;
            }
            if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:19 range:name2Range];
            }else {
                [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:18 range:name2Range];
            }
            
        }
        else
        {
            if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                question_Lab.font=ARABIC_QUESTION_FONT_IPAD;
            }else {
                question_Lab.font=QUESTION_FONT_IPAD;
            }
            if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:32 range:name2Range];
            }else {
                [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:30 range:name2Range];
            }
        }
        [attrStr setTextColor:[UIColor blackColor]];
        question_Lab.attributedText = attrStr;
        
//        CGSize size = [[attrStr string] sizeWithAttributes:
//                       @{NSFontAttributeName: question_Lab.font}];
//        CGSize questionSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
        
        CGSize questionSize=[[attrStr string] sizeWithFont:question_Lab.font constrainedToSize:CGSizeMake(question_Lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:question_Lab.lineBreakMode];
        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
            question_Lab.frame=CGRectMake(question_Lab.frame.origin.x, question_Lab.frame.origin.y,question_Lab.frame.size.width, questionSize.height+20);
        }
        else
        {
            question_Lab.frame=CGRectMake(question_Lab.frame.origin.x, question_Lab.frame.origin.y,question_Lab.frame.size.width, questionSize.height+10);
        }
        noOfOptions=[bible_Class.answer componentsSeparatedByString:@"/"];
        NSLog(@"Question id : %@",bible_Class.questionID);
        for (int i=0; i<[noOfOptions count]; i++) {
           btn=[optionsArray_Btns objectAtIndex:i];
            btn.hidden=NO;
            btn.userInteractionEnabled=YES;
            
            lab=[optionArray_Labs objectAtIndex:i];
            lab.hidden=NO;
            NSString *str=[NSString stringWithFormat:@"%@",[[noOfOptions objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
            lab.text=[[noOfOptions objectAtIndex:i] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            NSRange name2Range = [lab.text rangeOfString:str];
            NSMutableAttributedString* attrStr = [lab.attributedText mutableCopy];
            if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
                if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                    lab.font=ARABIC_QUESTION_OPTIONS_FONT;
                }else {
                    lab.font=QUESTION_OPTIONS_FONT;
                }
                
                if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:19 range:name2Range];
                }else {
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:18 range:name2Range];
                }
            }
            else{
                if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                    lab.font=ARABIC_QUESTION_OPTIONS_FONT_IPAD;
                }else {
                    lab.font=QUESTION_OPTIONS_FONT_IPAD;
                }
                if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:32 range:name2Range];
                }else {
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:30 range:name2Range];
                }
            }
            [attrStr setTextColor:[UIColor blackColor]];
            lab.attributedText = attrStr;
            lab.textColor=[UIColor blackColor];
            lab.numberOfLines=0;
            
//            CGSize size = [[attrStr string] sizeWithAttributes:
//                           @{NSFontAttributeName: lab.font}];
//            CGSize frame = CGSizeMake(ceilf(size.width), ceilf(size.height));
            
            CGSize frame=[[attrStr string] sizeWithFont:lab.font constrainedToSize:CGSizeMake(lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:lab.lineBreakMode];
            if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]){
                frame.height = (frame.height/35 )*10 + frame.height;
            }
            if (SYSTEM_VERSION_LESS_THAN(@"7")) {
//                frame.height=frame.height+10;
            }
            else
            {
                if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"])
                {
                    frame.height=frame.height+5;
                }
                    
            }
            
            if (i==0) {
                if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
                    lab.frame=CGRectMake(lab.frame.origin.x, question_Lab.frame.size.height+15, lab.frame.size.width, frame.height);
                    btn.frame=CGRectMake(btn.frame.origin.x, lab.frame.origin.y, btn.frame.size.width, btn.frame.size.height);
                }
                else{
                    lab.frame=CGRectMake(lab.frame.origin.x, question_Lab.frame.size.height+40, lab.frame.size.width, frame.height);
                    btn.frame=CGRectMake(btn.frame.origin.x, lab.frame.origin.y, btn.frame.size.width, btn.frame.size.height);
                }
            }
            else {
                TTTAttributedLabel *origin=[optionArray_Labs objectAtIndex:i-1];
//                origin.lineBreakMode = NSLineBreakByWordWrapping;
//                origin.numberOfLines = 0;

//                CGSize size = [[attrStr string] sizeWithAttributes:
//                               @{NSFontAttributeName: origin.font}];
//                CGSize height = CGSizeMake(ceilf(size.width), ceilf(size.height));
                CGSize height=[[attrStr string] sizeWithFont:origin.font constrainedToSize:CGSizeMake(origin.frame.size.width, CGFLOAT_MAX) lineBreakMode:origin.lineBreakMode];
//                height.height = (frame.height/35 )*10 + height.height;
//                if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]){
//                    height.height = (frame.height/35 )*10 + height.height;
//                }
                if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
                    lab.frame=CGRectMake(lab.frame.origin.x, origin.frame.size.height+origin.frame.origin.y+25, lab.frame.size.width, height.height);
                    btn.frame=CGRectMake(btn.frame.origin.x, lab.frame.origin.y, btn.frame.size.width, btn.frame.size.height);
                }
                else{
                    lab.frame=CGRectMake(lab.frame.origin.x, origin.frame.size.height+origin.frame.origin.y+40, lab.frame.size.width, height.height);
                    btn.frame=CGRectMake(btn.frame.origin.x, lab.frame.origin.y, btn.frame.size.width, btn.frame.size.height);
                }
            }
            scrollview.contentSize=CGSizeMake(self.view.frame.size.width, lab.frame.size.height+lab.frame.origin.y + 30);
        }
        questionNo_Lab.text=[NSString stringWithFormat:@"%@ %i %@ 15",NSLocalizedString(@"QUESTION", nil),singletonClass.quesOf,NSLocalizedString(@"OF", nil)];
        progressView.progress = singletonClass.progressval;
        if (singletonClass.isSelect) {
        for (int i=0; i<[noOfOptions count]; i++) {
            if (i==singletonClass.selectedId) {
                if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
                   
                [btn setImage:[UIImage imageNamed:@"checkiphone_img.png"] forState:UIControlStateNormal];
                }
                else{
                     [btn setImage:[UIImage imageNamed:@"checkipad_img.png"] forState:UIControlStateNormal];
                }
            }
            else
            {
                [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[optionArray_Imgs objectAtIndex:i]]] forState:UIControlStateNormal];
            }
        }
        }
        else
        {
            singletonClass.isSelect=NO;
           [self images_OptionsBtns];
        }
            
        
      singletonClass. sixtySec_Timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(displayNextQuestion) userInfo:nil repeats:YES];
       }
    else
    {
        rounds_Lab.text=@"";
        [singletonClass.sixtySec_Timer invalidate];
        singletonClass.sixtySec_Timer=nil;
        [singletonClass.tenSec_Timer invalidate];
        singletonClass.tenSec_Timer=nil;
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
-(int)getRandomNumber:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}
#pragma mark DISPLAY QUESTION IN ORDER
- (void)displayNextQuestion
{
    if (!singletonClass) {
        singletonClass=[Singleton sharedSingleton];
        
    }
    
    if (progressView.progress<1.0)
    {
       [progressView setProgress: progressView.progress + 1.0 / 60.0];
        
        singletonClass.progressval=progressView.progress;
    }
    else{
        [singletonClass.tenSec_Timer invalidate];
        singletonClass.tenSec_Timer=nil;
        [singletonClass.sixtySec_Timer invalidate];
        singletonClass.sixtySec_Timer=nil;
        singletonClass.progressval=0.0;
        [self timer_Action];
    }
}
#pragma mark  60 SEC TIMER ACTION
-(void)timer_Action
{
    [alert dismissWithClickedButtonIndex:-1 animated:NO];
    if (!singletonClass) {
        singletonClass=[Singleton sharedSingleton];
    }
    if ([submit_Lab.text isEqualToString:NSLocalizedString(@"SUBMIT", nil)]) {
        BOOL isCheck=NO;
        for (int i=0; i<[noOfOptions count]; i++) {
            UIButton *btn=[optionsArray_Btns objectAtIndex:i];
            if (btn.currentImage==[UIImage imageNamed:@"checkiphone_img.png"] ||btn.currentImage==[UIImage imageNamed:@"checkipad_img.png"]) {
                isCheck=YES;
                self.singletonClass.ischeck=YES;
                self.singletonClass.selected_Answer=[self.noOfOptions objectAtIndex:i];
            }
        }
        if (isCheck==YES) {
            singletonClass.progressval=0.0;
            [self submitAction];
        }
        else
        {

            [self nextbtnAction];
        }
    }
    else
    {

        [self nextbtnAction];
    }
}
#pragma mark 10 SEC TIMER ACTION
- (void)nexttimer
{
    if (!singletonClass) {
        singletonClass=[Singleton sharedSingleton];
        
    }

    if (progressView.progress<1.0)
    {
        [progressView setProgress: progressView.progress + 1.0 / 10.0];
               singletonClass.progressval=progressView.progress;
    }
    else{
        [singletonClass.tenSec_Timer invalidate];
        singletonClass.tenSec_Timer=nil;
        [singletonClass.sixtySec_Timer invalidate];
        singletonClass.sixtySec_Timer=nil;
        singletonClass.progressval=0.0;
        [self nextbtnAction];
        }
}
#pragma mark OPTIONS BUTTONS ACTION
- (IBAction)optionBtn_Action:(UIButton *)sender
{
    if (!singletonClass) {
        singletonClass=[Singleton sharedSingleton];
    }
    singletonClass.selectedId=(int)sender.tag;
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        if (sender.currentImage==[UIImage imageNamed:@"checkiphone_img.png"]) {
            [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[optionArray_Imgs objectAtIndex:[sender tag]]]] forState:UIControlStateNormal];
            singletonClass.isSelect=NO;
        }
        else{
            [self images_OptionsBtns];
            [sender setImage:[UIImage imageNamed:@"checkiphone_img.png"] forState:UIControlStateNormal];
            singletonClass.isSelect=YES;
        }
    }
    else{
        if (sender.currentImage==[UIImage imageNamed:@"checkipad_img.png"]) {
            [sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[optionArray_Imgs objectAtIndex:[sender tag]]]] forState:UIControlStateNormal];
            singletonClass.isSelect=NO;
        }
        else{
            [self images_OptionsBtns];
            [sender setImage:[UIImage imageNamed:@"checkipad_img.png"] forState:UIControlStateNormal];
            singletonClass.isSelect=YES;
        }
    }
}
#pragma mark SET IMAGES FOR OPTIONS BUTTONS
- (void)images_OptionsBtns
{
    [[optionsArray_Btns objectAtIndex:0] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[optionArray_Imgs objectAtIndex:0]]] forState:UIControlStateNormal];
    [[optionsArray_Btns objectAtIndex:1] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[optionArray_Imgs objectAtIndex:1]]] forState:UIControlStateNormal];
    [[optionsArray_Btns objectAtIndex:2] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[optionArray_Imgs objectAtIndex:2]]] forState:UIControlStateNormal];
    [[optionsArray_Btns objectAtIndex:3] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[optionArray_Imgs objectAtIndex:3]]] forState:UIControlStateNormal];
    [[optionsArray_Btns objectAtIndex:4] setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[optionArray_Imgs objectAtIndex:4]]] forState:UIControlStateNormal];
}
#pragma mark SUBMIT BUTTON ACTION
- (IBAction)submitBtnAction:(UIButton *)sender
{
    if ([self.singletonClass.selected_RandomQuestions count]>0 ||[submit_Lab.text isEqualToString:NSLocalizedString(@"NEXT", nil)]) {
    BOOL isCheck=NO;
        UIButton *btn;
    if ([submit_Lab.text isEqualToString:NSLocalizedString(@"SUBMIT", nil)]) {
        for (int i=0; i<[noOfOptions count]; i++) {
           btn=[optionsArray_Btns objectAtIndex:i];
            
            
            
            if ([[btn imageForState:UIControlStateNormal] isEqual: [UIImage imageNamed:@"checkiphone_img.png"]] ||[[btn imageForState:UIControlStateNormal] isEqual: [UIImage imageNamed:@"checkipad_img.png"]]) {
                    isCheck=YES;
                 self.singletonClass.ischeck=YES;
                    self.singletonClass.selected_Answer=[self.noOfOptions objectAtIndex:i];
                }
        }
    if (isCheck) {
        singletonClass.progressval=0.0;
        [self submitAction];
         }
    else{
        btn=nil;
        [self shaowAlert:NSLocalizedString(@"ANSWER", nil) tag:2 button:[NSArray arrayWithObjects:NSLocalizedString(@"OKAY", nil), nil]];
        self.singletonClass.selected_Answer=@"";
    }
    }
    else{
        [self nextbtnAction];
    }
    }
}
- (void)submitAction
{
    
    if (!singletonClass) {
        singletonClass=[Singleton sharedSingleton];
    }
    self.singletonClass.ischeck=YES;
    //singletonClass.isSelect=NO;
    [singletonClass.sixtySec_Timer invalidate];
    
    singletonClass.sixtySec_Timer=nil;
    singletonClass.tenSec_Timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nexttimer) userInfo:nil repeats:YES];
    progressView.progress=singletonClass.progressval;
    bible_Class=[self.singletonClass.selected_RandomQuestions objectAtIndex:self.singletonClass.randomQues_No];
    int index=(int)[bible_Class.okindex integerValue]-1;
    NSLog(@"Answer index : %d",index);
    TTTAttributedLabel *lab;
    UIButton *answer_Btn;
    for (int i=0; i<[noOfOptions count]; i++)
    {
//        CGSize frame_Size;
        if ([[self.noOfOptions objectAtIndex:i ]  isEqualToString:[self.noOfOptions objectAtIndex:index]]) {
            lab=[optionArray_Labs objectAtIndex:i];
            lab.textColor=[UIColor blackColor];
            bible_Class=[self.singletonClass.selected_RandomQuestions objectAtIndex:self.singletonClass.randomQues_No];
            NSString *str1=[[NSString stringWithFormat:@"%@",[self.noOfOptions objectAtIndex:i]]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            NSString *str=[[NSString stringWithFormat:@"%@",bible_Class.biblereference]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            lab.text=[NSString stringWithFormat:@"%@ ~ %@",str1,str];
            NSRange name1Range = [lab.text rangeOfString:str1];
            NSRange name2Range=[lab.text rangeOfString:str];
            NSMutableAttributedString* attrStr = [lab.attributedText mutableCopy];
            if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
                if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:19 range:name1Range];
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:19 range:name2Range];
                }else {
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:18 range:name1Range];
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:18 range:name2Range];
                }
            }
            else{
                if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:32 range:name1Range];
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:32 range:name2Range];
                }else {
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:30 range:name1Range];
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:30 range:name2Range];
                }
                
            }
            [attrStr setTextIsUnderlined:YES range:name2Range];
            [attrStr setTextColor:[UIColor blackColor]];
            lab.attributedText = attrStr;
            answer_Btn=[optionsArray_Btns objectAtIndex:i];
            answer_Btn.userInteractionEnabled=NO;
            if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
                [answer_Btn setImage:[UIImage imageNamed:@"ok_icon.png"] forState:UIControlStateNormal];
            }
            else{
                [answer_Btn setImage:[UIImage imageNamed:@"ok_icon_Ipad.png"] forState:UIControlStateNormal];
            }
        }
        else{
            lab=[optionArray_Labs objectAtIndex:i];
            lab.textColor=[UIColor redColor];
            lab.textColor=[UIColor redColor];
            NSString *str1=[[NSString stringWithFormat:@"%@",[self.noOfOptions objectAtIndex:i]]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            lab.text=[NSString stringWithFormat:@"%@",str1];
            NSRange name1Range = [lab.text rangeOfString:str1];
            NSMutableAttributedString* attrStr = [lab.attributedText mutableCopy];
            if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
                if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:19 range:name1Range];
                }else {
                   [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:18 range:name1Range];
                }
                
            }
            else
            {
                if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:32 range:name1Range];
                }else {
                    [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:30 range:name1Range];
                }
             
            }
            [attrStr setTextColor:[UIColor redColor]];
            lab.attributedText = attrStr;
//            CGSize size = [[attrStr string] sizeWithAttributes:
//                           @{NSFontAttributeName: lab.font}];
//            CGSize frame_Size = CGSizeMake(ceilf(size.width), ceilf(size.height));
////            frame_Size=[[attrStr string] sizeWithFont:lab.font constrainedToSize:CGSizeMake(lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:lab.lineBreakMode];
            answer_Btn=[optionsArray_Btns objectAtIndex:i];
            answer_Btn.userInteractionEnabled=NO;
            [answer_Btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[optionArray_Imgs objectAtIndex:i]]] forState:UIControlStateNormal];
        }
    }
    for (int i=0; i<[noOfOptions count]; i++) {
        lab=[optionArray_Labs objectAtIndex:i];
       answer_Btn=[optionsArray_Btns objectAtIndex:i];
        answer_Btn.userInteractionEnabled=NO;
        NSString *str1;
       
        if ([[self.noOfOptions objectAtIndex:i ]  isEqualToString:[self.noOfOptions objectAtIndex:index]]) {
            str1=[[NSString stringWithFormat:@"%@ ~ %@",[self.noOfOptions objectAtIndex:i],bible_Class.biblereference]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
        else
        {
            str1=[[NSString stringWithFormat:@"%@",[self.noOfOptions objectAtIndex:i]]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        }
        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
            if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                lab.font=ARABIC_QUESTION_OPTIONS_FONT;
            }else {
                lab.font=QUESTION_OPTIONS_FONT;
            }
        }
        else{
            if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
                lab.font=ARABIC_QUESTION_OPTIONS_FONT_IPAD;
            }else {
                lab.font=QUESTION_OPTIONS_FONT_IPAD;
            }
        }
        
/*
 [attrStr setFontName:NSLocalizedString(@"RCON", nil) size:30 range:name2Range];
 CGSize questionSize=[[attrStr string] sizeWithFont:question_Lab.font constrainedToSize:CGSizeMake(question_Lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:question_Lab.lineBreakMode];
 */
//        NSMutableAttributedString* attrStr1 = [lab.attributedText mutableCopy];
//        NSRange nameRange = [lab.text rangeOfString:[attrStr1 string]];
//        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
//            [attrStr1 setFontName:NSLocalizedString(@"RCON", nil) size:18 range:nameRange];
//        }
//        else{
//            [attrStr1 setFontName:NSLocalizedString(@"RCON", nil) size:30 range:nameRange];
//        }
//        lab.attributedText = attrStr1;
//        lab.lineBreakMode = NSLineBreakByWordWrapping;
//        lab.numberOfLines = 0;
        
//        CGSize size = [str1 sizeWithAttributes:
//                       @{NSFontAttributeName: lab.font}];
//        CGSize frame = CGSizeMake(ceilf(size.width), ceilf(size.height));
       
        CGSize frame=[str1 sizeWithFont:lab.font constrainedToSize:CGSizeMake(lab.frame.size.width, CGFLOAT_MAX) lineBreakMode:lab.lineBreakMode];
        
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]){
            frame.height = (frame.height/35 )*10 + frame.height;
        }
 
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
            
        }
        else
        {
             if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"])
            {
                frame.height=frame.height+5;
            }
        }
        if (i==0) {
            if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
                lab.frame=CGRectMake(lab.frame.origin.x, question_Lab.frame.size.height+15, lab.frame.size.width, frame.height);
                answer_Btn.frame=CGRectMake(answer_Btn.frame.origin.x, lab.frame.origin.y, answer_Btn.frame.size.width, answer_Btn.frame.size.height);
            }
            else{
                lab.frame=CGRectMake(lab.frame.origin.x, question_Lab.frame.size.height+40, lab.frame.size.width, frame.height);
                answer_Btn.frame=CGRectMake(answer_Btn.frame.origin.x, lab.frame.origin.y, answer_Btn.frame.size.width, answer_Btn.frame.size.height);
            }
        }
        else {
            TTTAttributedLabel *origin=[optionArray_Labs objectAtIndex:i-1];
            if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
                lab.frame=CGRectMake(lab.frame.origin.x, origin.frame.size.height+origin.frame.origin.y+25, lab.frame.size.width, frame.height);
                answer_Btn.frame=CGRectMake(answer_Btn.frame.origin.x, lab.frame.origin.y, answer_Btn.frame.size.width, answer_Btn.frame.size.height);
            }
            else{
                lab.frame=CGRectMake(lab.frame.origin.x, origin.frame.size.height+origin.frame.origin.y+40, lab.frame.size.width, frame.height);
                answer_Btn.frame=CGRectMake(answer_Btn.frame.origin.x, lab.frame.origin.y, answer_Btn.frame.size.width, answer_Btn.frame.size.height);
            }
        }
        scrollview.contentSize=CGSizeMake(self.view.frame.size.width, lab.frame.size.height+lab.frame.origin.y+30);
    }
    submit_Lab.text=NSLocalizedString(@"NEXT", nil);
    
}
#pragma mark NEXT BUTTON ACTION
- (void)nextbtnAction
{
    
    if (!singletonClass) {
        singletonClass=[Singleton sharedSingleton];
    }
    submit_Lab.text=NSLocalizedString(@"SUBMIT", nil);
    [singletonClass.sixtySec_Timer invalidate];
    singletonClass.sixtySec_Timer=nil;
    [singletonClass.tenSec_Timer invalidate];
    singletonClass.tenSec_Timer=nil;
    singletonClass.selectedId=nil;
    singletonClass.isSelect=NO;
    if ([self.singletonClass.selected_RandomQuestions count]>0)
    {
        if (self.singletonClass.ischeck==YES) {
           
            bible_Class=[self.singletonClass.selected_RandomQuestions objectAtIndex:self.singletonClass.randomQues_No];
            int index=(int)[bible_Class.okindex integerValue]-1;
                if ([self.singletonClass.selected_Answer isEqualToString:[self.noOfOptions objectAtIndex:index]]) {
                    self.singletonClass.correct_AnswerQues=self.singletonClass.correct_AnswerQues+1;
                    self.singletonClass.selected_Answer=@"";
                }
            self.singletonClass.ischeck=NO;
            }
           [self.singletonClass.selected_RandomQuestions removeObjectAtIndex:singletonClass.randomQues_No];
        if ([self.singletonClass.selected_RandomQuestions count]>0) {
            singletonClass.quesOf++;
            singletonClass.randomQues_No  =[self getRandomNumber:0 to:(int)[singletonClass.selected_RandomQuestions count]-1];
            singletonClass.progressval=0.0;
             self.singletonClass.isSelect=NO;
            [self questionsDisplay];
        }
        else{
            if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
                if (SYSTEM_VERSION_LESS_THAN(@"7")) {
                     scroeViewController=[[ScoreViewController alloc]initWithNibName:@"ScoreView" bundle:nil];
                }
                else
                {
                     scroeViewController=[[ScoreViewController alloc]initWithNibName:@"ScoreView_iOS7" bundle:nil];
                }
               
            }
            else{
                if (SYSTEM_VERSION_LESS_THAN(@"7")) {
                     scroeViewController=[[ScoreViewController alloc]initWithNibName:@"ScoreView_Ipad" bundle:nil];
                }
                else
                {
                     scroeViewController=[[ScoreViewController alloc]initWithNibName:@"ScoreViewiOS7_iPad" bundle:nil];
                }
               
            }
            [self.navigationController pushViewController:scroeViewController animated:YES];
            
        }
    }
    else
    {
        if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
            if (SYSTEM_VERSION_LESS_THAN(@"7")) {
                scroeViewController=[[ScoreViewController alloc]initWithNibName:@"ScoreView" bundle:nil];
            }
            else
            {
                scroeViewController=[[ScoreViewController alloc]initWithNibName:@"ScoreView_iOS7" bundle:nil];
            }
        }
        else{
            if (SYSTEM_VERSION_LESS_THAN(@"7")) {
                scroeViewController=[[ScoreViewController alloc]initWithNibName:@"ScoreView_Ipad" bundle:nil];
            }
            else
            {
                scroeViewController=[[ScoreViewController alloc]initWithNibName:@"ScoreViewiOS7_iPad" bundle:nil];
            }
        }
        [self.navigationController pushViewController:scroeViewController animated:YES];
    }
    
}
#pragma mark SHOW ALERT METHOD
- (void)shaowAlert:(NSString*)message tag:(int)tag button:(NSArray *)buttons{
    
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
    scroeViewController=nil;
    [super viewDidUnload];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
