#import <Foundation/Foundation.h>

@interface NSString (StringExtensions)

- (NSString *)wrapLineByColumnWidth:(int)width andWordBreak:(BOOL)wordBreak;
@end