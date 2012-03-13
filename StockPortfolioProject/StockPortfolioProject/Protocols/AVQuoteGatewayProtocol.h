@protocol AVQuoteGatewayProtocol<NSObject>

@required

- (void) initiateConnection;
- (NSNumber *) retrieveQuoteFor: (NSString *)stockAbbreviation;

@end