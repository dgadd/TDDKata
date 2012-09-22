#import "NSStringCategoryTests.h"
#import "NSString+NSStringCategoryMethods.h"

@implementation NSStringCategoryTests

- (void)testWrapLineByColumnWidthAndWordBreakMethod_columnWidth20_returnsLineWithExactBreaks {
    NSString *input = @"A complex, multi-hyphenated, 3.758315 number-heavy complex sentence.";
    NSString *expected = @"A complex, \nmulti-hyphenated, \n3.758315 \nnumber-heavy \ncomplex sentence.";
    NSString *result = [input wrapLineByColumnWidth:20 withWordBreak:YES];

    STAssertEqualObjects(expected, result, @"When column width is 20 and word break true, line should return with word breaks.");
}

@end
