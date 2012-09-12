#import <Foundation/Foundation.h>

@class BasePresenter;

typedef enum {
    AppDelegateService,
    ViewControllerService
} ServiceType;

@interface ServiceLocator : NSObject
@property(nonatomic) ServiceType serviceType;


@property(nonatomic, strong) UIWindow *window;

@property(nonatomic, strong) UITabBarController *tabBarController;

- (BasePresenter *)register:(ServiceType)serviceType;

- (id)initWithWindow:(UIWindow *)window andTabBarController:(UITabBarController *)tabBarController;
@end