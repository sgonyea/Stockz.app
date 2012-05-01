//
//  FlipsideViewController.h
//  Stockz
//
//  Created by Scott Gonyea on 4/22/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StockSymbolDataController.h"
#import "AddStockViewController.h"

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController <AddStockViewControllerDelegate, UITableViewDelegate>

@property (strong, nonatomic) StockSymbolDataController *dataController;
@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITableView *stockTableView;

- (IBAction)done:(id)sender;

@end
