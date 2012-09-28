#import "NSString+KataUtils.h"
#import "StringUtils.h"


@implementation NSString (KataUtils)
- (NSString *)wrapLineByColumnWidth:(int)width andWordBreak:(BOOL)wordBreak {
    StringUtils *stringUtils = [[StringUtils alloc] init];
    return [stringUtils wrapLine:self byColumnWidth:width andWordBreak:wordBreak];
}
@end