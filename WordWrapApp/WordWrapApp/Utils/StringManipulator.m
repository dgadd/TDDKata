#import "StringManipulator.h"


@implementation StringManipulator {

}

- (NSString *)lineWrap:(NSString *)input byColumnWidth:(int)width withWordBreak:(BOOL) wordBreak {
    if (width == 0)
        return input;

    if (width > 19)
    {
        NSMutableString *inputWithLineBreaks = [NSMutableString string];
        while ([input length] > width) {
            NSString *segment = [input substringToIndex:width];
            NSUInteger wordSpace = [segment rangeOfString:@" " options:NSBackwardsSearch].location;
            if (wordSpace != NSNotFound)
                segment = [segment substringToIndex:wordSpace + 1];

            [inputWithLineBreaks appendString:[NSString stringWithFormat:@"%@\n", segment]];
            input = [input stringByReplacingOccurrencesOfString:segment withString:@""];
        }
        [inputWithLineBreaks appendString:[NSString stringWithFormat:@"%@\n", input]];
        return inputWithLineBreaks;
    }
}
@end