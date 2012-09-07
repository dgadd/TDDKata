#import "NSString+StringUtils.h"


@implementation NSString (StringUtils)

- (NSString *)wrapByColumnWidth:(NSInteger)width wordBreak:(BOOL)wordBreak {
    if (width == 0)
        return self;

    [self guardCondition_columnWidthMustBeAtLeast20:width];
    NSMutableString *versionWithLineBreaks = [NSMutableString string];

    NSString *inputText = self;

    while ([inputText length] > width) {
        NSString *segment = [inputText substringToIndex:width];
        if (wordBreak) {
            NSInteger lastIndexOf = [segment rangeOfString:@" " options:NSBackwardsSearch].location;
            if(lastIndexOf == NSNotFound) {
                [self guardCondition_wordLengthMustNotExceedColumnWidth];
            } else {
                segment = [segment substringToIndex:lastIndexOf + 1];
                [self validate:width ofWordLengthsIn:segment];
            }
        }
        [versionWithLineBreaks appendString:[NSString stringWithFormat:@"%@\n", segment]];
        inputText = [inputText stringByReplacingOccurrencesOfString:segment withString:@""];
    }
    [versionWithLineBreaks appendString:[NSString stringWithFormat:@"%@", inputText]];

    return versionWithLineBreaks;
}

- (void)validate:(NSInteger)width ofWordLengthsIn:(NSString *)segment {
    NSArray *wordsInSegment = [segment componentsSeparatedByString:@" "];
    for(NSString *word in wordsInSegment)
                    if ([word length] > width)
                        [self guardCondition_wordLengthMustNotExceedColumnWidth];
}

- (void)guardCondition_wordLengthMustNotExceedColumnWidth {
    [NSException raise:@"WordLengthGreaterThanWordBreakException" format:@"Words greater width than column width cannot word break."];
}

- (void)guardCondition_columnWidthMustBeAtLeast20:(NSInteger)width {
    if (width < 20)
        [NSException raise:@"ColumnWidthTooNarrowException" format:@"Column width must be at least 20."];
}
@end