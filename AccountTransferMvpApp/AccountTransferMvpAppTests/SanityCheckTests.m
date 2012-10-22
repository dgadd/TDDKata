#import "SanityCheckTests.h"
#import "OCMockObject.h"
#import "ISanityCheckRepository.h"

@implementation SanityCheckTests

-(void)testSanityCheck {
    id sanityCheckRepository = [OCMockObject mockForProtocol:@protocol(ISanityCheckRepository)];
    [sanityCheckRepository verify];
}

@end
