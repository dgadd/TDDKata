#import "BrokerServiceTests.h"
#import "OCMock.h"
#import "AVQuoteService.h"
#import "BrokerService.h"

@implementation BrokerServiceTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

//-(void)testInit{idmockService=[OCMockObjectmockForProtocol:@protocol(AVQuoteService)];[[mockServiceexpect]initiateConnection];
// //AVStockPortfolio*portfolio=[[AVStockPortfolioalloc]initWithService:mockService];[mockServiceverify];}

- (void)testInit {
    id mockService = [OCMockObject mockForProtocol:@protocol(AVQuoteService)];
    [[mockService expect] initiateConnection];
    sut = [[BrokerService alloc] initWithService:mockService];
    [mockService verify];

}
@end
