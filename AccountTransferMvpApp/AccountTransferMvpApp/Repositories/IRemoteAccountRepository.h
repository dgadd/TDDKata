@protocol IRemoteAccountRepository <NSObject>

@required
-(void) withdrawAmount:(NSNumber *)amount;

@end