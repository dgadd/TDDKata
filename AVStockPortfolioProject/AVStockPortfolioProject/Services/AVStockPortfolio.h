#import <Foundation/Foundation.h>

@class AVQuoteGateway;


@interface AVStockPortfolio : NSObject
- (AVStockPortfolio *)initWithService:(AVQuoteGateway *)quoteService;

@property (retain,readonly) AVQuoteGateway *quoteService;

- (double)getQuoteFor:(NSString *)stockTitle;
@end