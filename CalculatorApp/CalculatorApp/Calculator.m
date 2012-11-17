#import "Calculator.h"


@implementation Calculator {

}

- (NSInteger)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiterIn:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimitersIn:numbersToAdd];
    [self guardCondition_rejectDuplicateDelimitersIn:numbersToAdd];
    if([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];

    return [numbersToAdd length] > 0 ? [numbersToAdd integerValue] : 0;
}

- (NSString *)handleCustomDelimiterIn:(NSString *)numbersToAdd {
    if([numbersToAdd hasPrefix:@"//"]) {
        NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbersToAdd substringFromIndex:4];
        numbersToAdd = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return numbersToAdd;
}

- (void)guardCondition_rejectDuplicateDelimitersIn:(NSString *)numbersToAdd {
    if([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@""];
}

- (NSString *)handleNewLineDelimitersIn:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (NSInteger)sum:(NSString *)numbersToAdd {
    NSInteger total = 0;
    NSArray *array = [numbersToAdd componentsSeparatedByString:@","];
    for(NSString *numberString in array)
            total += [numberString integerValue];
    return total;
}
@end