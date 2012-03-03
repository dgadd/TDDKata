#import "InvoiceTests.h"
#import "Invoice.h"
#import "DomainEntityBase.h"

@implementation InvoiceTests

- (void)setUp {
    [super setUp];  
    sut = [[Invoice alloc] init];
}

- (void)testAllocAndInit_NoInputs_IsInstanceOfDomainEntityBase {
    STAssertTrue([sut isKindOfClass:[DomainEntityBase class]], @"Invoice should be instance of DomainEntityBase.");
}


@end
