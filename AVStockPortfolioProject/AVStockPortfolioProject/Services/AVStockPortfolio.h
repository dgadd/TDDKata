#import <Foundation/Foundation.h>

@class AVQuoteService;


@interface AVStockPortfolio : NSObject
- (AVStockPortfolio *)initWithService:(AVQuoteService*)quoteService;

@property (retain,readonly) AVQuoteService *quoteService;

- (double)getQuoteFor:(NSString *)stockTitle;
@end