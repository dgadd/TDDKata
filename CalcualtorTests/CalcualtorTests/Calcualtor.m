#import "Calcualtor.h"


@implementation Calcualtor {

}

- (int)add:(NSString *)numbersToAdd {
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end