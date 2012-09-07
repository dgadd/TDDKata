#import "StringManipulator.h"


@implementation StringManipulator {

}

- (NSString *)wrapText:(NSString *)inputText byColumnWidth:(NSInteger)width {
    if (width == 0)
        return inputText;

    NSMutableString *versionWithLineBreaks = [NSMutableString string];
    if(width > 19) {
        while ([inputText length] > width) {
            NSString *segment = [inputText substringToIndex:width];
            [versionWithLineBreaks appendString:[NSString stringWithFormat:@"%@\n", segment]];
            inputText = [inputText stringByReplacingOccurrencesOfString:segment withString:@""];
        }
        [versionWithLineBreaks appendString:[NSString stringWithFormat:@"%@", inputText]];
    }
    return versionWithLineBreaks;
}
@end