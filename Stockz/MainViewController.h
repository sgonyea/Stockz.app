//
//  MainViewController.h
//  Stockz
//
//  Created by Scott Gonyea on 4/22/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import "FlipsideViewController.h"

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@class StockSymbolDataController;

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UITableViewDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) StockSymbolDataController *dataController;

@property (weak, nonatomic) IBOutlet UITableView *stockTableView;

@end
