#import "PersonTests.h"
#import "Person.h"

@implementation PersonTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [sut release];
    [super tearDown];
}

- (void)testConstructor_NameAndAgeAndGenderInput_ReturnsDescriptionContainingInputs {
    sut = [[Person alloc] initWithName:@"Bob" age:[NSNumber numberWithInt:35] gender:Male];
    NSString *result = [sut description];
    NSString *expected = @"Hi! I am a man, named Bob, who is 35 years old";

    STAssertEqualObjects(expected, result, @"Expected description was not returned");
}


- (void)dealloc {
    [super dealloc];
}


@end
