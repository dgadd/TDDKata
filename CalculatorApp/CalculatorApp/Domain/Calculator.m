#import <Foundation/Foundation.h>
#import "Calculator.h"


@interface Calculator ()
- (NSString *)handleNewLineDelimiters:(NSString *)numbersToAdd;

- (void)guardCondition_rejectDuplicateDelimiters:(NSString *)numbersToAdd;

- (NSString *)handleCustomDelimiter:(NSString *)numbersToAdd;

- (int)sum:(NSString *)numbersToAdd;

@end

@implementation Calculator {

}


- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiter:numbersToAdd];
    numbersToAdd = [self handleNewLineDelimiters:numbersToAdd];
    [self guardCondition_rejectDuplicateDelimiters:numbersToAdd];
    if ([numbersToAdd rangeOfString:@","].location != NSNotFound)
        return [self sum:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}


- (int)sum:(NSString *)numbersToAdd {
    NSArray *const array = [numbersToAdd componentsSeparatedByString:@","];
    int total = 0;
    for (NSString *numberString in array) {
        total += [numberString intValue];
    }
    return total;
}


- (NSString *)handleNewLineDelimiters:(NSString *)numbersToAdd {
    numbersToAdd = [numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
    return numbersToAdd;
}

- (void)guardCondition_rejectDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([numbersToAdd rangeOfString:@",,"].location != NSNotFound)
        [NSException raise:@"DuplicateDelimitersException" format:@""];
}

- (NSString *)handleCustomDelimiter:(NSString *)numbersToAdd {
    if ([numbersToAdd hasPrefix:@"//"]) {
        NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
        NSString *suffix = [numbersToAdd substringWithRange:NSMakeRange(4, [numbersToAdd length] - 4)];
        numbersToAdd = [suffix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return numbersToAdd;
}

@end