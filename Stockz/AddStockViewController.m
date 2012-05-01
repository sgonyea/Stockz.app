//
//  AddStockViewController.m
//  Stockz
//
//  Created by Scott Gonyea on 5/1/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import "AddStockViewController.h"
#import "StockSymbol.h"

@interface AddStockViewController()
@end

@implementation AddStockViewController

@synthesize delegate        = _delegate;
@synthesize dataController  = _dataController;

- (void)setDataController:(StockSymbolDataController *) newDataController {
  if (_dataController != newDataController) {
    _dataController = newDataController;
  }
}

- (void)awakeFromNib {
  [super awakeFromNib];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}

@end
