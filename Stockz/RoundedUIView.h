//
//  RoundedUIView.h
//  Stockz
//
//  Created by Scott Gonyea on 4/29/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoundedUIView : UIView {
  BOOL isFirst;
  BOOL isLast;
  BOOL isOdd;
  BOOL isEven;
	CGGradientRef gradient;
}

@property BOOL isFirst;
@property BOOL isLast;
@property BOOL isOdd;
@property BOOL isEven;

@end
