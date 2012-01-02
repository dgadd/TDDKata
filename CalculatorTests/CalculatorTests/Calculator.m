#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)contains:(NSString *)numbersToAdd theFollowing:(NSString *)value {
    return [numbersToAdd rangeOfString:value].location != NSNotFound;
}

- (int)sum:(NSString *)numbersToAdd {
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        int total = 0;
        for(NSString *numberString in numbersArray)
            total += [numberString intValue];
        return total;
    }

- (NSString *)handleNewLineDelimiter:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (NSString *)handleCustomDelimiters:(NSString *)input {
    if ([input hasPrefix:@"//"])
    {
        NSString *customDelimiter = [input substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [input substringWithRange:NSMakeRange(4, [input length]-4)];
        input = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return input;
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiters:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiter:numbersToAdd];
    if ([self contains:numbersToAdd theFollowing:@",,"])
        [NSException raise:@"DuplicateDelimitersException" format:@"You cannot input duplicate delimiters"];
    if ([self contains:numbersToAdd theFollowing:@","])
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end