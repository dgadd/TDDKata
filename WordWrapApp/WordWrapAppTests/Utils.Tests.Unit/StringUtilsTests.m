#import "StringUtilsTests.h"
#import "StringUtils.h"

@implementation StringUtilsTests

- (void)setUp {
    [super setUp];
    sut = [[StringUtils alloc] init];
}

- (void)testWrapLineByColumnWidthMethod_columnWidthZero_shouldReturnNoLineBreaks {
    NSString *input = @"Here is a long line, hyphens-included, with 3.2713251 number examples.";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:0 withWordBreak:0];

    STAssertEqualObjects(expected, result, @"When column width is 0, result should have no line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidthTwenty_shouldReturnExactLineBreaks {
    NSString *input = @"Here is a long line, hyphens-included, with 3.2713251 number examples.";
    NSString *expected = @"Here is a long line,\n hyphens-included, w\nith 3.2713251 number\n examples.";

    NSString *result = [sut wrapLine:input byColumnWidth:20 withWordBreak:0];

    STAssertEqualObjects(expected, result, @"When column width is 20, result should have exact line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_inputShorterThanColumnWidth_shouldReturnNoLineBreaks {
    NSString *input = @"short input";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:20 withWordBreak:0];

    STAssertEqualObjects(expected, result, @"When input is shorter than column width, result should have no line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidthLessThan20_throwsException {
    @try {
        [sut wrapLine:@"blah" byColumnWidth:19 withWordBreak:0];
        STAssertFalse(true, @"Column width shorter than 20 should throw exception.");
    } @catch (NSException *ex) {
        STAssertEqualObjects(@"ColumnWidthTooNarrowException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"The column width must be at least 20.", [ex description], @"The expected exception description was not thrown.");
    }
}

- (void)testWrapLineByColumnWidthWithWordBreakMethod_wordBreakTrue_shouldReturnWordLineBreaks {
    NSString *input = @"Here is a long line, hyphens-included, with 3.2713251 number examples.";
    NSString *expected = @"Here is a long \nline, \nhyphens-included, \nwith 3.2713251 \nnumber examples.";

    NSString *result = [sut wrapLine:input byColumnWidth:20 withWordBreak:YES];

    STAssertEqualObjects(expected, result, @"When word break is true, result should have word line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_wordLongerThanColumnWidthWhenLineBreakTrue_throwsException {
    @try {
        [sut wrapLine:@"The supercalifragilisticexpialidotious day." byColumnWidth:20 withWordBreak:YES];
        STAssertFalse(true, @"Words longer than column width when word break true should throw exception.");
    } @catch (NSException *ex) {
        STAssertEqualObjects(@"WordsTooLongForWordBreakException", [ex name], @"The expected exception name was not thrown.");
        STAssertEqualObjects(@"Words cannot be longer than column width when word break is true.", [ex description], @"The expected exception description was not thrown.");
    }
}


@end
