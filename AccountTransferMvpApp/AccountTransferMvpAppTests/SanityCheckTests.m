#import "SanityCheckTests.h"
#import "OCMockObject.h"
#import "ISanityCheck.h"

@implementation SanityCheckTests


- (void)testSanityCheckOCUnit {
    STAssertTrue(true, @"This should be true");
}

- (void)testSanityCheckOCMock {
    id sanityCheck = [OCMockObject mockForProtocol:@protocol(ISanityCheck)];

    [sanityCheck verify];
}

@end
