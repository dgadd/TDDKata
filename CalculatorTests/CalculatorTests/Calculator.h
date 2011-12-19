#import <Foundation/Foundation.h>

typedef enum {
    Add
} CalcOperationType;

@interface Calculator : NSObject
- (int)doOperation:(CalcOperationType)type onValue:(NSString *)numbersToOperate;
@end

