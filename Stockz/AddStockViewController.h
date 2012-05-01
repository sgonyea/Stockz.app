//
//  AddStockViewController.h
//  Stockz
//
//  Created by Scott Gonyea on 5/1/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StockSymbolDataController.h"

@class AddStockViewController;

@protocol AddStockViewControllerDelegate
- (void)addStockViewControllerDidFinish:(AddStockViewController *)controller;
@end

@interface AddStockViewController : UIViewController

@property (weak, nonatomic) id <AddStockViewControllerDelegate> delegate;
@property (strong, nonatomic) StockSymbolDataController *dataController;

@end
