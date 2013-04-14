#import <Foundation/Foundation.h>
#import "IAccountTransferView.h"


@interface FakeAccountTransferView : NSObject <IAccountTransferView>
@property(nonatomic, copy) NSString *displayMessage;
@end