@protocol AVQuoteGatewayProtocol

@required

- (void) initiateConnection;
- (double) retrieveQuoteFor: (NSString *)stockAbbreviation;

@end