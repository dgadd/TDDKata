#import "StringUtilsTests.h"
#import "StringUtils.h"

@implementation StringUtilsTests

- (void)setUp {
    [super setUp];
    sut = [[StringUtils alloc] init];
}

- (void)testWrapLineByColumnWidthMethod_columnWidth0_lineShouldReturnWithNoBreaks {
    NSString *input = @"Here is a fancy-hyphentated line with 3.14 as PI and also; even a semi-colon.";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:0 withWordBreak:NO];

    STAssertEqualObjects(expected, result, @"When column width is 0, line should return with no breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidth20_lineShouldReturnWithExactBreaks {
    NSString *input = @"Here is a fancy-hyphentated line with 3.14 as PI and also; even a semi-colon.";
    NSString *expected = @"Here is a fancy-hyph\nentated line with 3.\n14 as PI and also; e\nven a semi-colon.";

    NSString *result = [sut wrapLine:input byColumnWidth:20 withWordBreak:NO];

    STAssertEqualObjects(expected, result, @"When column width is 20, line should return with exact breaks.");
}

- (void)testWrapLineByColumnWidthMethod_inputShorterThanColumnWidth_lineShouldReturnWithNoBreaks {
    NSString *input = @"very short";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:0 withWordBreak:NO];

    STAssertEqualObjects(expected, result, @"When input is shorter than column width, line should return with no breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidthLessThan20_shouldThrowException {
    @try {
        [sut wrapLine:@"blah" byColumnWidth:19 withWordBreak:NO];
        STAssertFalse(true, @"Column width less than 20 should throw exception.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"ColumnWidthTooNarrowException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"The column width cannot be less than 20.", [ex description], @"The expected exception description was not thrown.");
    }
}

- (void)testWrapLineByColumnWidthWithWordBreakMethod_columnWidth20_lineShouldReturnWithWordBreaks {
    NSString *input = @"Here is a fancy-hyphentated line with 3.14 as PI and also; even a semi-colon.";
    NSString *expected = @"Here is a \nfancy-hyphentated \nline with 3.14 as \nPI and also; even a \nsemi-colon.";

    NSString *result = [sut wrapLine:input byColumnWidth:20 withWordBreak:YES];

    STAssertEqualObjects(expected, result, @"When column width is 20, line should return with exact breaks.");
}

- (void)testWrapLineByColumnWidthMethod_wordLongerThanColumnWidth_shouldThrowException {
    @try {
        [sut wrapLine:@"supercalifragilisticexpialidotious" byColumnWidth:20 withWordBreak:YES];
        STAssertFalse(true, @"Word longer than column width should throw exception.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"WordLongerThanColumnWidthException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"When word break is true, words cannot be longer than column width.", [ex description], @"The expected exception description was not thrown.");
    }
}



@end
