#import "StringUtilsCategoryTests.h"
#import "NSString+StringUtils.h"

@implementation StringUtilsCategoryTests

- (void)testStringCategoryWrapByColumnWidthMethod_breakAtWordBoundariesTrueInput_linesBreakAtWordBoundariesAfterSpace {
    NSString *input = @"John A. MacDonald was the first Prime Minister of Canada. Pierre Elliot Trudeau was the Prime Minister who re-patriated the Canadian constitution from the UK in 1982.";
    NSString *expected = @"John A. MacDonald \nwas the first Prime \nMinister of Canada. \nPierre Elliot \nTrudeau was the \nPrime Minister who \nre-patriated the \nCanadian \nconstitution from \nthe UK in 1982.";

    NSString *result = [input wrapByColumnWidth:20 wordBreak:YES];

    STAssertEqualObjects(expected, result, @"When break at word boundaries is true, result should break at word boundaries within specified column width.");
}

@end
