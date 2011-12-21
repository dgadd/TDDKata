#import "NSString+GZStringExtensionMethods.h"


@implementation NSString (GZStringExtensionMethods)
- (NSString *)stringWithLetterARemoved {
    NSMutableString *mutableString = [NSMutableString stringWithString:self];

    [mutableString replaceOccurrencesOfString:@"a" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutableString length])];

    return [NSString stringWithString:mutableString];
}
@end