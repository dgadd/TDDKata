#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width {
    if(width == 0)
        return input;
    if(width < 20)
        [NSException raise:@"ColumnWidthTooNarrowException" format:@"You cannot input a column width < 20 (unless 0)."];

    NSMutableString *lineWithBreaks = [NSMutableString string];
    while ([input length] > width) {
        NSString *sequence = [input substringToIndex:width];
        input = [input stringByReplacingOccurrencesOfString:sequence withString:@""];
        [lineWithBreaks appendString:[NSString stringWithFormat:@"%@\n",sequence]];
    }
    [lineWithBreaks appendString:[NSString stringWithFormat:@"%@",input]];
    return lineWithBreaks;
}
@end