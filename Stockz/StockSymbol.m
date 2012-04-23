//
//  StockSymbol.m
//  Stockz
//
//  Created by Scott Gonyea on 4/22/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import "StockSymbol.h"

@implementation StockSymbol

@synthesize symbol = _symbol;

-(id)initWithSymbol:(NSString *)symbol {
  self = [super init];

  if (self) {
    _symbol = symbol;
    
    return self;
  }
  
  return nil;

}

@end
