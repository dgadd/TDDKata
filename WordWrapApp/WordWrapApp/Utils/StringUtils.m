#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width {
    if (width == 0)
        return input;
    [self guardCondition_rejectTooNarrow:width];

    NSMutableString *lineWithBreaks = [NSMutableString string];
    while ([input length] > width)
        input = [self migrate:input by:width into:lineWithBreaks];

    [lineWithBreaks appendString:[NSString stringWithFormat:@"%@",input]];
    return lineWithBreaks;
}

- (void)guardCondition_rejectTooNarrow:(int)width {
    if (width < 20)
        [NSException raise:@"ColumnWidthTooNarrowException" format:@"The column width must be at least 20."];
}

- (NSString *)migrate:(NSString *)input by:(int)width into:(NSMutableString *)lineWithBreaks {
    NSString *sequence = [input substringToIndex:width];
    [lineWithBreaks appendString:[NSString stringWithFormat:@"%@\n",sequence]];
    input = [input stringByReplacingOccurrencesOfString:sequence withString:@""];
    return input;
}
@end