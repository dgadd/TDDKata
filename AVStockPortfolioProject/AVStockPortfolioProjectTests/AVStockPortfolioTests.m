#import "AVStockPortfolioTests.h"
#import "AVStockPortfolio.h"
#import "OCMockObject.h"
#import "../AVStockPortfolioProject/Protocols/AVQuoteGatewayProtocol.h"

@implementation AVStockPortfolioTests

+ (void)setUp {
    [super setUp];
}

- (void)testGetQuoteForMethod_StockIdentifierInput_ExpectedProtocolServiceMethodsAreCalled {
    id mockService = [OCMockObject mockForProtocol:@protocol(AVQuoteGatewayProtocol)];
    NSString *stockIdentifier = @"AAPL";

    [[mockService expect] initiateConnection];
    [[mockService expect] callDowJonesForQuote:stockIdentifier];

    AVStockPortfolio *portfolio = [[AVStockPortfolio alloc] initWithService:mockService];
    [portfolio getQuoteFor:stockIdentifier];

    [mockService verify];
}

@end