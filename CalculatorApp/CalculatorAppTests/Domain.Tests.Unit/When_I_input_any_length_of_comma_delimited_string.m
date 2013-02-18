#import "When_I_input_any_length_of_comma_delimited_string.h"
#import "Calculator.h"

@implementation When_I_input_any_length_of_comma_delimited_string {
    NSInteger _result;
    NSInteger _expected;
}

- (void)setUp {
    [super setUp];
    NSInteger random = arc4random() % 999;
    NSMutableString *numbersToAdd = [NSMutableString string];
    _expected = 0;
    for (int i = 0; i < random; i++) {
        [numbersToAdd appendString:[NSString stringWithFormat:@"%i,",i]];
        _expected += i;
    }
    _result = [_sut add:numbersToAdd];
}

-(void)test_it_should_sum_any_length_of_comma_delimited_string {
    STAssertEquals(_expected, _result, @"see test title");
}

@end
