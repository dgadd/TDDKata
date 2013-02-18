#import "When_I_input_a_two_length_comma_delimited_string.h"
#import "Calculator.h"

@implementation When_I_input_a_two_length_comma_delimited_string {
    NSInteger _result;
}

- (void)setUp {
    [super setUp];
    _result = [_sut add:@"3,5"];
}

-(void)test_it_should_sum_the_two_values {
    NSInteger expected = 8;
    STAssertEquals(expected, _result, @"see test title");
}

@end
