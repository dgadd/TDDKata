#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width {
    if(width == 0)
        return input;
    [self guardCondition_rejectTooNarrow:width];

    NSMutableString *lineWithBreaks = [NSMutableString string];
    while ([input length] > width) {
        NSString *sequence = [input substringToIndex:width];
        input = [input stringByReplacingOccurrencesOfString:sequence withString:@""];
        [lineWithBreaks appendString:[NSString stringWithFormat:@"%@\n", sequence]];
    }
    [lineWithBreaks appendString:[NSString stringWithFormat:@"%@", input]];
    return lineWithBreaks;
}

- (void)guardCondition_rejectTooNarrow:(int)width {
    if (width < 20)
        [NSException raise:@"ColumnWidthTooNarrowException" format:@"The column width must be at least 20."];
}
@end