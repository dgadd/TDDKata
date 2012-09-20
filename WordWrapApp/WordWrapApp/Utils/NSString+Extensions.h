#import <Foundation/Foundation.h>

@interface NSString (Extensions)

- (NSString *)wrapLineByColumnWidth:(int)width withWordBreak:(BOOL)wordBreak;
@end