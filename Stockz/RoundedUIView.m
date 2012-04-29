//
//  RoundedUIView.m
//  Stockz
//
//  Created by Scott Gonyea on 4/29/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import "RoundedUIView.h"
#import <QuartzCore/QuartzCore.h>

@implementation RoundedUIView

@synthesize isFirst = _isFirst;
@synthesize isLast  = _isLast;
@synthesize isOdd   = _isOdd;
@synthesize isEven  = _isEven;

//- (void)setIsFirst:(BOOL) newIsFirst {
//  self.isFirst = newIsFirst;
//}
//
//- (void)setIsLast:(BOOL) newIsLast {
//  self.isLast = newIsLast;
//}
//
//- (void)setIsOdd:(BOOL) newIsOdd {
//  self.isOdd = newIsOdd;
//}
//
//- (void)setIsEven:(BOOL) newIsEven {
//  self.isEven = newIsEven;
//}

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
		self.backgroundColor = [UIColor clearColor];
  }
  return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
  UIImage *image;

  if(isFirst) {
    image = [UIImage imageNamed:@"BlueLightStripesSmall@2x.png"];
  }
  else if(isLast) {
    if(isEven) {
      image = [UIImage imageNamed:@"BlueBotDarkStripesSmall@2x.png"];
    } else { // then, isOdd
      image = [UIImage imageNamed:@"BlueBotLightStripesSmall@2x.png"];
    }
  }
  else if(isEven) {
    image = [UIImage imageNamed:@"BlueDarkStripesSmall@2x.png"];
  }
  else { // then, isOdd
    image = [UIImage imageNamed:@"BlueLightStripesSmall@2x.png"];
  }

//  self.backgroundColor = [UIColor colorWithPatternImage:image];
//  self.backgroundColor = [UIColor clearColor];

  // Drawing code
//  CGContextRef context = UIGraphicsGetCurrentContext();
//  
//  CGContextSetLineWidth(context, 1.0);
//  CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
//  CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);

//
//	CGFloat minx = CGRectGetMinX(rect);
//	CGFloat midx = CGRectGetMidX(rect);
//	CGFloat maxx = CGRectGetMaxX(rect);
//	CGFloat miny = CGRectGetMinY(rect); // -1
//	CGFloat midy = CGRectGetMidY(rect);
//	CGFloat maxy = CGRectGetMaxY(rect);
//
//  CGContextMoveToPoint(context, minx, midy);
//  CGContextAddArcToPoint(context, minx, miny, midx, miny, 15);
//  CGContextAddArcToPoint(context, maxx, miny, maxx, midy, 15);
//  CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, 0);
//  CGContextAddArcToPoint(context, minx, maxy, minx, midy, 0);
//  CGContextClosePath(context);
//
//	CGContextDrawPath(context, kCGPathFillStroke);
}

@end
