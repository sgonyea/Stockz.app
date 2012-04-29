//
//  StockSymbol.h
//  Stockz
//
//  Created by Scott Gonyea on 4/22/12.
//  Copyright (c) 2012 sgonyea inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockSymbol : NSObject

@property (nonatomic, copy) NSString *symbol;
@property (nonatomic, copy) NSString *priceChg;
@property (nonatomic, copy) NSString *percentChg;
@property (nonatomic, copy) NSString *marketCap;

-(id)initWithSymbol:(NSString *)symbol;

@end
