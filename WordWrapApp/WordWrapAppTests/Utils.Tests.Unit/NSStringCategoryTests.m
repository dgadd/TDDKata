#import "NSStringCategoryTests.h"
#import "NSString+Extensions.h"

@implementation NSStringCategoryTests

- (void)testWrapLineByColumnWidthWithWordBreakMethod_wordBreakTrue_shouldReturnWordLineBreaks {
    NSString *input = @"Here is a long line, hyphens-included, with 3.2713251 number examples.";
    NSString *expected = @"Here is a long \nline, \nhyphens-included, \nwith 3.2713251 \nnumber examples.";

    NSString *result = [input wrapLineByColumnWidth:20 withWordBreak:YES];

    STAssertEqualObjects(expected, result, @"When word break is true, result should have word line breaks.");
}

@end
