#import <Foundation/Foundation.h>
#import "PresenterTypesEnum.h"


@interface ServiceLocator : NSObject
+ (id)resolve:(PresenterTypesEnum)presenterTypeEnum;
@end