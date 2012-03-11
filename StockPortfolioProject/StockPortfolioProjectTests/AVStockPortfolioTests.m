#import "AVStockPortfolioTests.h"
#import "OCMockObject.h"
#import "../StockPortfolioProject/Protocols/AVQuoteGatewayProtocol.h"
#import "AVStockPortfolio.h"
#import "../StockPortfolioProject/Gateways/AVQuoteGateway.h"


@implementation AVStockPortfolioTests

+ (void)setUp {
    [super setUp];
}

- (void)testGetQuoteMethod_StockAbbreviationInput_ExpectedMethodsCalledOnQuoteGateway {
    NSString *stockAbbreviation = @"AAPL";
    id mockService = [OCMockObject mockForProtocol:@protocol(AVQuoteGatewayProtocol)];
    [[mockService expect] initiateConnection];
    [[mockService expect] retrieveQuoteFor:stockAbbreviation];

    AVStockPortfolio *portfolio = [[AVStockPortfolio alloc] initWithService:mockService];
    double quote = [portfolio getQuote:stockAbbreviation];

    //STAssertTrue(quote > 0.0, @"Returned quote should be greater than zero.");
    [mockService verify];
}


@end