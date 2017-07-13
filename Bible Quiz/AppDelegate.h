//
//  AppDelegate.h
//  Bible Quiz
//
//  Created by Sirisha.G on 09/04/13.
//  Copyright (c) 2013 Sirisha.G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "Singleton.h"
@class HomeViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic,strong)Singleton *singletonObject;
@property (nonatomic,strong)HomeViewController *homeViewController;
@property (nonatomic,strong)UINavigationController *navigationcontroller;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
