#import <OCMock/OCMock.h>
#import "GReaderTests.h"
#import "GReader.h"

@implementation GReaderTests

- (void)setUp {
    [super setUp];
    sut = [[GReader alloc] init];
}

- (void)tearDown {
    [sut release];
    [super tearDown];
}

- (void)testNotSure {
    STAssertEquals(true, true, @"true should equal true");
}

- (void)testAuthentication {
    id mock = [OCMockObject partialMockForObject:sut];
    [[[mock stub] andCall:@selector(fakeAuthenticationPost:)
                 onObject:self] post:[OCMArg any]];

    [sut authenticateWithUsername:@"dan" password:@"password"];
}

- (void)dealloc {
    [super dealloc];
}


@end
