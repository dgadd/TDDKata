#import "NSString+NSStringCategoryMethods.h"
#import "StringUtils.h"


@implementation NSString (NSStringCategoryMethods)

- (NSString *)wrapLineByColumnWidth:(int)width withWordBreak:(BOOL)wordBreak {
    StringUtils *utils = [[StringUtils alloc] init];
    return [utils wrapLine:self byColumnWidth:width withWordBreak:wordBreak];
}
@end