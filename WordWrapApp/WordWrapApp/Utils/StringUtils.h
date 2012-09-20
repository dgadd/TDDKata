#import <Foundation/Foundation.h>


@interface StringUtils : NSObject
- (NSString *)wrapLine:(NSString *)input byColumnWidth:(int)width;
@end