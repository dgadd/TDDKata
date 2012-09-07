#import <Foundation/Foundation.h>

@interface NSString (StringUtils)
- (NSString *)wrapByColumnWidth:(NSInteger)width wordBreak:(BOOL)wordBreak;


@end