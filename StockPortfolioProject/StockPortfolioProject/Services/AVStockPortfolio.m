#import "AVStockPortfolio.h"
#import "../Gateways/AVQuoteGateway.h"


@implementation AVStockPortfolio {

@private
    AVQuoteGateway *_quoteService;
}

@synthesize quoteService = _quoteService;

- (AVStockPortfolio *)initWithService:(AVQuoteGateway *)quoteService {
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