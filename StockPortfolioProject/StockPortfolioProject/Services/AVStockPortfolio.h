#import <Foundation/Foundation.h>

@class AVQuoteGateway;
@protocol AVQuoteGatewayProtocol;


@interface AVStockPortfolio : NSObject
@property(nonatomic, retain) id<AVQuoteGatewayProtocol> quoteService;

- (AVStockPortfolio *)initWithService:(id<AVQuoteGatewayProtocol>)quoteService;

- (NSNumber *)getQuote:(NSString *)stockAbbreviation;
@end