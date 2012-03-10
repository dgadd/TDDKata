#import <Foundation/Foundation.h>

@class AVQuoteService;


@interface AVStockPortfolio : NSObject
- (AVStockPortfolio *)initWithService:(AVQuoteService*)quoteService;
@end