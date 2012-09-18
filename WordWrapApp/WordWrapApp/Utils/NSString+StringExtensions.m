#import "NSString+StringExtensions.h"
#import "StringUtils.h"


@implementation NSString (StringExtensions)
- (NSString *)wrapLineByColumnWidth:(int)width withWordBreak:(BOOL)wordBreak {
    StringUtils *stringUtils = [[StringUtils alloc] init];
    return [stringUtils wrapLine:self byColumnWidth:width withWordBreak:wordBreak];
}
@end