#import "StringManipulatorTests.h"
#import "StringManipulator.h"

@implementation StringManipulatorTests

- (void)setUp {
    [super setUp];
    sut = [[StringManipulator alloc] init];
}

- (void)testWrapTextByColumnWidthMethod_zeroLengthInput_lineHasNoBreaks {
    NSString *input = @"John A. MacDonald was the first Prime Minister of Canada. Pierre Elliot Trudeau was the Prime Minister who re-patriated the Canadian constitution from the UK in 1982.";
    NSString *expected = input;

    NSString *result = [sut wrapText:input byColumnWidth:0 breakWhere:NO];

    STAssertEqualObjects(expected, result, @"When column width is 0, the result should have no line breaks.");
}

- (void)testWrapTextByColumnWidthMethod_greaterThanNineteenLengthInput_lineHasNoBreaks {
    NSString *input = @"John A. MacDonald was the first Prime Minister of Canada. Pierre Elliot Trudeau was the Prime Minister who re-patriated the Canadian constitution from the UK in 1982.";
    NSString *expected = @"John A. MacDonald wa\ns the first Prime Mi\nnister of Canada. Pi\nerre Elliot Trudeau \nwas the Prime Minist\ner who re-patriated \nthe Canadian constit\nution from the UK in\n 1982.";

    NSString *result = [sut wrapText:input byColumnWidth:20 breakWhere:NO];

    STAssertEqualObjects(expected, result, @"When column width is 20, the result should break every 20 char.");
}

- (void)testWrapTextByColumnWidthMethod_breakAtWordBoundariesTrueInput_linesBreakAtWordBoundariesAfterSpace {
    NSString *input = @"John A. MacDonald was the first Prime Minister of Canada. Pierre Elliot Trudeau was the Prime Minister who re-patriated the Canadian constitution from the UK in 1982.";
    NSString *expected = @"John A. MacDonald \nwas the first Prime \nMinister of Canada. \nPierre Elliot \nTrudeau was the \nPrime Minister who \nre-patriated the \nCanadian \nconstitution from \nthe UK in 1982.";

    NSString *result = [sut wrapText:input byColumnWidth:20 breakWhere:YES];

    STAssertEqualObjects(expected, result, @"When break at word boundaries is true, result should break at word boundaries within specified column width.");
}

@end
