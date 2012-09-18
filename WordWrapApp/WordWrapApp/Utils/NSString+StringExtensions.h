#import <Foundation/Foundation.h>

@interface NSString (StringExtensions)

- (NSString *)wrapLineByColumnWidth:(int)width withWordBreak:(BOOL)wordBreak;
@end