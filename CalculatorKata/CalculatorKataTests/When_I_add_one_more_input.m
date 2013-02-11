#import "When_I_add_one_more_input.h"
#import "Calculator.h"

@implementation When_I_add_one_more_input : Given_that_I_have_a_Calculator_with_an_array_of_3_inputs {
}

// when
- (void)setUp {
    [super setUp];
    [[super sut] addToInputs:[NSNumber numberWithDouble:35.2]];
}

-(void)test_it_should_retain_the_initial_number_of_inputs {
    NSUInteger expected = 3;
    STAssertEquals(expected, [[[super sut] inputs] count], @"see test title");
}

-(void)test_it_should_provide_the_total_input_value_via_sum {
    NSNumber *expected = [NSNumber numberWithDouble:104.7];
    STAssertEqualObjects(expected, [[super sut] sum], @"see test title");
}

@end
