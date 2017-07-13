//
//  HomeViewController.m
//  Bible Quiz
//
//  Created by Sirisha.G on 09/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import "HomeViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize background_Img;
@synthesize bottom_Img;
@synthesize infoViewController;
@synthesize helpViewcontroller;
@synthesize playViewcontroller;
@synthesize english,french,spanish;
@synthesize managesObjectContext;
@synthesize appdelegate;
@synthesize singletonObject;
@synthesize loding_view;
@synthesize info_Lab,help_Lab,play_Lab;
@synthesize germen,portuguese,chinese,russian;
@synthesize italian,arabic;
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
    NSLog(@"%@",[NSLocale preferredLanguages]);
    [super viewWillAppear:YES];
    if (!singletonObject) {
        singletonObject=[Singleton sharedSingleton];
    }
    
    singletonObject.delegate=self;
    if (!self.loding_view) {
        self.loding_view=[[MBProgressHUD alloc]initWithView:self.view];
    }
    [self.view addSubview:self.loding_view];
    self.loding_view.labelText=NSLocalizedString(@"LOADING_TEXT", nil);
    self.loding_view.delegate=self;
    [self.loding_view show:YES];

    info_Lab.text= NSLocalizedString(@"INFO", nil);
    help_Lab.text=NSLocalizedString(@"HELP", nil);
    play_Lab.text=NSLocalizedString(@"PLAY", nil);
    info_Lab.adjustsFontSizeToFitWidth=YES;
    help_Lab.adjustsFontSizeToFitWidth  =YES;
    play_Lab.adjustsFontSizeToFitWidth  =YES;
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        info_Lab.font=BUTTONS_FONT;
        help_Lab.font=BUTTONS_FONT;
        play_Lab.font=BUTTONS_FONT;
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenHeight = screenRect.size.height;
        if (screenHeight>500) {
            background_Img.image=[UIImage imageNamed:@"Default-568h@2x.png"];
        }
        else
        {
            background_Img.image=[UIImage imageNamed:@"Default.png"];
        }
    }
    else{
        background_Img.image=[UIImage imageNamed:@"Default-Portrait@2x~ipad.png"];
        info_Lab.font=BUTTONS_FONT_IPAD;
        help_Lab.font=BUTTONS_FONT_IPAD;
        play_Lab.font=BUTTONS_FONT_IPAD;
    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    //NSString *language = [[[NSBundle mainBundle] preferredLocalizations] objectAtIndex:0];
     [self.loding_view show:YES];
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"fr"]) {
        singletonObject.entityName=@"French";
        if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadFrench"]) {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/0/%@",SERVER_ROOT,[[NSLocale preferredLanguages] objectAtIndex:0]]];
            }
            
        }
        else
        {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/%@/%@",SERVER_ROOT,[[NSUserDefaults standardUserDefaults]stringForKey:@"frenchTime"],[[NSLocale preferredLanguages] objectAtIndex:0]]];
            }
        }
    }
    else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"es"]){
        singletonObject.entityName=@"Spanish";
        if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadSpanish"]) {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/0/%@",SERVER_ROOT,[[NSLocale preferredLanguages] objectAtIndex:0]]];
            }
        }
        else
        {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/%@/%@",SERVER_ROOT,[[NSUserDefaults standardUserDefaults]stringForKey:@"spanishtime"],[[NSLocale preferredLanguages] objectAtIndex:0]]];
            }
        }
    }
    else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"]){
        singletonObject.entityName=@"Chinese";
        if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadChinese"]) {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/0/zh",SERVER_ROOT]];
            }
        }
        else
        {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/%@/zh",SERVER_ROOT,[[NSUserDefaults standardUserDefaults]stringForKey:@"chinesetime"]]];
            }
        }
    }
    else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt"]||[[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt-PT"]){
        singletonObject.entityName=@"Portuguese";
        if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadPortuguese"]) {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/0/pt",SERVER_ROOT]];
            }
        }
        else
        {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/%@/pt",SERVER_ROOT,[[NSUserDefaults standardUserDefaults]stringForKey:@"portuguesetime"]]];
            }
        }
    }
    else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"de"]){
        singletonObject.entityName=@"Germen";
        if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadGermen"]) {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/0/de",SERVER_ROOT]];
            }
        }
        else
        {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/%@/de",SERVER_ROOT,[[NSUserDefaults standardUserDefaults]stringForKey:@"germentime"]]];
            }
        }
    }
    else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"]){
        singletonObject.entityName=@"Russian";
        if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadRussian"]) {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/0/ru",SERVER_ROOT]];
            }
        }
        else
        {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/%@/ru",SERVER_ROOT,[[NSUserDefaults standardUserDefaults]stringForKey:@"russiantime"]]];
            }
        }
    }
    else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"it"])
    {
        singletonObject.entityName=@"Italian";
        if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadItalian"]) {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/0/it",SERVER_ROOT]];
            }
        }
        else
        {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/%@/it",SERVER_ROOT,[[NSUserDefaults standardUserDefaults]stringForKey:@"italiantime"]]];
            }
        }
       	
    }
    else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"])
    {
        singletonObject.entityName=@"Arabic";
        if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadArabic"]) {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/0/ar",SERVER_ROOT]];
            }
        }
        else
        {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/%@/ar",SERVER_ROOT,[[NSUserDefaults standardUserDefaults]stringForKey:@"arabictime"]]];
            }
        }
       	
    }
    else{
        singletonObject.entityName=@"English";
        if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadEnglish"]) {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/0/%@",SERVER_ROOT,[[NSLocale preferredLanguages] objectAtIndex:0]]];
            }
        }
        else
        {
            if ([self networkCheck])
            {
                [self.loding_view show:YES];
                [singletonObject getMethodWithUrl:[NSString stringWithFormat:@"%@/%@/%@",SERVER_ROOT,[[NSUserDefaults standardUserDefaults]stringForKey:@"englishtime"],[[NSLocale preferredLanguages] objectAtIndex:0]]];
            }
        }
       	
    }

}
#pragma mark NETWORK CHECK
- (BOOL)networkCheck{
    if (!self.singletonObject.isReachable)
    {
        [loding_view hide:YES];
        [self showAlert:NSLocalizedString(@"NETWORK_MESSAGE", nil) tag:1 button:[NSArray arrayWithObjects:NSLocalizedString(@"OKAY", nil), nil]];
        return NO;
    }
    return YES;
}
#pragma mark SINGLETON DELEGATE METHODS
- (void)sendDataToViewController:(id)data
{
    NSDictionary *dic=data;
    [self updateTimeStamp:dic];
    NSMutableArray *totQuestions=[dic valueForKey:@"questions"];
    if ([totQuestions count]>0) {
        appdelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        managesObjectContext=appdelegate.managedObjectContext;
        NSEntityDescription *entity1 = [NSEntityDescription entityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
        NSFetchRequest *request1 = [[NSFetchRequest alloc] init];
        [request1 setEntity:entity1];
        NSError *error = nil;
        NSArray *questionaArray = [[managesObjectContext executeFetchRequest:request1 error:&error] mutableCopy];
        NSManagedObject *managedObject;
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"fr"]) {
            
            if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadFrench"]) {
                for (int i=0; i<[questionaArray count]; i++) {
                    managedObject=[questionaArray objectAtIndex:i];
                    [managesObjectContext deleteObject:managedObject];
                }
                for (int i=0; i<[totQuestions count]; i++) {
                    french =(French *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
                    NSMutableDictionary *dic=[totQuestions objectAtIndex:i];
                    
                    NSString *string = [dic objectForKey:@"category"];
                    NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                                               [NSCharacterSet whitespaceCharacterSet]];
                    [dic setObject:trimmedString forKey:@"category"];
                    
                    [self insertIntoDatabase:dic entity:french];
                }
                if (![managesObjectContext save:&error]) {
                    abort();
                }
                NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
                [userDefaults setValue:@"loadFrench" forKey:@"loadFrench"];
                [userDefaults synchronize];
                [self.loding_view hide:YES];
            }
            else
            {
                if ([totQuestions count]>0) {
                    NSError *error = nil;
                    for (int i=0; i<[totQuestions count]; i++) {
                        [self updateDatabase:[totQuestions objectAtIndex:i]];
                    }
                    if (![managesObjectContext save:&error]) {
                        abort();
                    }
                }
            }

        }
       else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"es"]) {
           
           if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadSpanish"]) {
               NSError *error = nil;
               for (int i=0; i<[questionaArray count]; i++) {
                   managedObject=[questionaArray objectAtIndex:i];
                   [managesObjectContext deleteObject:managedObject];
               }
               for (int i=0; i<[totQuestions count]; i++) {
                   spanish =(Spanish *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
                   NSMutableDictionary *dic=[totQuestions objectAtIndex:i];
                   
                   NSString *string = [dic objectForKey:@"category"];
                   NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                                              [NSCharacterSet whitespaceCharacterSet]];
                   [dic setObject:trimmedString forKey:@"category"];
                   
                   [self insertIntoDatabase:dic entity:spanish];
               }
               if (![managesObjectContext save:&error]) {
                   abort();
               }
               NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
               [userDefaults setValue:@"loadSpanish" forKey:@"loadSpanish"];
               [userDefaults synchronize];
               [self.loding_view hide:YES];
           }
           else
           {
               if ([totQuestions count]>0) {
                   NSError *error = nil;
                   for (int i=0; i<[totQuestions count]; i++) {
                       [self updateDatabase:[totQuestions objectAtIndex:i]];
                   }
                   if (![managesObjectContext save:&error]) {
                       abort();
                   }
               }
           }
       }
       else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"]) {
           
           if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadChinese"]) {
               NSError *error = nil;
               for (int i=0; i<[questionaArray count]; i++) {
                   managedObject=[questionaArray objectAtIndex:i];
                   [managesObjectContext deleteObject:managedObject];
               }
               for (int i=0; i<[totQuestions count]; i++) {
                   chinese =(Chinese *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];

                   NSMutableDictionary *dic=[totQuestions objectAtIndex:i];
                   
                   NSString *string = [dic objectForKey:@"category"];
                   NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                                              [NSCharacterSet whitespaceCharacterSet]];
                   [dic setObject:trimmedString forKey:@"category"];
                   
                   [self insertIntoDatabase:dic entity:chinese];
               }
               if (![managesObjectContext save:&error]) {
                   abort();
               }
               NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
               [userDefaults setValue:@"loadChinese" forKey:@"loadChinese"];
               [userDefaults synchronize];
               [self.loding_view hide:YES];
           }
           else
           {
               if ([totQuestions count]>0) {
                   NSError *error = nil;
                   for (int i=0; i<[totQuestions count]; i++) {
                       [self updateDatabase:[totQuestions objectAtIndex:i]];
                   }
                   if (![managesObjectContext save:&error]) {
                       abort();
                   }
               }
           }
       }
       else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt"]||[[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt-PT"]) {
          
           if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadPortuguese"]) {
               NSError *error = nil;
               for (int i=0; i<[questionaArray count]; i++) {
                   managedObject=[questionaArray objectAtIndex:i];
                   [managesObjectContext deleteObject:managedObject];
               }
               for (int i=0; i<[totQuestions count]; i++) {
                    portuguese =(Portuguese *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
                   NSMutableDictionary *dic=[totQuestions objectAtIndex:i];
                   
                   NSString *string = [dic objectForKey:@"category"];
                   NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                                              [NSCharacterSet whitespaceCharacterSet]];
                   [dic setObject:trimmedString forKey:@"category"];
                   
                   [self insertIntoDatabase:dic entity:portuguese];
               }
               if (![managesObjectContext save:&error]) {
                   abort();
               }
               NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
               [userDefaults setValue:@"loadPortuguese" forKey:@"loadPortuguese"];
               [userDefaults synchronize];
               [self.loding_view hide:YES];
           }
           else
           {
               if ([totQuestions count]>0) {
                   NSError *error = nil;
                   for (int i=0; i<[totQuestions count]; i++) {
                       [self updateDatabase:[totQuestions objectAtIndex:i]];
                   }
                   if (![managesObjectContext save:&error]) {
                       abort();
                   }
               }
           }
       }
       else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"de"]) {
          
           if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadGermen"]) {
               NSError *error = nil;
               for (int i=0; i<[questionaArray count]; i++) {
                   managedObject=[questionaArray objectAtIndex:i];
                   [managesObjectContext deleteObject:managedObject];
               }
               for (int i=0; i<[totQuestions count]; i++) {
                   germen =(Germen *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
                   NSMutableDictionary *dic=[totQuestions objectAtIndex:i];
                   
                   NSString *string = [dic objectForKey:@"category"];
                   NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                                              [NSCharacterSet whitespaceCharacterSet]];
                   [dic setObject:trimmedString forKey:@"category"];
                   
                   [self insertIntoDatabase:dic entity:germen];
               }
               if (![managesObjectContext save:&error]) {
                   abort();
               }
               NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
               [userDefaults setValue:@"loadGermen" forKey:@"loadGermen"];
               [userDefaults synchronize];
               [self.loding_view hide:YES];
           }
           else
           {
               if ([totQuestions count]>0) {
                   NSError *error = nil;
                   for (int i=0; i<[totQuestions count]; i++) {
                       [self updateDatabase:[totQuestions objectAtIndex:i]];
                   }
                   if (![managesObjectContext save:&error]) {
                       abort();
                   }
               }
           }
       }
       else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"]) {
           if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadRussian"]) {
               NSError *error = nil;
               for (int i=0; i<[questionaArray count]; i++) {
                   managedObject=[questionaArray objectAtIndex:i];
                   [managesObjectContext deleteObject:managedObject];
               }
               for (int i=0; i<[totQuestions count]; i++) {
                   russian =(Russian *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
                   NSMutableDictionary *dic=[totQuestions objectAtIndex:i];
                   
                   NSString *string = [dic objectForKey:@"category"];
                   NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                                              [NSCharacterSet whitespaceCharacterSet]];
                   [dic setObject:trimmedString forKey:@"category"];
                   
                   [self insertIntoDatabase:dic entity:russian];
               }
               if (![managesObjectContext save:&error]) {
                   abort();
               }
               NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
               [userDefaults setValue:@"loadRussian" forKey:@"loadRussian"];
               [userDefaults synchronize];
               [self.loding_view hide:YES];
           }
           else
           {
               if ([totQuestions count]>0) {
                   NSError *error = nil;
                   for (int i=0; i<[totQuestions count]; i++) {
                       [self updateDatabase:[totQuestions objectAtIndex:i]];
                   }
                   if (![managesObjectContext save:&error]) {
                       abort();
                   }
               }
           }
       }
       else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"it"]) {
           if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadItalian"]) {
               NSError *error = nil;
               for (int i=0; i<[questionaArray count]; i++) {
                   managedObject=[questionaArray objectAtIndex:i];
                   [managesObjectContext deleteObject:managedObject];
               }
               for (int i=0; i<[totQuestions count]; i++) {
                   italian =(Italian *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
                   NSMutableDictionary *dic=[totQuestions objectAtIndex:i];
                   
                   NSString *string = [dic objectForKey:@"category"];
                   NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                                              [NSCharacterSet whitespaceCharacterSet]];
                   [dic setObject:trimmedString forKey:@"category"];
                   
                   [self insertIntoDatabase:dic entity:italian];
               }
               if (![managesObjectContext save:&error]) {
                   abort();
               }
               NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
               [userDefaults setValue:@"loadItalian" forKey:@"loadItalian"];
               [userDefaults synchronize];
               [self.loding_view hide:YES];
           }
           else
           {
               if ([totQuestions count]>0) {
                   NSError *error = nil;
                   for (int i=0; i<[totQuestions count]; i++) {
                       [self updateDatabase:[totQuestions objectAtIndex:i]];
                   }
                   if (![managesObjectContext save:&error]) {
                       abort();
                   }
               }
           }
       }
       else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
           if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadArabic"]) {
               NSError *error = nil;
               for (int i=0; i<[questionaArray count]; i++) {
                   managedObject=[questionaArray objectAtIndex:i];
                   [managesObjectContext deleteObject:managedObject];
               }
               for (int i=0; i<[totQuestions count]; i++) {
                   arabic =(Arabic *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
                   NSMutableDictionary *dic=[totQuestions objectAtIndex:i];
                   
                   NSString *string = [dic objectForKey:@"category"];
                   NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                                              [NSCharacterSet whitespaceCharacterSet]];
                   [dic setObject:trimmedString forKey:@"category"];
                   
                   [self insertIntoDatabase:dic entity:arabic];
               }
               if (![managesObjectContext save:&error]) {
                   abort();
               }
               NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
               [userDefaults setValue:@"loadArabic" forKey:@"loadArabic"];
               [userDefaults synchronize];
               [self.loding_view hide:YES];
           }
           else
           {
               if ([totQuestions count]>0) {
                   NSError *error = nil;
                   for (int i=0; i<[totQuestions count]; i++) {
                       [self updateDatabase:[totQuestions objectAtIndex:i]];
                   }
                   if (![managesObjectContext save:&error]) {
                       abort();
                   }
               }
           }
       }
       else{
           if (![[NSUserDefaults standardUserDefaults]valueForKey:@"loadEnglish"]) {
               
               NSError *error = nil;
               for (int i=0; i<[questionaArray count]; i++) {
                   managedObject=[questionaArray objectAtIndex:i];
                   [managesObjectContext deleteObject:managedObject];
               }
               for (int i=0; i<[totQuestions count]; i++) {
                   english =(English *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
                   NSMutableDictionary *dic=[totQuestions objectAtIndex:i];
                   
                   NSString *string = [dic objectForKey:@"category"];
                   NSString *trimmedString = [string stringByTrimmingCharactersInSet:
                                              [NSCharacterSet whitespaceCharacterSet]];
                   [dic setObject:trimmedString forKey:@"category"];
                   
                   [self insertIntoDatabase:dic entity:english];
               }
               if (![managesObjectContext save:&error]) {
                   abort();
               }
               NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
               [userDefaults setValue:@"loadEnglish" forKey:@"loadEnglish"];
               [userDefaults synchronize];
               [self.loding_view hide:YES];
           }
           else
           {
               if ([totQuestions count]>0) {
                   NSError *error = nil;
                   for (int i=0; i<[totQuestions count]; i++) {
                       [self updateDatabase:[totQuestions objectAtIndex:i]];
                   }
                   if (![managesObjectContext save:&error]) {
                       abort();
                   }
               }
           }
           [self.loding_view hide:YES];
       }
       }
    else
    {
        
    }
    [self.loding_view hide:YES];
}
- (void)updateTimeStamp:(NSDictionary *)dic
{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"fr"]) {
        [userDefaults setValue:[dic valueForKey:@"timestamp"] forKey:@"frenchTime"];
        [userDefaults synchronize];
    }
    else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"es"]) {
        [userDefaults setValue:[dic valueForKey:@"timestamp"] forKey:@"spanishtime"];
        [userDefaults synchronize];
        
        
    }
    else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"]) {
        [userDefaults setValue:[dic valueForKey:@"timestamp"] forKey:@"chinesetime"];
        [userDefaults synchronize];
    }
    else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt"]||[[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt-PT"]) {
        [userDefaults setValue:[dic valueForKey:@"timestamp"] forKey:@"portuguesetime"];
        [userDefaults synchronize];
        
    }
    else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"de"]) {
        [userDefaults setValue:[dic valueForKey:@"timestamp"] forKey:@"germentime"];
        [userDefaults synchronize];
    }
    else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"]) {
        [userDefaults setValue:[dic valueForKey:@"timestamp"] forKey:@"russiantime"];
        [userDefaults synchronize];
    }
    else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"it"]) {
        [userDefaults setValue:[dic valueForKey:@"timestamp"] forKey:@"italiantime"];
        [userDefaults synchronize];
    }
    else if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]) {
        [userDefaults setValue:[dic valueForKey:@"timestamp"] forKey:@"arabictime"];
        [userDefaults synchronize];
    }
    else
    {
        [userDefaults setValue:[dic valueForKey:@"timestamp"] forKey:@"englishtime"];
        [userDefaults synchronize];
    }

}
- (void)sendErrorOccured:(NSError *)error
{
    [self.loding_view hide:YES];
}
#pragma mark COREDATA INSERT,UPDATE,DELETE

- (void)insertIntoDatabase:(NSMutableDictionary *)dicts entity:(id)entity{
    
    [entity setValue:[self isEmpty:[dicts valueForKey:@"quiz"]] forKey:@"quiz"];
    [entity setValue:[self isEmpty:[dicts valueForKey:@"answer"]] forKey:@"answer"];
    [entity setValue:[self isEmpty:[dicts valueForKey:@"bible_reference"]] forKey:@"biblereference"];
    [entity setValue:[self isEmpty:[dicts valueForKey:@"okindex"]] forKey:@"okindex"];
    [entity setValue:[self isEmpty:[dicts valueForKey:@"category"]] forKey:@"category"];
    [entity setValue:[self isEmpty:[dicts valueForKey:@"questions_id"]] forKey:@"questionId"];
    [entity setValue:[self isEmpty:[dicts valueForKey:@"level"]] forKey:@"level"];
    
}

- (void)updateDatabase:(NSMutableDictionary *)updateDic{
    appdelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    managesObjectContext=appdelegate.managedObjectContext;
    NSEntityDescription *entity1 = [NSEntityDescription entityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
    NSFetchRequest *request1 = [[NSFetchRequest alloc] init];
    [request1 setEntity:entity1];
    NSError *error;
    if ([[updateDic valueForKey:@"action_status"] isEqualToString:@"update"] || [[updateDic valueForKey:@"action_status"] isEqualToString:@"delete"])
    {
        NSPredicate *requestPredicate = [NSPredicate predicateWithFormat:@" questionId = %@ ",[updateDic valueForKey:@"questions_id"]];
        [request1 setPredicate:requestPredicate];
        NSArray *questionaArray = [[managesObjectContext executeFetchRequest:request1 error:&error] mutableCopy];
        NSManagedObject *managedObject;
        if ([questionaArray count]>0) {
            managedObject=[questionaArray objectAtIndex:0];
            
        }
        if ([[updateDic valueForKey:@"action_status"] isEqualToString:@"update"])
        {
            [managedObject setValue:[self isEmpty:[updateDic valueForKey:@"quiz"]] forKey:@"quiz"];
            [managedObject setValue:[self isEmpty:[updateDic valueForKey:@"answer"]] forKey:@"answer"];
            [managedObject setValue:[self isEmpty:[updateDic valueForKey:@"bible_reference"]] forKey:@"biblereference"];
            [managedObject setValue:[self isEmpty:[updateDic valueForKey:@"okindex"]] forKey:@"okindex"];
            [managedObject setValue:[self isEmpty:[updateDic valueForKey:@"category"]] forKey:@"category"];
            [managedObject setValue:[self isEmpty:[updateDic valueForKey:@"questions_id"]] forKey:@"questionId"];
            [managedObject setValue:[self isEmpty:[updateDic valueForKey:@"level"]] forKey:@"level"];
        }
        else if([[updateDic valueForKey:@"action_status"] isEqualToString:@"delete"])
        {
            [managesObjectContext deleteObject:managedObject];
            [managesObjectContext save:&error];
        }
    }
    else if([[updateDic valueForKey:@"action_status"] isEqualToString:@"add"])
    {
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"fr"]) {
            french =(French *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
            [self insertIntoDatabase:updateDic entity:french];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"es"]){
            spanish =(Spanish *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
            [self insertIntoDatabase:updateDic entity:spanish];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"zh-Hans"]){
             chinese =(Chinese *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
            [self insertIntoDatabase:updateDic entity:chinese];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt"]||[[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"pt-PT"]){
            portuguese =(Portuguese *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
            [self insertIntoDatabase:updateDic entity:portuguese];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"de"]){
            germen =(Germen *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
            [self insertIntoDatabase:updateDic entity:germen];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ru"]){
            russian =(Russian *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
            [self insertIntoDatabase:updateDic entity:russian];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"it"]){
            italian =(Italian *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
            [self insertIntoDatabase:updateDic entity:italian];
        }
        else if([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"ar"]){
            arabic =(Arabic *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
            [self insertIntoDatabase:updateDic entity:arabic];
        }
        else
        {
             english =(English *)[NSEntityDescription insertNewObjectForEntityForName:singletonObject.entityName inManagedObjectContext:managesObjectContext];
            [self insertIntoDatabase:updateDic entity:english];
        }
    }
}
- (NSString *)isEmpty:(NSString*)value
{
    NSString * val=@"";
    if(value !=(id)[NSNull null] )
    {
        val=value;
    }
    return val;
}

#pragma mark ALERT SHOW
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
    
}
#pragma mark INFO,HELP,PLAY BUTTON ACTIONS
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
- (IBAction)helpButton_Action:(id)sender
{
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
            helpViewcontroller=[[HelpViewController alloc]initWithNibName:@"HelpView" bundle:nil];
        }
        else
        {
            helpViewcontroller=[[HelpViewController alloc]initWithNibName:@"HelpView_iOS7" bundle:nil];
        }
        
        
    }
    else{
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
             helpViewcontroller=[[HelpViewController alloc]initWithNibName:@"HelpView_Ipad" bundle:nil];
        }
        else
        {
             helpViewcontroller=[[HelpViewController alloc]initWithNibName:@"HelpViewiOS7_iPad" bundle:nil];
        }
       
        
    }
    [self.navigationController pushViewController:helpViewcontroller animated:YES];
}
- (IBAction)PlayButton_Action:(id)sender
{
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
            playViewcontroller=[[PlayViewController alloc]initWithNibName:@"PlayView" bundle:nil];
        }
        else
        {
            playViewcontroller=[[PlayViewController alloc]initWithNibName:@"PlayView_iOS7" bundle:nil];
        }
        
    }
    else{
        if (SYSTEM_VERSION_LESS_THAN(@"7")) {
            playViewcontroller=[[PlayViewController alloc]initWithNibName:@"PlayView_Ipad" bundle:nil];
        }
        else
        {
            playViewcontroller=[[PlayViewController alloc]initWithNibName:@"PlayViewiOS7_iPad" bundle:nil];
        }
        
    }
    [self.navigationController pushViewController:playViewcontroller animated:YES];
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
       
     background_Img=nil;
    bottom_Img=nil;
    info_Lab=nil;help_Lab=nil;play_Lab=nil;
    managesObjectContext=nil;
    infoViewController=nil;
    helpViewcontroller=nil;
    playViewcontroller=nil;
    appdelegate=nil;
    english=nil;
    french=nil;
    spanish=nil;
    singletonObject=nil;
    loding_view=nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
