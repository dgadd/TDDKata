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
    NSString *result = [sut wrapLine:input byColumnWidth:0 withWordBreak:0];

    STAssertEqualObjects(expected, result, @"When column width is 0, line should return with no breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidth20_returnsLineWithExactBreaks {
    NSString *input = @"A complex, multi-hyphenated, 3.758315 number-heavy complex sentence.";
    NSString *expected = @"A complex, multi-hyp\nhenated, 3.758315 nu\nmber-heavy complex s\nentence.";
    NSString *result = [sut wrapLine:input byColumnWidth:20 withWordBreak:0];

    STAssertEqualObjects(expected, result, @"When column width is 20, line should return with exact breaks.");
}

- (void)testWrapLineByColumnWidthMethod_inputShorterThanColumnWidth_returnsLineWithNoBreaks {
    NSString *input = @"Short input";
    NSString *expected = input;
    NSString *result = [sut wrapLine:input byColumnWidth:20 withWordBreak:0];

    STAssertEqualObjects(expected, result, @"When input is less than column width, line should return with no breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidthLessThan20_throwsException {
    @try {
        [sut wrapLine:@"blah" byColumnWidth:19 withWordBreak:0];
        STAssertFalse(true, @"Column width shorter than 20 should throw exception.");
    } @catch (NSException *ex) {
        STAssertEqualObjects(@"ColumnWidthTooNarrowException", [ex name], @"Expected exception name should be thrown.");
        STAssertEqualObjects(@"The column width must be at least 20.", [ex description], @"Expected exception description should be thrown.");
    }
}

- (void)testWrapLineByColumnWidthAndWordBreakMethod_columnWidth20_returnsLineWithExactBreaks {
    NSString *input = @"A complex, multi-hyphenated, 3.758315 number-heavy complex sentence.";
    NSString *expected = @"A complex, \nmulti-hyphenated, \n3.758315 \nnumber-heavy \ncomplex sentence.";
    NSString *result = [sut wrapLine:input byColumnWidth:20 withWordBreak:YES];

    STAssertEqualObjects(expected, result, @"When column width is 20 and word break true, line should return with word breaks.");
}

@end
