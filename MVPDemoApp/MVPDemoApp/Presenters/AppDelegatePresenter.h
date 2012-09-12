#import <Foundation/Foundation.h>
#import "BasePresenter.h"

@protocol IAppDelegateTabRepository;


@interface AppDelegatePresenter : BasePresenter

@property(nonatomic, strong) id<IAppDelegateTabRepository> appDelegateTabRepository;

- (id)initWithTabRepository:(id <IAppDelegateTabRepository>)appDelegateTabRepository;

- (void)configureControllersAtRoot;
@end