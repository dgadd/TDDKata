#import <Foundation/Foundation.h>
#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSArray *const numbersArray = [numbersToAdd componentsSeparatedByString:@","];
    int total = 0;
    for (NSString *numberString in numbersArray) {
            total += [numberString integerValue];
        }
    return total;
}

- (NSString *)handleNewLineDelimiter:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (void)guardCondition_rejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters."];
}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleNewLineDelimiter:numbersToAdd];
    [self guardCondition_rejectDuplicateDelimiters:numbersToAdd];
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}
@end