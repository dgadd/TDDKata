#import "LineItemTests.h"
#import "LineItem.h"
#import "DomainEntityBase.h"

@implementation LineItemTests

- (void)setUp {
    [super setUp];  
    sut = [[LineItem alloc] init];
}

- (void)testInit_NoInputs_IsInstanceOfDomainEntityBase {
    STAssertTrue([sut isKindOfClass:[DomainEntityBase class]], @"LineItem should be instance of DomainEntityBase");
}

@end
