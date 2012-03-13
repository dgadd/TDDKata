#import "AVStockPortfolio.h"
#import "../Gateways/AVQuoteGateway.h"
#import "AVQuoteGatewayProtocol.h"


@implementation AVStockPortfolio {

@private
    id <AVQuoteGatewayProtocol> _quoteService;
}

@synthesize quoteService = _quoteService;

- (AVStockPortfolio *)initWithService:(id <AVQuoteGatewayProtocol>)quoteService {
    if (self = [super init]) {
        _quoteService = quoteService;
    }
    return self;

}

- (NSNumber *)getQuote:(NSString *)stockAbbreviation {
    [_quoteService initiateConnection];
    return [_quoteService retrieveQuoteFor:stockAbbreviation];
}
@end