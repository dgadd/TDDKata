@protocol IRemoteAccountRepository <NSObject>

@required
-(void)transferFromAmount:(NSNumber *)amount;
@end