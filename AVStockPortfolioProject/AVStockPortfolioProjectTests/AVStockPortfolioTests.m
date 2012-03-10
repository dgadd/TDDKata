#import "AVStockPortfolioTests.h"
#import "AVStockPortfolio.h"
#import "OCMockObject.h"
#import "../AVStockPortfolioProject/Protocols/AVQuoteServiceProtocol.h"

@implementation AVStockPortfolioTests

+ (void)setUp {
    [super setUp];
}

- (void)testInit {
  id mockService = [OCMockObject mockForProtocol:@protocol(AVQuoteServiceProtocol)];
  [[mockService expect] initiateConnection];

  AVStockPortfolio *portfolio = [[AVStockPortfolio alloc] initWithService:mockService];

  [mockService verify];
}

@end