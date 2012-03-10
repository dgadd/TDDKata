@protocol AVQuoteGatewayProtocol

@required

- (void)initiateConnection;
- (double)callDowJonesForQuote:(NSString *)stockTitle;
@end