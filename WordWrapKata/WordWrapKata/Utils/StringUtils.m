#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width withWordBreak:(BOOL)wordBreak {
    if(width == 0)
        return input;
    if (width < 20)
        [NSException raise:@"ColumnWidthTooNarrowException" format:@"The column width cannot be less than 20."];

    NSMutableString *lineWithBreaks = [NSMutableString string];
    while ([input length] > width) {
        NSString *sequence = [input substringToIndex:width];
        if(wordBreak)
            sequence = [self trimToWordSpaceThis:sequence];

        input = [input stringByReplacingOccurrencesOfString:sequence withString:@""];
        [lineWithBreaks appendString:[NSString stringWithFormat:@"%@\n",sequence]];
    }
    [lineWithBreaks appendString:[NSString stringWithFormat:@"%@",input]];
    return lineWithBreaks;
}

- (NSString *)trimToWordSpaceThis:(NSString *)sequence {
    NSUInteger finalSpacePosition = [sequence rangeOfString:@" " options:NSBackwardsSearch].location;
    if (finalSpacePosition != NSNotFound)
                sequence = [sequence substringToIndex:finalSpacePosition + 1];
    return sequence;
}
@end