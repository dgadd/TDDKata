#import "AccountTransferPresenterTests.h"
#import "OCMockObject.h"
#import "ISanityCheck.h"

@implementation AccountTransferPresenterTests

-(void)testSanityCheck {
    id sanityCheck = [OCMockObject mockForProtocol:@protocol(ISanityCheck)];

    [sanityCheck verify];
}
@end
