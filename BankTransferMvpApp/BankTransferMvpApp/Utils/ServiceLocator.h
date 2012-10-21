#import <Foundation/Foundation.h>
#import "PresenterTypeEnum.h"

@class AccountTransferPresenter;


@interface ServiceLocator : NSObject
+ (id)register:(PresenterTypeEnum)presenterType;
@end