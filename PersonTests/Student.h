#import <Foundation/Foundation.h>
#import "Person.h"


@interface Student : NSObject {
    NSArray *classes;
    NSNumber *numberOfCredits;
    NSString *major;
}

- (id)initWithName:(NSString *)_name
               age:(NSNumber *)_age
            gender:(Gender)_gender
           classes:(NSArray *)_classes
   numberOfCredits:(NSNumber *)_numberOfCredits
             major:(NSString *)_major;


@end