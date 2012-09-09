#import "NSString+StringExtensions.h"


@implementation NSString (StringExtensions)
- (NSString *)wrapLineByColumnWidth:(int)width andWordBreak:(BOOL)wordBreak {
    NSString *input = self;
    [self guardCondition_widthLessThanTwentyIsNotAllowed:width];
    if(width == 0 || width > [input length])
        return input;


    NSMutableString *inputWithLineBreaks = [NSMutableString string];
    while ([input length] > width) {
        NSString *segment = [input substringToIndex:width];
        segment = [self guardCondition_handleWordBreaksOn:segment ifWordBreak:wordBreak];
        input = [input stringByReplacingOccurrencesOfString:segment withString:@""];
        [inputWithLineBreaks appendString:[NSString stringWithFormat:@"%@\n", segment]];
    }
    [inputWithLineBreaks appendString:[NSString stringWithFormat:@"%@\n", input]];

    return inputWithLineBreaks;
}

- (NSString *)guardCondition_handleWordBreaksOn:(NSString *)segment ifWordBreak:(BOOL)wordBreak {
    if (wordBreak) {
        NSInteger breakPosition = [segment rangeOfString:@" " options:NSBackwardsSearch].location;
        if (breakPosition == NSNotFound)
            [NSException raise:@"WordsLongerThanWordBreakWidthException" format:@"The word %@ is longer than word break width.", segment];
        return [segment substringToIndex:breakPosition + 1];
    }
    return segment;
}

- (void)guardCondition_widthLessThanTwentyIsNotAllowed:(int)width {
    if (width > 0  && width < 20)
        [NSException raise:@"ColumnWidthTooShortException" format:@"The column width cannot be less than 20."];
}
@end