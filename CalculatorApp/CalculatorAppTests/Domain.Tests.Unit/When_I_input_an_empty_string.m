#import "When_I_input_an_empty_string.h"
#import "Calculator.h"

@implementation When_I_input_an_empty_string {
    NSInteger _result;
}

- (void)setUp {
    [super setUp];
    _result = [_sut add:@""];
}

-(void)test_it_should_return_numeric_zero {
    NSInteger expected = 0;
    STAssertEquals(expected, _result, @"see test title");
}

@end
