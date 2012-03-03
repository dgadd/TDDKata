#import "DomainEntityBaseTests.h"
#import "DomainEntityBase.h"

@implementation DomainEntityBaseTests

- (void)setUp {
    [super setUp];
    sut = [[DomainEntityBase alloc] init];
}

- (void)testTwoInstances_SameIdInput_AreEqual {
    DomainEntityBase *sut2 = [[DomainEntityBase alloc] init];
    sut.Id = 352;
    sut2.Id = 352;

    STAssertEqualObjects(sut, sut2, @"sut should be equal to sut2");
}

- (void)testTwoInstances_DifferentIdInput_AreNotEqual {
    DomainEntityBase *sut2 = [[DomainEntityBase alloc] init];
    sut.Id = 352;
    sut2.Id = 9999;

    STAssertFalse([sut isEqual:sut2], @"sut should not equal sut2");
}


@end
