#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWdith:(int)width {
    if (width == 0)
    return input;

    NSMutableString *lineWithBreaks = [NSMutableString string];
    while ([input length] > width)
        input = [self migrate:input by:width into:lineWithBreaks];

    [lineWithBreaks appendString:[NSString stringWithFormat:@"%@",input]];
    return lineWithBreaks;
}

- (NSString *)migrate:(NSString *)input by:(int)width into:(NSMutableString *)lineWithBreaks {
    NSString *sequence = [input substringToIndex:width];
    [lineWithBreaks appendString:[NSString stringWithFormat:@"%@\n",sequence]];
    input = [input stringByReplacingOccurrencesOfString:sequence withString:@""];
    return input;
}
@end