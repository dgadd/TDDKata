#import <Foundation/Foundation.h>


@interface StringManipulator : NSObject
- (NSString *)lineWrap:(NSString *)input byColumnWidth:(int)width;
@end