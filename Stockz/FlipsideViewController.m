//
//  FlipsideViewController.m
//  Stockz
//
//  Created by Scott Gonyea on 4/22/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import "FlipsideViewController.h"
#import "StockSymbolDataController.h"
#import "StockSymbol.h"

@interface FlipsideViewController ()
@end

@implementation FlipsideViewController

@synthesize delegate        = _delegate;
@synthesize dataController  = _dataController;
@synthesize stockTableView  = _stockTableView;

- (void)setDataController:(StockSymbolDataController *) newDataController {
  if (_dataController != newDataController) {
    _dataController = newDataController;
  }
}

- (void)awakeFromNib {
  [super awakeFromNib];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [[self stockTableView] setEditing:YES animated:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload {
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Actions

- (IBAction)done:(id)sender {
  [self.delegate flipsideViewControllerDidFinish:self];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"FlipStockCell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  StockSymbol *stockAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
  
  [[cell textLabel] setText:stockAtIndex.symbol];
  
  return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
    [self.dataController removeObjectAtIndex:indexPath.row];
    [self.stockTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    [[self stockTableView] reloadData];
  }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndex toIndexPath:(NSIndexPath *)toIndex {
  [self.dataController moveRowAtIndexPath:fromIndex.row toIndexPath:toIndex.row];
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
  return NO;
}

@end
