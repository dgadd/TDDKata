#import <Foundation/Foundation.h>

@interface NSString (NSStringCategoryMethods)

- (NSString *)wrapLineByColumnWidth:(int)width withWordBreak:(BOOL)wordBreak;
@end