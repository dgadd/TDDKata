#import <net-snmp/library/snmp_client.h>
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


- (NSString *)description {
    switch (gender) {
        case Male:
            return [NSString stringWithFormat:@"Hi! I am a man, named %@, who is %@ years old", name, age];
            break;
        case Female:
            return [NSString stringWithFormat:@"Hi! I am a woman, named %@, who is %@ years old", name, age];
            break;
        default:
            [NSException raise:@"MissingEnumValueException" format:@"You must use an existing enum value."];
    }
}
@end