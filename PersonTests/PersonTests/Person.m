#import "Person.h"


@implementation Person {

}

- (id)init {
    if (self = [super init]) {
        name = @"Person";
        age = [NSNumber numberWithInt:-1];
        gender = Male;
    }

    return self;
}

- (id)initWithName:(NSString *)_name {
    if (self = [super init]) {
        name = _name;
        age = [NSNumber numberWithInt:-1];
        gender = Male;
    }

    return self;
}

- (id)initWithAge:(NSNumber *)_age {
    if (self = [super init]) {
        name = @"Person";
        age = _age;
        gender = Male;
    }

    return self;
}

- (id)initWithGender:(Gender)_gender {
    if (self = [super init]) {
        name = @"Person";
        age = [NSNumber numberWithInt:-1];
        gender = _gender;
    }

    return self;
}

- (id)initWithName:(NSString *)_name age:(NSNumber *)_age gender:(Gender)_gender {
    if (self = [super init]) {
        name = _name;
        age = _age;
        gender = _gender;
    }

    return self;
}
@end