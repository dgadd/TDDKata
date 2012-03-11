#import <Foundation/Foundation.h>

@class AVQuoteGateway;


@interface AVStockPortfolio : NSObject
@property(nonatomic, retain) AVQuoteGateway *quoteService;

- (AVStockPortfolio *)initWithService:(AVQuoteGateway *)quoteService;

- (NSNumber *)getQuote:(NSString *)stockAbbreviation;
@end