#import <Foundation/Foundation.h>

@protocol IAppDelegateTabRepository;


@interface AppDelegatePresenter : NSObject
- (id)initWithTabRepository:(id <IAppDelegateTabRepository>)appDelegateTabRepository;

- (void)configureControllersAtRoot;
@end