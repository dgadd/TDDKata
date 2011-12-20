#import "Teacher.h"


@implementation Teacher {

}
- (id)initWithName:(NSString *)_name age:(NSNumber *)_age gender:(Gender)_gender classes:(NSArray *)_classes salary:(NSNumber *)_salary areaOfExpertise:(NSString *)_areaOfExpertise {
    if (self = [super init]) {
        name = _name;
        age = _age;
        gender = _gender;
        classes = _classes;
        salary = _salary;
        areaOfExpertise = _areaOfExpertise;
    }

    return self;

}


@end