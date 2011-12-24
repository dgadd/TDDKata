#import <OCMock/OCMock.h>
#import "BrokerServiceTests.h"
#import "BrokerService.h"
#import "DGQuoteGateway.h"

@implementation BrokerServiceTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [sut release];
    [super tearDown];
}

- (void)testInit {
    id dgQuoteGateway = [OCMockObject mockForProtocol:@protocol(DGQuoteGateway)];
    [[dgQuoteGateway expect] initiateConnection];

    sut = [[BrokerService alloc] initWithService:dgQuoteGateway];

    [dgQuoteGateway verify];
}


- (void)dealloc {
    [super dealloc];
}


@end
