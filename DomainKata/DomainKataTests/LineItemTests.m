#import "LineItemTests.h"
#import "LineItem.h"

@implementation LineItemTests

- (void)setUp {
    [super setUp];
    sut = [[LineItem alloc] init];
}

- (void)testInit_noInputs_isInstanceOfDomainEntityBase {
    STAssertTrue([sut isKindOfClass:[DomainEntityBase class]], @"LineItme should be instance of DomainEntityBase");
}


@end
