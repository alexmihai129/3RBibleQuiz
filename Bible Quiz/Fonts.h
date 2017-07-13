//
//  Fonts.h
//  Bible Quiz
//
//  Created by Sirisha.G on 16/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#ifndef Bible_Quiz_Fonts_h
#define Bible_Quiz_Fonts_h

/*---------- Test URL -------------*/
//#define SERVER_ROOT @"http://202.65.155.222:90/test/bibleapp/services.php/bibleapp/getquestatusaftertimebylang"

/*----------- Server URL -----------*/

#define  SERVER_ROOT @"http://www.akingneedsthis.com/biblecms/services.php/bibleapp/getquestatusaftertimebylang"


// iOS Version Check
#define SYSTEM_VERSION_LESS_THAN(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)


#define INAPPPURCHASE_PRODUCT @"com.techgene.Bible.AddingUnlock"
#define ADMOB_ID @"ca-app-pub-3085462470935276/9867671547"
#define REGULAR NSLocalizedString(@"MREGULAR", nil)
#define BOLd NSLocalizedString(@"MBOLD", nil)

#define INFO_SIZE 20

// iPhone  fonts
#define  CATEGORIES_FONT_Iphone [UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:25]
#define  NOOFSELECTED_CATEGORIES_FONT_Iphone [UIFont fontWithName:NSLocalizedString(@"MREGULAR", nil) size:20]
#define  NOOFROUNDS_FONT_Iphone [UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:25]
#define  QUESTION_FONT_SIZE [UIFont fontWithName:NSLocalizedString(@"RCON", nil) size:18]
#define  QUESTION_OPTIONS_FONT [UIFont fontWithName:NSLocalizedString(@"RCON", nil) size:18]
#define  ARABIC_QUESTION_FONT_SIZE [UIFont fontWithName:NSLocalizedString(@"RCON", nil) size:19]
#define  ARABIC_QUESTION_OPTIONS_FONT [UIFont fontWithName:NSLocalizedString(@"RCON", nil) size:19]
#define  BUTTONS_FONT [UIFont fontWithName:NSLocalizedString(@"MSB", nil) size:[NSLocalizedString(@"BUTTON_SIZE", nil)floatValue]]
#define  Heading_FONT_Iphone [UIFont fontWithName:NSLocalizedString(@"MSB", nil) size:[NSLocalizedString(@"PAGE_TITLES", nil)floatValue]]
#define  LABEL_FONT [UIFont fontWithName:NSLocalizedString(@"MREGULAR", nil) size:16]
#define  ACCESSLABEL_FONT [UIFont fontWithName:NSLocalizedString(@"MREGULAR", nil) size:15]
#define  MESSAGE_FONT_SIZE_IPHONE [UIFont fontWithName:NSLocalizedString(@"MCON", nil) size:22]
#define  SCORELABEL_FONT_IPHONE [UIFont fontWithName:NSLocalizedString(@"MBOLD", nil) size:25]
#define  RATELABEL_FONT_IPHONE [UIFont fontWithName:NSLocalizedString(@"MBOLD", nil) size:22]
#define HEADER_LAB_FONT_IPHONE [UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:[NSLocalizedString(@"HEADER_LAB_FONT", nil)floatValue]]
#define  SCOREDETAILS_FONT_IPHONE [UIFont fontWithName:NSLocalizedString(@"MREGULAR", nil) size:18]
#define UPGRADE_BTN_FONT [UIFont fontWithName:NSLocalizedString(@"MBOLD", nil) size:[NSLocalizedString(@"UPGRADE_FONT_SIZE", nil)floatValue]]
#define CHALLENGE_FONT_IPHONE [UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:20]
#define CHALLENGE_FONT_HELP_IPHONE [UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:20]


//iPad fonts
#define  BUTTONS_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MSB", nil) size:[NSLocalizedString(@"BUTTON_SIZE_IPAD", nil)floatValue]]
#define  Heading_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MSB", nil) size:[NSLocalizedString(@"PAGE_TITLES_IPAD", nil)floatValue]]
#define  CATEGORIES_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:48]
#define  LABEL_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MREGULAR", nil) size:30]
#define  ACCESSLABEL_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MREGULAR", nil) size:25]
#define  NOOFROUNDS_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:50]
#define NOOFSELECTED_CATEGORIES_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MREGULAR", nil) size:40]
#define  QUESTION_OPTIONS_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"RCON", nil) size:30]
#define  ARABIC_QUESTION_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"RCON", nil) size:32]
#define  ARABIC_QUESTION_OPTIONS_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"RCON", nil) size:32]
#define  QUESTION_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"RCON", nil) size:30]
#define  MESSAGE_FONT_SIZE_IPAD [UIFont fontWithName:NSLocalizedString(@"MCON", nil) size:50]
#define  SCORELABEL_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MBOLD", nil) size:50]
#define  RATELABEL_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MBOLD", nil) size:46]
#define HEADER_LAB_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:30]
#define  SCOREDETAILS_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MREGULAR", nil) size:30]
#define CHALLENGE_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:30]
#define UPGRADE_BTN_FONT_IPAD [UIFont fontWithName:NSLocalizedString(@"MBOLD", nil) size:36]
#define CHALLENGE_FONT_HELP_IPAD [UIFont fontWithName:NSLocalizedString(@"MSEMIBOLD", nil) size:30]

#endif
