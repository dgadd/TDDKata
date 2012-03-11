@protocol AVQuoteGatewayProtocol

@required

- (void) initiateConnection;
- (NSNumber *) retrieveQuoteFor: (NSString *)stockAbbreviation;

@end