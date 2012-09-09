#import "StringUtils.h"


@implementation StringUtils {

}

- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width andWordBreak:(BOOL)wordBreak {
    [self guardCondition_widthLessThanTwentyIsNotAllowed:width];
    if(width == 0 || width > [input length])
        return input;


    NSMutableString *inputWithLineBreaks = [NSMutableString string];
    while ([input length] > width) {
        NSString *segment = [input substringToIndex:width];
        if (wordBreak) {
            NSInteger breakPosition = [segment rangeOfString:@" " options:NSBackwardsSearch].location;
            segment = [segment substringToIndex:breakPosition + 1];
        }
        input = [input stringByReplacingOccurrencesOfString:segment withString:@""];
        [inputWithLineBreaks appendString:[NSString stringWithFormat:@"%@\n", segment]];
    }
    [inputWithLineBreaks appendString:[NSString stringWithFormat:@"%@\n", input]];

    return inputWithLineBreaks;
}

- (void)guardCondition_widthLessThanTwentyIsNotAllowed:(int)width {
    if (width > 0  && width < 20)
        [NSException raise:@"ColumnWidthTooShortException" format:@"The column width cannot be less than 20."];
}
@end