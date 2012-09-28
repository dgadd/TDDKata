#import "NSStringPlusCategoryTests.h"
#import "NSString+KataUtils.h"

@implementation NSStringPlusCategoryTests

- (void)testWrapLineByColumnWidthAndWordBreakMethod_columnWidth20_returnsLineWithWordBreaks {
    NSString *input = @"Here is a line with multi-hypenated context and 3.145 decimal numbers.";
    NSString *expected = @"Here is a line with \nmulti-hypenated \ncontext and 3.145 \ndecimal numbers.";

    NSString *result = [input wrapLineByColumnWidth:20 andWordBreak:YES];
    STAssertEqualObjects(expected, result, @"When column width is 20, line should return with exact breaks.");
}

@end
