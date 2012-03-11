#import "AVStockPortfolioTests.h"
#import "OCMockObject.h"
#import "../StockPortfolioProject/Protocols/AVQuoteGatewayProtocol.h"
#import "AVStockPortfolio.h"
#import "../StockPortfolioProject/Gateways/AVQuoteGateway.h"
#import "OCMockRecorder.h"


@implementation AVStockPortfolioTests

+ (void)setUp {
    [super setUp];
}

- (void)testGetQuoteMethod_StockAbbreviationInput_ExpectedMethodsCalledOnQuoteGateway {
    NSString *stockAbbreviation = @"AAPL";
    NSNumber *quoteAmount = [NSNumber numberWithFloat:35.0];
    id mockService = [OCMockObject mockForProtocol:@protocol(AVQuoteGatewayProtocol)];
    [[mockService expect] initiateConnection];
    [[[mockService expect] andReturn:quoteAmount] retrieveQuoteFor:stockAbbreviation];

    AVStockPortfolio *portfolio = [[AVStockPortfolio alloc] initWithService:mockService];
    NSNumber *quote = [portfolio getQuote:stockAbbreviation];

    STAssertEqualObjects(quoteAmount, quote, @"The returned quote matches the expected mock amount");
    [mockService verify];
}


@end