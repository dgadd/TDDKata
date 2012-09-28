#import <Foundation/Foundation.h>

@interface NSString (KataUtils)

- (NSString *)wrapLineByColumnWidth:(int)width andWordBreak:(BOOL)wordBreak;
@end