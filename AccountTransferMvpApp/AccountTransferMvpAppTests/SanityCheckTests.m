#import "SanityCheckTests.h"
#import "OCMockObject.h"
#import "ISantiyCheck.h"

@implementation SanityCheckTests

-(void)testSanityCheck {
    id sanityCheck = [OCMockObject mockForProtocol:@protocol(ISantiyCheck)];
    [sanityCheck verify];
}

@end
