#import "SanityCheckTests.h"
#import "OCMockObject.h"
#import "ISanityCheckRepository.h"

@implementation SanityCheckTests

- (void)setUp {
    [super setUp];
}

- (void)testSanityCheckOCUnit {
    STAssertTrue(true, @"OCUnit should assert true.");
}

-(void)testSanityCheckOCMock {
    id sanityCheckRepository = [OCMockObject mockForProtocol:@protocol(ISanityCheckRepository)];

    [sanityCheckRepository verify];
}

@end
