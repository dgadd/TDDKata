#import <Foundation/Foundation.h>
#import "PresenterTypeEnum.h"

@class AppLaunchPresenter;


@interface ServiceLocator : NSObject
+ (AppLaunchPresenter *)register:(PresenterTypeEnum)presenterType;
@end