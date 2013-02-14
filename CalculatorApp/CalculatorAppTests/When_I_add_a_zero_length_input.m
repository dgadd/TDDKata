#import "When_I_add_a_zero_length_input.h"
#import "Calculator.h"

@implementation When_I_add_a_zero_length_input {
    NSInteger _result;
}

// when
- (void)setUp {
    [super setUp];
    _result = [self.sut add:@""];
}

-(void)test_it_should_return_a_numeric_zero_value {
    STAssertEquals(0, _result, @"see test title");
}

@end
