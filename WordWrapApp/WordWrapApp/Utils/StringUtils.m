#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width {
    if(width == 0)
        return input;

    NSMutableString *inputWithLineBreaks = [NSMutableString string];
    while ([input length] > width) {
        NSString *segment = [input substringToIndex:width];
        input = [input stringByReplacingOccurrencesOfString:segment withString:@""];
        [inputWithLineBreaks appendString:[NSString stringWithFormat:@"%@\n", segment]];
    }
    [inputWithLineBreaks appendString:[NSString stringWithFormat:@"%@\n", input]];

    return inputWithLineBreaks;
}
@end