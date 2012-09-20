#import "NSString+Extensions.h"
#import "StringUtils.h"


@implementation NSString (Extensions)
- (NSString *)wrapLineByColumnWidth:(int)width withWordBreak:(BOOL)wordBreak {
    StringUtils *stringUtils = [[StringUtils alloc] init];
    return [stringUtils wrapLine:self byColumnWidth:width withWordBreak:wordBreak];
}
@end