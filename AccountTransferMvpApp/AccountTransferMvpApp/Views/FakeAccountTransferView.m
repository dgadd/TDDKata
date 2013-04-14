#import "IAccountTransferView.h"
#import "FakeAccountTransferView.h"


@implementation FakeAccountTransferView {

@private
    NSString *_displayMessage;
}
@synthesize displayMessage = _displayMessage;

- (NSNumber *)getTransferAmount {
    return @2.50;
}

- (void)setDisplayMessage:(NSString *)message {
    _displayMessage = message;
}

@end