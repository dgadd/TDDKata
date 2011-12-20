#import "Student.h"


@implementation Student {

}
- (id)initWithName:(NSString *)_name age:(NSNumber *)_age gender:(Gender)_gender classes:(NSArray *)_classes numberOfCredits:(NSNumber *)_numberOfCredits major:(NSString *)_major {
    if (self = [super init]) {
        name = _name;
        age = _age;
        gender = _gender;
        classes = _classes;
        numberOfCredits = _numberOfCredits;
        major = _major;
    }

    return self;


}


@end