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

- (double)getQuote:(NSString *)stockAbbreviation {
    [_quoteService initiateConnection];
    double quote = [_quoteService retrieveQuoteFor:stockAbbreviation];
    return quote;
}
@end