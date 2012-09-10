#import "AppDelegatePresenter.h"
#import "IAppDelegateTabRepository.h"


@implementation AppDelegatePresenter {

}
@synthesize appDelegateTabRepository = _appDelegateTabRepository;


- (id)initWithTabRepository:(id <IAppDelegateTabRepository>)appDelegateTabRepository {
    if (self = [super init]) {
        _appDelegateTabRepository = appDelegateTabRepository;
    }

    return self;
}

- (void)configureControllersAtRoot {
    [_appDelegateTabRepository configureControllersAtRoot];
}
@end