#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleNewLineDelimitersIn:numbersToAdd];
    [self guardCondition_handleDuplicateDelimitersIn:numbersToAdd];
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (void)guardCondition_handleDuplicateDelimitersIn:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@""];
}

- (NSString *)handleNewLineDelimitersIn:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSInteger total = 0;
    NSArray *array = [numbersToAdd componentsSeparatedByString:@","];
    for (NSString *numberString in array) {
        NSInteger number = [numberString integerValue];
        if (number < 1001)
            total += number;
    }
    return total;
}
@end