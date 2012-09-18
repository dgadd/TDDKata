#import "StringUtilsTests.h"
#import "StringUtils.h"

@implementation StringUtilsTests

- (void)setUp {
    [super setUp];
    sut = [[StringUtils alloc] init];
}

- (void)testWrapLineByColumnWidthMethod_columnWidth0_returnsLineWithNoBreaks {
    NSString *input = @"This is a complex, half-hyphenated line of text with numbers 2,138,454 and 'single quotes'.";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:0];

    STAssertEqualObjects(expected, result, @"Column width 0 should return line with no breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidth20_returnsLineWithExactBreaks {
    NSString *input = @"This is a complex, half-hyphenated line of text with numbers 2,138,454 and 'single quotes'.";
    NSString *expected = @"This is a complex, h\nalf-hyphenated line \nof text with numbers\n 2,138,454 and 'sing\nle quotes'.";

    NSString *result = [sut wrapLine:input byColumnWidth:20];

    STAssertEqualObjects(expected, result, @"Column width 20 should return line with exact breaks.");
}

@end
