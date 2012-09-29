#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimitersFor:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimitersFor:numbersToAdd];
    [self guardCondition_rejectDuplicateDelimitersFor:numbersToAdd];
    if([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (NSString *)handleCustomDelimitersFor:(NSString *)numbersToAdd {
    if([numbersToAdd hasPrefix:@"//"]) {
        NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbersToAdd substringFromIndex:4];
        numbersToAdd = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return numbersToAdd;
}

- (void)guardCondition_rejectDuplicateDelimitersFor:(NSString *)numbersToAdd {
    if([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters."];
}

- (NSString *)handleNewLineDelimitersFor:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSInteger total = 0;
    NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
    for (NSString *numberString in numbersArray)
            total += [numberString integerValue];
    return total;
}
@end