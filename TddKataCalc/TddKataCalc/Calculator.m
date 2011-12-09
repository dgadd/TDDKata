//
//  Created by dgadd on 11-12-07.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Calculator.h"


@implementation Calculator {

}

- (BOOL)containsWithin:(NSString *)thisString theFollowing:(NSString *)value {
    return [thisString rangeOfString:value].location != NSNotFound;
}

- (int)sumOf:(NSString *)numbersToAdd {
        int total = 0;
        NSArray *numbersArray = [numbersToAdd componentsSeparatedByString:@","];
        NSMutableString *negativeNumbers = [NSMutableString string];
        for(NSString *numberString in numbersArray)
        {
            int number = [numberString intValue];
            if (number < 0)
                [negativeNumbers appendString:[NSString stringWithFormat:@"%i,",number]];;
            total += number;
        }
        if ([negativeNumbers length] > 0)
                [NSException raise:@"Negative numbers" format:@"You cannot use negative numbers: %d", negativeNumbers];
        return total;
    }

- (void)handleDuplicateDelimiters:(NSString **)numbersToAdd {
    (*numbersToAdd) = [*numbersToAdd stringByReplacingOccurrencesOfString:@"\n" withString:@","];
}

- (void)guardCondition_HandleDuplicateDelimiters:(NSString *)numbersToAdd {
    if ([self containsWithin:numbersToAdd theFollowing:@",,"])
        [NSException raise:@"Duplicate delimiters" format:@"You cannot use duplicate delimiters"];
}

- (NSString *)handleCustomDelimiter:(NSString *)numbersToAdd {
    if ([numbersToAdd hasPrefix:@"//"])
    {
        NSString *customDelimiter = [numbersToAdd substringWithRange:NSMakeRange(2, 1)];
        int inputLength = [numbersToAdd length];
        NSString *numbersToAddWithoutPrefix = [numbersToAdd substringWithRange:NSMakeRange(4, inputLength-4)];
        numbersToAdd = [numbersToAddWithoutPrefix stringByReplacingOccurrencesOfString:customDelimiter withString:@","];
    }
    return numbersToAdd;
}

- (int)add:(NSString *)numbersToAdd {
    numbersToAdd = [self handleCustomDelimiter:numbersToAdd];
    [self handleDuplicateDelimiters:&numbersToAdd];
    [self guardCondition_HandleDuplicateDelimiters:numbersToAdd];
    if ([self containsWithin:numbersToAdd theFollowing:@","])
        return [self sumOf:numbersToAdd];
    return [numbersToAdd length] > 0 ? [numbersToAdd intValue] : 0;
}
@end