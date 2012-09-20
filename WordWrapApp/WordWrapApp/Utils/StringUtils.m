#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width withWordBreak:(BOOL)wordBreak {
    if (width == 0)
        return input;
    [self guardCondition_rejectTooNarrow:width];

    NSMutableString *lineWithBreaks = [NSMutableString string];
    while ([input length] > width)
        input = [self migrate:input by:width on:wordBreak into:lineWithBreaks];

    [lineWithBreaks appendString:[NSString stringWithFormat:@"%@", input]];
    return lineWithBreaks;
}

- (NSString *)migrate:(NSString *)input by:(int)width on:(BOOL)wordBreak into:(NSMutableString *)lineWithBreaks {
    NSString *sequence = [input substringToIndex:width];
    if (wordBreak)
        sequence = [self trimToWordBreakThis:sequence];
    [lineWithBreaks appendString:[NSString stringWithFormat:@"%@\n", sequence]];
    input = [input stringByReplacingOccurrencesOfString:sequence withString:@""];
    return input;
}

- (NSString *)trimToWordBreakThis:(NSString *)sequence {
    NSUInteger wordSpacePosition = [sequence rangeOfString:@" " options:NSBackwardsSearch].location;
    if (wordSpacePosition == NSNotFound)
        [NSException raise:@"WordsTooLongForWordBreakException" format:@"Words cannot be longer than column width when word break is true."];

    return [sequence substringToIndex:wordSpacePosition + 1];
}

- (void)guardCondition_rejectTooNarrow:(int)width {
    if (width < 20)
        [NSException raise:@"ColumnWidthTooNarrowException" format:@"The column width must be at least 20."];
}
@end