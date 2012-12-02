#import "SanityCheckTests.h"
#import "OCMockObject.h"
#import "ISanityCheck.h"

@implementation SanityCheckTests

-(void)testSanityCheck_OCUnit {
    STAssertTrue(true, @"OCUnit is not configuired correctly.");
}

-(void)testSanityCheck_OCMock {
    id sanityCheck = [OCMockObject mockForProtocol:@protocol(ISanityCheck)];
    [sanityCheck verify];
}
@end
