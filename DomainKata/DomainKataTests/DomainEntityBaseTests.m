#import "DomainEntityBaseTests.h"
#import "DomainEntityBase.h"

@implementation DomainEntityBaseTests

- (void)setUp {
    [super setUp];
}

- (void)testInitWithId_twoInstancesSameId_areEqual {
    int key = 3525;
    DomainEntityBase *sut1 = [[DomainEntityBase alloc] initWithKey:key];
    DomainEntityBase *sut2 = [[DomainEntityBase alloc] initWithKey:key];

    STAssertEqualObjects(sut1, sut2, @"Two intances of entity with same key should be equal");
}

- (void)testInitWithId_twoInstancesDifferentId_areNotEqual {
    DomainEntityBase *sut1 = [[DomainEntityBase alloc] initWithKey:32523];
    DomainEntityBase *sut2 = [[DomainEntityBase alloc] initWithKey:12351];

    STAssertFalse([sut1 isEqual:sut2], @"Two intances of entity with same key should not be equal");
}

@end
