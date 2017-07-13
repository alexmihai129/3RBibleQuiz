//
//  InAppPurchase.h
//  iAdSample
//
//  Created by Techgene Solutions on 04/10/12.
//  Copyright (c) 2012 Techgene Solutions LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#define kInAppPurchaseManagerProductsFetchedNotification @"kInAppPurchaseManagerProductsFetchedNotification"
#define kInAppPurchaseManagerTransactionFailedNotification @"kInAppPurchaseManagerTransactionFailedNotification"
#define kInAppPurchaseManagerTransactionSucceededNotification @"kInAppPurchaseManagerTransactionSucceededNotification"

@protocol InAppPurchaseDelegate <NSObject>
-(void)purchaseCompleted:(id)sender;
-(void)errorOccured:(NSError*)error;
@end
@interface InAppPurchase : NSObject <SKProductsRequestDelegate,SKPaymentTransactionObserver,UIAlertViewDelegate>{
    NSString *strIdentifier;
    SKProduct *proUpgradeProduct;
    SKProductsRequest *productsRequest;
    NSMutableArray *products;
    SKPayment *payment;
    //AppDelegate *appdelegate ;
}
@property(nonatomic,retain) NSString *strIdentifier;

@property (nonatomic,retain) id <InAppPurchaseDelegate> delegate;

@property (nonatomic,retain) NSString *which;

- (void)loadStore;
- (BOOL)canMakePurchases;
- (void)purchaseProUpgrade;
-(void)purchaseProduct:(NSString *)productIdentifier;
+ (InAppPurchase *) SharedInApp;
-(void)restTransaction;
- (void)purchase;
@end
