#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width andWordBreak:(BOOL)wordBreak {
    if(width == 0)
        return input;
    [self guardCondition_rejectTooNarrow:width];

    NSMutableString *lineWithBreaks = [NSMutableString string];
    while ([input length] > width) {
        NSString *sequence = [input substringToIndex:width];
        if(wordBreak) {
            NSUInteger wordSpacePosition = [sequence rangeOfString:@" " options:NSBackwardsSearch].location;
            [self guardCondition_rejectTooLargeWordsWithout:wordSpacePosition];
            sequence = [sequence substringToIndex:wordSpacePosition + 1];
        }
        input = [input stringByReplacingOccurrencesOfString:sequence withString:@""];
        [lineWithBreaks appendString:[NSString stringWithFormat:@"%@\n", sequence]];
    }
    [lineWithBreaks appendString:[NSString stringWithFormat:@"%@", input]];
    return lineWithBreaks;
}

- (void)guardCondition_rejectTooLargeWordsWithout:(NSUInteger)wordSpacePosition {
    if(wordSpacePosition == NSNotFound)
        [NSException raise:@"WordTooLargeForWordBreakException" format:@"When word break is true, words cannot be wider than column width."];
}

- (void)guardCondition_rejectTooNarrow:(int)width {
    if (width < 20)
        [NSException raise:@"ColumnWidthTooNarrowException" format:@"The column width must be at least 20."];
}
@end