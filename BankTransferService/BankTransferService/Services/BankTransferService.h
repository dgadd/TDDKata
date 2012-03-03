#import <Foundation/Foundation.h>


@interface BankTransferService : NSObject
- (void)authenticateWithUsername:(NSString *)username password:(NSString *)password;
@end