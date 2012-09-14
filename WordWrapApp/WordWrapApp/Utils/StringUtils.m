#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width withWordBreak:(BOOL)wordBreak {
    if(width == 0)
        return input;
    if(width < 20)
        [NSException raise:@"ColumnWidthTooNarrowException" format:@"You must input a column width > 20."];

    NSMutableString *lineWithBreaks = [NSMutableString string];
    while ([input length] > width) {
        NSString *sequence = [input substringToIndex:width];
        if(wordBreak)
            sequence = [self handleWordBreakFor:sequence];
            
        input = [input stringByReplacingOccurrencesOfString:sequence withString:@""];
        [lineWithBreaks appendString:[NSString stringWithFormat:@"%@\n", sequence]];
    }
    [lineWithBreaks appendString:input];

    return lineWithBreaks;
}

- (NSString *)handleWordBreakFor:(NSString *)sequence {
    NSUInteger lastSpaceIndex = [sequence rangeOfString:@" " options:NSBackwardsSearch].location;
    return [sequence substringToIndex:lastSpaceIndex + 1];
}
@end