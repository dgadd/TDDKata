#import <Foundation/Foundation.h>

@interface NSString (KataUtils)

- (NSString *)wrapLineByColumnWidth:(int)width withWordBreak:(BOOL)wordBreak;
@end