#import <Foundation/Foundation.h>
#import "PresenterTypeEnum.h"


@interface ServiceLocator : NSObject
+ (id)register:(PresenterTypeEnum)presenterTypeEnum;
@end