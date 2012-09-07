#import <Foundation/Foundation.h>


@interface StringManipulator : NSObject
- (NSString *)wrapText:(NSString *)inputText byColumnWidth:(NSInteger)width;
@end