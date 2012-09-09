#import "StringUtilsTests.h"
#import "StringUtils.h"

@implementation StringUtilsTests

- (void)setUp {
    [super setUp];
    sut = [[StringUtils alloc] init];
}

- (void)testWrapLineByColumnWidthMethod_inputAndColumnWidthZero_returnHasNoLineBreaks {
    NSString *input = @"Here is some input that is greater than 20 character long, with almost-maybe some hyphens.";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:0];

    STAssertEqualObjects(expected, result, @"When column width is 0, result should have no line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_inputAndColumnWidthTwenty_returnHasNoExactBreaks {
    NSString *input = @"Here is some input that is greater than 20 character long, with almost-maybe some hyphens.";
    NSString *expected = @"Here is some input t\nhat is greater than \n20 character long, w\nith almost-maybe som\ne hyphens.\n";

    NSString *result = [sut wrapLine:input byColumnWidth:20];

    STAssertEqualObjects(expected, result, @"When column width is 20, result should have exact line breaks.");
}

@end
