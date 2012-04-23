//
//  StockSymbolDataController.m
//  Stockz
//
//  Created by Scott Gonyea on 4/22/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import "StockSymbolDataController.h"
#import "StockSymbol.h"

@interface StockSymbolDataController()
- (void)initializeDefaultDataList;
@end

@implementation StockSymbolDataController

@synthesize masterStockSymbolList = _masterStockSymbolList;

- (void)setMasterStockSymbolList:(NSMutableArray *)newList {
  if (_masterStockSymbolList != newList) {
    _masterStockSymbolList = [newList mutableCopy];
  }
}

- (id)init {
  if (self = [super init]) {
    [self initializeDefaultDataList];
    return self;
  }

  return nil;
}

- (void)initializeDefaultDataList {
  NSMutableArray *sightingList = [[NSMutableArray alloc] init];

  self.masterStockSymbolList = sightingList;

  [self addStockWithSymbol:@"AAPL"];
  [self addStockWithSymbol:@"ARMH"];
  [self addStockWithSymbol:@"INTC"];
}

-(void)addStockWithSymbol:(NSString *)symbol {
  StockSymbol *stock;

  stock = [[StockSymbol alloc] initWithSymbol:symbol];

  [self.masterStockSymbolList addObject:stock];
}

-(StockSymbol *)objectInListAtIndex:(NSUInteger)theIndex {
  return [self.masterStockSymbolList objectAtIndex:theIndex];
}

-(NSUInteger)countOfList {
  return [self.masterStockSymbolList count];
}

-(void)removeObjectAtIndex:(NSUInteger)theIndex {
  [self.masterStockSymbolList removeObjectAtIndex:theIndex];
}

@end
