#import "StringUtilsTests.h"
#import "StringUtils.h"

@implementation StringUtilsTests

- (void)setUp {
    [super setUp];
    sut = [[StringUtils alloc] init];
}

- (void)testWrapLineByColumnWidthMethod_columnWidth0_returnsLineWithNoBreaks {
    NSString *input = @"A complex, multi-hyphenated, 3.758315 number-heavy complex sentence.";
    NSString *expected = input;
    NSString *result = [sut wrapLine:input byColumnWidth:0];

    STAssertEqualObjects(expected, result, @"When column width is 0, line should return with no breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidth20_returnsLineWithExactBreaks {
    NSString *input = @"A complex, multi-hyphenated, 3.758315 number-heavy complex sentence.";
    NSString *expected = @"A complex, multi-hyp\nhenated, 3.758315 nu\nmber-heavy complex s\nentence.";
    NSString *result = [sut wrapLine:input byColumnWidth:20];

    STAssertEqualObjects(expected, result, @"When column width is 20, line should return with exact breaks.");
}

@end
