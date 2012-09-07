#import "StringManipulator.h"


@implementation StringManipulator {

}

- (NSString *)wrapText:(NSString *)inputText byColumnWidth:(int)width breakWhere:(BOOL)atWordBoundaries {
    if (width == 0)
        return inputText;

    NSMutableString *versionWithLineBreaks = [NSMutableString string];
    if(width > 19) {
        while ([inputText length] > width) {
            NSString *segment = [inputText substringToIndex:width];
            if (atWordBoundaries) {
                NSInteger lastIndexOf = [segment rangeOfString:@" " options:NSBackwardsSearch].location;
                segment = [segment substringToIndex:lastIndexOf + 1];
            }
            [versionWithLineBreaks appendString:[NSString stringWithFormat:@"%@\n", segment]];
            inputText = [inputText stringByReplacingOccurrencesOfString:segment withString:@""];
        }
        [versionWithLineBreaks appendString:[NSString stringWithFormat:@"%@", inputText]];
    }
    return versionWithLineBreaks;
}
@end