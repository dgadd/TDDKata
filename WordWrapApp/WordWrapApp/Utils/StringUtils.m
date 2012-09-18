#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width withWordBreak:(BOOL)wordBreak {
    if(width == 0)
        return input;
    [self guardCondition_rejectNarrowColumnWidthFor:width];

    NSMutableString *lineWithBreaks = [NSMutableString string];
    while ([input length] > width) {
        NSString *sequence = [input substringToIndex:width];
        if(wordBreak)
            sequence = [self handleWordBreaksIn:sequence];
        input = [input stringByReplacingOccurrencesOfString:sequence withString:@""];
        [lineWithBreaks appendString:[NSString stringWithFormat:@"%@\n",sequence]];
    }
    [lineWithBreaks appendString:[NSString stringWithFormat:@"%@",input]];
    return lineWithBreaks;
}

- (void)guardCondition_rejectNarrowColumnWidthFor:(int)width {
    if(width < 20)
        [NSException raise:@"ColumnWidthTooNarrowException" format:@"You cannot input a column width < 20 (unless 0)."];
}

- (NSString *)handleWordBreaksIn:(NSString *)sequence {
    NSUInteger lastSpaceInSequence = [sequence rangeOfString:@" " options:NSBackwardsSearch].location;
    if (lastSpaceInSequence != NSNotFound)
                sequence = [sequence substringToIndex:lastSpaceInSequence + 1];
    return sequence;
}
@end