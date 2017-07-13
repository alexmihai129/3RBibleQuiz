//
//  InAppPurchase.m
//  iAdSample
//
//  Created by Techgene Solutions on 04/10/12.
//  Copyright (c) 2012 Techgene Solutions LLC. All rights reserved.
//

#import "InAppPurchase.h"
#import "Fonts.h"
static InAppPurchase * _sharedInApp;
@implementation InAppPurchase

@synthesize strIdentifier;// = _strIdentifier;

@synthesize delegate;

@synthesize which;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
     //  appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    }
    return self;
}
// Have delete when submit in app store


// call when restore button clicked.


- (void)purchase
{
    UIAlertView *message;
    message = [[UIAlertView alloc] initWithTitle:@"Bible Quiz"
                                         message:[NSString stringWithFormat:@"%@",NSLocalizedString(@"INAPP PURCHASR", nil)] delegate:self
                               cancelButtonTitle:@"OK"
                               otherButtonTitles:nil];
    
    message.tag = 10;
    [message show];
    
}
-(void)restTransaction{
    self.strIdentifier = INAPPPURCHASE_PRODUCT;
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue{
    NSMutableArray *purchasedItemIDs = [[NSMutableArray alloc] init];
    if ([queue.transactions count] == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:[NSString stringWithFormat:@"%@",NSLocalizedString(@"NO_PRODUCTS", nil)] delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
    }else{
    }
    
    for (SKPaymentTransaction *transaction in queue.transactions) {
        NSString *productID = transaction.payment.productIdentifier;
        [purchasedItemIDs addObject:productID];
        NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:transaction, @"transaction" , nil];
        if ([productID isEqualToString:self.strIdentifier]) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:strIdentifier];
            [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerTransactionSucceededNotification object:self userInfo:userInfo];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"%@",NSLocalizedString(@"RESTORE_SUCCESS", nil)] delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            alert.tag = 10;
            [alert show];
            
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:[NSString stringWithFormat:@"%@",NSLocalizedString(@"NO_PRODUCTS", nil)] delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
        }
       
    }
}

- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error{
    NSLog(@"restore error : %@",error.description);
}

-(void)purchaseProduct:(NSString *)productIdentifier
{
    self.strIdentifier = productIdentifier;
    NSSet *productIdentifiers = [NSSet setWithObject:productIdentifier];
    productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
    productsRequest.delegate = self;
    [productsRequest start];
}

+ (InAppPurchase *) SharedInApp;
{
    if (!_sharedInApp) {
        _sharedInApp = [[InAppPurchase alloc] init];
    }
    return _sharedInApp;
}

//- (void)requestDidFinish:(SKRequest *)request{
//    
//}
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    // self.MYSTORY.message = nil;
    NSArray *product = response.products;
    proUpgradeProduct = [product count] == 1 ? [product lastObject] : nil;
    
    if (proUpgradeProduct)
    {
        [self canMakePurchases];
        [self purchaseProUpgrade];
        [self loadStore];
    }
    for (NSString *invalidProductId in response.invalidProductIdentifiers)
    {
        NSLog(@"Invalid product id: %@" , invalidProductId);
    }
    //finally release the reqest we alloc/init’ed in requestProUpgradeProductData
    productsRequest = nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerProductsFetchedNotification object:self userInfo:nil];
     [self.delegate errorOccured:nil];
}
- (void)loadStore
{
    // restarts any purchases if they were interrupted last time the app was open
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    //get the product description (defined in early sections)
    //[self requestProUpgradeProductData];
}
// call this before making a purchase
//
- (BOOL)canMakePurchases
{
    return [SKPaymentQueue canMakePayments];
}

// kick off the upgrade transaction
- (void)purchaseProUpgrade
{

    //payment = [SKPayment paymentWithProductIdentifier:self.strIdentifier]; // this method is depcrated in iOS 5
    payment=[SKPayment paymentWithProduct:proUpgradeProduct];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
    //[payment release];
}
//
// saves a record of the transaction by storing the receipt to disk
//
- (void)recordTransaction:(SKPaymentTransaction *)transaction
{
    if ([transaction.payment.productIdentifier isEqualToString:self.strIdentifier])
    {
        // save the transaction receipt to disk
        [[NSUserDefaults standardUserDefaults] setValue:transaction.transactionReceipt forKey:@"proUpgradeTransactionReceipt" ];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
//
// enable pro features
- (void)provideContent:(NSString *)productId
{
    if ([productId isEqualToString:self.strIdentifier])
    {
        // enable the pro features
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isProUpgradePurchased" ];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
// removes the transaction from the queue and posts a notification with the transaction result
- (void)finishTransaction:(SKPaymentTransaction *)transaction wasSuccessful:(BOOL)wasSuccessful
{
    // remove the transaction from the payment queue.
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:transaction, @"transaction" , nil];
    if (wasSuccessful)
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:strIdentifier];
        [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerTransactionSucceededNotification object:self userInfo:userInfo];
        UIAlertView *message;
            message = [[UIAlertView alloc] initWithTitle:@"Bible Quiz"
                                                 message:[NSString stringWithFormat:@"%@",NSLocalizedString(@"INAPP PURCHASR", nil)]delegate:self
                                       cancelButtonTitle:@"OK"
                                       otherButtonTitles:nil];
        
        message.tag = 10;
        [message show];
    }
    else
    {
        // send out a notification for the failed transaction
        [[NSNotificationCenter defaultCenter] postNotificationName:kInAppPurchaseManagerTransactionFailedNotification object:self userInfo:userInfo];
        [self.delegate errorOccured:nil];
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Bible Quiz" message:[NSString stringWithFormat:@"%@",NSLocalizedString(@"FAILED_TRANCTION", nil)]
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
}
// called when the transaction was successful
- (void)completeTransaction:(SKPaymentTransaction *)transaction
{
    [self recordTransaction:transaction];
    [self provideContent:transaction.payment.productIdentifier];
    [self finishTransaction:transaction wasSuccessful:YES];
}
// called when a transaction has been restored and and successfully completed
- (void)restoreTransaction:(SKPaymentTransaction *)transaction
{
    [self recordTransaction:transaction.originalTransaction];
    [self provideContent:transaction.originalTransaction.payment.productIdentifier];
    [self finishTransaction:transaction wasSuccessful:YES];
}
                                
// called when a transaction has failed
- (void)failedTransaction:(SKPaymentTransaction *)transaction
{
    if (transaction.error.code != SKErrorPaymentCancelled)
    {
        // error!
       // UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:[NSString stringWithFormat:@"Error code: %d Sorry unable to complete your transaction",transaction.error.code] delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
       // [alert show];
        [self finishTransaction:transaction wasSuccessful:NO];
    }
    else
    {
        // this is fine, the user just cancelled, so don’t notify
        [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    }
}
// called when the transaction status is updated
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    
    for (SKPaymentTransaction *transaction in transactions)
    {
       NSLog(@"transactions :  %@",transactions);
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
                break;
            default:
                break;
        }
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==10) {
        [self.delegate purchaseCompleted:self.strIdentifier];
    }
}

@end
