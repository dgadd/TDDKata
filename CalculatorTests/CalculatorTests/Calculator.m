#import "Calculator.h"


@implementation Calculator {

}

- (int)doOperation:(CalcOperationType)type onValue:(NSString *)numbersToOperate {
    switch (type) {
        case Add:
            return [numbersToOperate length] > 0 ? [numbersToOperate intValue] : 0;
            break;
    }
}
@end