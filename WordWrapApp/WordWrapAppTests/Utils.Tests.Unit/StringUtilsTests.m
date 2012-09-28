#import "StringUtilsTests.h"
#import "StringUtils.h"

@implementation StringUtilsTests

- (void)setUp {
    [super setUp];
    sut = [[StringUtils alloc] init];
}

- (void)testWrapLineByColumnWidthMethod_columnWidth0_returnsLineWithNoBreaks {
    NSString *input = @"Here is a line with multi-hypenated-context and 3.145 decimal numbers.";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:0 andWordBreak:NO];
    STAssertEqualObjects(expected, result, @"When column width is 0, line should return with no breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidth20_returnsLineWithExactBreaks {
    NSString *input = @"Here is a line with multi-hypenated-context and 3.145 decimal numbers.";
    NSString *expected = @"Here is a line with \nmulti-hypenated-cont\next and 3.145 decima\nl numbers.";

    NSString *result = [sut wrapLine:input byColumnWidth:20 andWordBreak:NO];
    STAssertEqualObjects(expected, result, @"When column width is 20, line should return with exact breaks.");
}

- (void)testWrapLineByColumnWidthMethod_inputLengthLessThanColumnWidth_returnsLineWithNoBreaks {
    NSString *input = @"short input";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:20 andWordBreak:NO];
    STAssertEqualObjects(expected, result, @"When input is less than column width, line should return with no breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidthLessThan20_throwsException {
    @try {
        [sut wrapLine:@"blah" byColumnWidth:19 andWordBreak:NO];
        STAssertFalse(true, @"Column width less than 20 should throw exception.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"ColumnWidthTooNarrowException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"The column width must be at least 20.", [ex description], @"The expected exception description was not thrown.");
    }
}

- (void)testWrapLineByColumnWidthAndWordBreakMethod_columnWidth20_returnsLineWithWordBreaks {
    NSString *input = @"Here is a line with multi-hypenated context and 3.145 decimal numbers.";
    NSString *expected = @"Here is a line with \nmulti-hypenated \ncontext and 3.145 \ndecimal numbers.";

    NSString *result = [sut wrapLine:input byColumnWidth:20 andWordBreak:YES];
    STAssertEqualObjects(expected, result, @"When column width is 20, line should return with exact breaks.");
}


@end
