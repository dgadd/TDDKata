@protocol AVQuoteServiceProtocol

@required

- (void)initiateConnection;
- (double)callDowJonesForQuote:(NSString *)stockTitle;
@end