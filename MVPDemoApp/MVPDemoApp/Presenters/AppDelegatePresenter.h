#import <Foundation/Foundation.h>
#import "BasePresenter.h"

@protocol IAppDelegateTabRepository;
@protocol IExternalAdvertisementManagerRepository;


@interface AppDelegatePresenter : BasePresenter

@property(nonatomic, strong) id<IAppDelegateTabRepository> appDelegateTabRepository;
@property(nonatomic, strong) id<IExternalAdvertisementManagerRepository> externalAdvertisementManagerRepository;

- (id)initWithTabRepository:(id <IAppDelegateTabRepository>)appDelegateTabRepository
    andAdvertisementManager:(id <IExternalAdvertisementManagerRepository>)externalAdvertisementManagerRepository;

- (void)applicationSetup;

@end