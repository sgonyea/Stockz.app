//
//  MainViewController.h
//  Stockz
//
//  Created by Scott Gonyea on 4/22/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import "FlipsideViewController.h"

#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
