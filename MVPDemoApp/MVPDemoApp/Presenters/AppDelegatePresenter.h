#import <Foundation/Foundation.h>

@protocol IAppDelegateTabRepository;


@interface AppDelegatePresenter : NSObject

@property(nonatomic, strong) id<IAppDelegateTabRepository> appDelegateTabRepository;

- (id)initWithTabRepository:(id <IAppDelegateTabRepository>)appDelegateTabRepository;

- (void)configureControllersAtRoot;
@end