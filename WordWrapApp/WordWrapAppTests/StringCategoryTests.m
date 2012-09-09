#import "StringCategoryTests.h"
#import "NSString+StringExtensions.h"

@implementation StringCategoryTests

- (void)testWrapLineByColumnWidthAndWordBreakMethod_wordBreakIsTrue_returnHasWordBreaks {
    NSString *input = @"Here is some input that is greater than 20 character long, with almost-maybe some hyphens.";
    NSString *expected = @"Here is some input \nthat is greater \nthan 20 character \nlong, with \nalmost-maybe some \nhyphens.\n";

    NSString *result = [input wrapLineByColumnWidth:20 andWordBreak:YES];

    STAssertEqualObjects(expected, result, @"When word break is true, result should have word breaks.");
}
@end
