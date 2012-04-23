//
//  StockSymbolDataController.h
//  Stockz
//
//  Created by Scott Gonyea on 4/22/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StockSymbol;

@interface StockSymbolDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterStockSymbolList;

-(NSUInteger)countOfList;
-(StockSymbol *)objectInListAtIndex:(NSUInteger)theIndex;
-(void)addStockWithSymbol:(NSString *)symbol;

@end
