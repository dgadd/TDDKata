//
//  Created by dgadd on 11-12-12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Calculator.h"


@implementation Calculator {

}

- (int)add:(NSString *)numbersToAdd {
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end