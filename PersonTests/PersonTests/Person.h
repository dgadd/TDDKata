#import <Foundation/Foundation.h>

typedef enum {
    Male, Female
} Gender;

@interface Person : NSObject {
    NSString *name;
    NSNumber *age;
    Gender gender;
}

- (id)initWithName:(NSString *)_name;

- (id)initWithAge:(NSNumber *)_age;

- (id)initWithGender:(Gender)_gender;

- (id)initWithName:(NSString *)_name
               age:(NSNumber *)_age
            gender:(Gender)_gender;

@end