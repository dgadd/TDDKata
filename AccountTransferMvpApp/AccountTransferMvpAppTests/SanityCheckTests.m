#import "SanityCheckTests.h"
#import "OCMockObject.h"
#import "ISanityCheck.h"

@implementation SanityCheckTests

-(void)testSanityCheck {
    id sanityCheck = [OCMockObject mockForProtocol:@protocol(ISanityCheck)];
    [sanityCheck verify];
}
@end
