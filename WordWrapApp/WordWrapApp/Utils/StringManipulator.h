#import <Foundation/Foundation.h>


@interface StringManipulator : NSObject

- (NSString *)wrapText:(NSString *)inputText byColumnWidth:(int)width breakWhere:(BOOL)atWordBoundaries;
@end