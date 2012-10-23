#import "SanityCheckTests.h"
#import "OCMockObject.h"
#import "ISanityCheckProtocol.h"

@implementation SanityCheckTests

-(void)testSanityCheck {
    id sanityCheck = [OCMockObject mockForProtocol:@protocol(ISanityCheckProtocol)];
    [sanityCheck verify];
}

@end
