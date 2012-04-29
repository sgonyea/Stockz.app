//
//  MainViewController.m
//  Stockz
//
//  Created by Scott Gonyea on 4/22/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import "MainViewController.h"
#import "StockSymbolDataController.h"
#import "StockSymbol.h"

@interface MainViewController ()
@end

@implementation MainViewController

@synthesize managedObjectContext  = _managedObjectContext;
@synthesize dataController        = _dataController;
@synthesize stockTableView        = _stockTableView;

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.stockTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

  UIView *sView = [[UIView alloc] init];
  CGRect frame;

  frame.origin.x = 10;
  frame.origin.y = 0;
  frame.size.width = 300;
  frame.size.height = 265;

  sView.frame = frame;
  sView.clipsToBounds = YES;
  sView.layer.cornerRadius = 12;
  sView.layer.borderWidth = 1.0f;
  sView.layer.borderColor = [[UIColor blackColor] CGColor];
  sView.layer.masksToBounds = YES;

  self.stockTableView.frame = CGRectMake(-10, -9, 320, 285);

  [self.view addSubview:sView];

  [sView addSubview:self.stockTableView];
}

- (void)viewDidUnload {
  [super viewDidUnload];
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"showAlternate"]) {
    [[segue destinationViewController] setDataController:self.dataController];
    [[segue destinationViewController] setDelegate:self];
  }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.dataController countOfList];
}

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight, BOOL top, BOOL bottom) {
  if (ovalWidth == 0 || ovalHeight == 0) {
    CGContextAddRect(context, rect);
    return;
  }
  
  float fwidth, fheight;
  
  fwidth  = CGRectGetWidth(rect)  / ovalWidth;
  fheight = CGRectGetHeight(rect) / ovalHeight;
  
  CGContextSaveGState(context);
  CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
  CGContextScaleCTM(context, ovalWidth, ovalHeight);
  
  CGContextMoveToPoint(context, fwidth, fheight/2);
  
  CGContextAddArcToPoint(context, fwidth, fheight,  fwidth/2, fheight,    bottom);
  CGContextAddArcToPoint(context, 0,      fheight,  0,        fheight/2,  bottom);
  CGContextAddArcToPoint(context, 0,      0,        fwidth/2, 0,          top);
  CGContextAddArcToPoint(context, fwidth, 0,        fwidth,   fheight/2,  top);
  
  CGContextClosePath(context);
  CGContextRestoreGState(context);
}

-(UIImage *)makeRoundCornerImage:(UIImage*)img cornerWidth:(int)cornerWidth cornerHeight:(int)cornerHeight toTop:(BOOL)top toBottom:(BOOL)bottom {
  int w = img.size.width;
  int h = img.size.height;
  
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
  
  CGContextBeginPath(context);
  CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
  addRoundedRectToPath(context, rect, cornerWidth, cornerHeight, bottom, top);

  CGContextClosePath(context);
  CGContextClip(context);

  CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
  
  CGImageRef imageMasked = CGBitmapContextCreateImage(context);
  CGContextRelease(context);
  CGColorSpaceRelease(colorSpace);
  
  return [UIImage imageWithCGImage:imageMasked];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"MainStockCell";

  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

  StockSymbol *stockAtIndex = [self.dataController objectInListAtIndex:indexPath.row];

  [[cell textLabel] setTextColor:[UIColor whiteColor]];
  [[cell textLabel] setShadowColor:[UIColor grayColor]];
  [[cell textLabel] setText:stockAtIndex.symbol];

  UIView *view = [[UIView alloc] init];
  UIImage *image;

  // If the top Row
  if (indexPath.row == 0) {
    image = [self makeRoundCornerImage:[UIImage imageNamed:@"BlueLightStripesSmall@2x.png"] cornerWidth:15 cornerHeight:20 toTop:YES toBottom:NO];
  }
  // If the bottom row
  else if (indexPath.row == [self.dataController countOfList] - 1) {
    NSString *imageName;
    if (indexPath.row % 2) {
      imageName = @"BlueDarkStripesSmall@2x.png";
    } else {
      imageName = @"BlueLightStripesSmall@2x.png";
    }

    image = [self makeRoundCornerImage:[UIImage imageNamed:imageName] cornerWidth:15 cornerHeight:20 toTop:NO toBottom:YES];
  }
  // Any row in-between
  else if (indexPath.row % 2) {
    image = [UIImage imageNamed:@"BlueDarkStripesSmall@2x.png"];
  } else {
    image = [UIImage imageNamed:@"BlueLightStripesSmall@2x.png"];
  }

  [view setBackgroundColor:[UIColor colorWithPatternImage:image]];
  [cell setBackgroundView:view];

  return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  return NO;
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
  [[self stockTableView] reloadData];
  [self dismissModalViewControllerAnimated:YES];
}

@end
