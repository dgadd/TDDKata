#import "AVStockPortfolio.h"
#import "../Repositories/AVQuoteGateway.h"


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

- (double)getQuoteFor:(NSString *)stockTitle {
    [_quoteService initiateConnection];
    return [_quoteService callDowJonesForQuote:stockTitle];
}

- (void)dealloc {
    [_quoteService release];
    [super dealloc];
}
@end