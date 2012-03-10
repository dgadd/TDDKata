#import "AVStockPortfolio.h"
#import "AVQuoteService.h"


@implementation AVStockPortfolio {


@private
    AVQuoteService *_quoteService;
}


@synthesize quoteService = _quoteService;

- (AVStockPortfolio *)initWithService:(AVQuoteService *)quoteService {
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