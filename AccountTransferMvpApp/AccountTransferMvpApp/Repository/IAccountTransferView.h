@protocol IAccountTransferView <NSObject>

@required
-(NSNumber *)getTransferAmount;
-(void)setTransferMessage:(NSString *)message;
@end