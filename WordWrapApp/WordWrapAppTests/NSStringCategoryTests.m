#import "NSStringCategoryTests.h"
#import "NSString+KataUtils.h"

@implementation NSStringCategoryTests

- (void)testWrapLineByColumnWidthWithWordBreakMethod_wordBreakTrue_lineShouldBreakAfterWordSpace {
    NSString *input = @"Many multi-marmotted maps may multiply 3.14527 x more magnificently.";
    NSString *expected = @"Many \nmulti-marmotted \nmaps may multiply \n3.14527 x more \nmagnificently.";

    NSString *result = [input wrapLineByColumnWidth:20 withWordBreak:YES];

    STAssertEqualObjects(expected, result, @"Input text shorter than column width should return no line breaks.");
}
@end
