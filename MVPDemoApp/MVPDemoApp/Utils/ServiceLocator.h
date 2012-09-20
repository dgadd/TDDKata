#import <Foundation/Foundation.h>

@class BasePresenter;
@class AppDelegate;

typedef enum {
    AppDelegateService,
    ViewControllerService
} ServiceType;

@interface ServiceLocator : NSObject
@property(nonatomic) ServiceType serviceType;

@property(nonatomic, strong) AppDelegate *appDelegate;

- (BasePresenter *)register:(ServiceType)serviceType;

- (id)initWithAppDelegate:(AppDelegate *)appDelegate;
@end