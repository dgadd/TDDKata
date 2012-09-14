#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width {
    if(width == 0)
        return input;

    NSMutableString *lineWithBreaks = [NSMutableString string];
    while ([input length] > width) {
        NSString *sequence = [input substringToIndex:width];
        input = [input stringByReplacingOccurrencesOfString:sequence withString:@""];
        [lineWithBreaks appendString:[NSString stringWithFormat:@"%@\n", sequence]];
    }
    [lineWithBreaks appendString:input];

    return lineWithBreaks;
}
@end