#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width withWordBreak:(BOOL)wordBreak {
    if (width == 0)
        return input;
    [self guardCondition_rejectTooNarrowColumnWidthFor:width];

    NSMutableString *lineWithBreaks = [NSMutableString string];
    while ([input length] > width) {
        NSString *sequence = [input substringToIndex:width];
        sequence = [self handle:wordBreak for:sequence];
        input = [input stringByReplacingOccurrencesOfString:sequence withString:@""];
        [lineWithBreaks appendString:[NSString stringWithFormat:@"%@\n", sequence]];
    }
    [lineWithBreaks appendString:[NSString stringWithFormat:@"%@", input]];
    return lineWithBreaks;
}

- (NSString *)handle:(BOOL)wordBreak for:(NSString *)sequence {
    if (!wordBreak)
        return sequence;

    NSUInteger spacePosition = [sequence rangeOfString:@" " options:NSBackwardsSearch].location;
    if(spacePosition == NSNotFound)
        [NSException raise:@"WordLongerThanColumnWidthException" format:@"You cannot input word wider than column width when word break is true."];
    return [sequence substringToIndex:spacePosition + 1];
}

- (void)guardCondition_rejectTooNarrowColumnWidthFor:(int)width {
    if (width < 20)
        [NSException raise:@"ColumnWidthTooNarrowException" format:@"The column width must be at least 20."];
}
@end