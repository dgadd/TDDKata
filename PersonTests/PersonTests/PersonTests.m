#import "PersonTests.h"
#import "Person.h"

@implementation PersonTests

- (void)setUp {
    [super setUp];
    sut = [[Person alloc] init];
}

- (void)tearDown {
    [sut release];
    [super tearDown];
}


- (void)dealloc {
    [super dealloc];
}


@end
