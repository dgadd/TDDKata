#import "When_I_add_a_one_length_value.h"
#import "Calculator.h"

@implementation When_I_add_a_one_length_value
@synthesize result = _result;


// when
- (void)setUp {
    [super setUp];
    self.result = [self.sut add:@"3"];
}

- (void)test_it_should_return_the_equivalent_numeric_value {
    STAssertEquals(3, self.result, @"see test title");
}

@end
