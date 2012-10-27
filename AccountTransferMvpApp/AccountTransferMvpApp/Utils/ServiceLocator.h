#import <Foundation/Foundation.h>
#import "PresenterTypeEnum.h"


@interface ServiceLocator : NSObject
+ (id)resolve:(PresenterTypeEnum)presenterTypeEnum;
@end