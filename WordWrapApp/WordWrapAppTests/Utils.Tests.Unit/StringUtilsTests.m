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

- (void)testWrapLineByColumnWidthMethod_inputTextShorterThanColumnWidth_returnsLineWithNoBreaks {
    NSString *input = @"Short input";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:20];

    STAssertEqualObjects(expected, result, @"Input text shorter than column width should return line with no breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidthShorterThanTwenty_throwsException {
    @try {
        [sut wrapLine:@"blah" byColumnWidth:19];
        STAssertFalse(true, @"Column width less than 20 should throw exception.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"ColumnWidthTooNarrowException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"You cannot input a column width < 20 (unless 0).", [ex description], @"The expected exception description was not thrown.");
    }
}
@end
