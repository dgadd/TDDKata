@protocol IAccountTransferView <NSObject>

@required
- (NSNumber *)getTransferAmount;
-(void)setDisplayMessage:(NSString *)message;
@end