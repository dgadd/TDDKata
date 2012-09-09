#import "StringUtilsTests.h"
#import "StringUtils.h"

@implementation StringUtilsTests

- (void)setUp {
    [super setUp];
    sut = [[StringUtils alloc] init];
}

- (void)testWrapLineByColumnWidthMethod_inputAndColumnWidthZero_returnHasNoLineBreaks {
    NSString *input = @"Here is some input that is greater than 20 character long, with almost-maybe some hyphens.";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:0 andWordBreak:NO];

    STAssertEqualObjects(expected, result, @"When column width is 0, result should have no line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_inputAndColumnWidthTwenty_returnHasExactBreaks {
    NSString *input = @"Here is some input that is greater than 20 character long, with almost-maybe some hyphens.";
    NSString *expected = @"Here is some input t\nhat is greater than \n20 character long, w\nith almost-maybe som\ne hyphens.\n";

    NSString *result = [sut wrapLine:input byColumnWidth:20 andWordBreak:NO];

    STAssertEqualObjects(expected, result, @"When column width is 20, result should have exact line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_inputLengthLessThanColumnWidth_returnHasNoBreaks {
    NSString *input = @"A short line";
    NSString *expected = input;

    NSString *result = [sut wrapLine:input byColumnWidth:20 andWordBreak:NO];

    STAssertEqualObjects(expected, result, @"When input line length is shorter than column width, result should have no line breaks.");
}

- (void)testWrapLineByColumnWidthMethod_columnWidthLessThanTwenty_throwsException {
    @try {
        [sut wrapLine:@"blah" byColumnWidth:19 andWordBreak:NO];
        STAssertFalse(true, @"Column width less than 20 should throw exception.");
    } @catch(NSException *ex) {
        STAssertEqualObjects(@"ColumnWidthTooShortException", [ex name], @"The expected exception name was not returned.");
        STAssertEqualObjects(@"The column width cannot be less than 20.", [ex description], @"The expected exception description was not returned.");
    }
}

- (void)testWrapLineByColumnWidthAndWordBreakMethod_wordBreakIsTrue_returnHasWordBreaks {
    NSString *input = @"Here is some input that is greater than 20 character long, with almost-maybe some hyphens.";
    NSString *expected = @"Here is some input \nthat is greater \nthan 20 character \nlong, with \nalmost-maybe some \nhyphens.\n";

    NSString *result = [sut wrapLine:input byColumnWidth:20 andWordBreak:YES];

    STAssertEqualObjects(expected, result, @"When word break is true, result should have word breaks.");
}

@end
