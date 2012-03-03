#import "MoneyTests.h"
#import "Money.h"

@implementation MoneyTests

- (void)setUp {
    [super setUp];
}

- (void)testInitWithAmountAndCurrency_AmountAndCurrencyInputs_PropertiesMatchInits {
    NSDecimalNumber *amount = [NSDecimalNumber decimalNumberWithMantissa:352 exponent:2 isNegative:FALSE];
    NSString *currency = @"CDN";

    Money *sut = [[Money alloc] initWithAmount:amount andCurrency:currency];

    STAssertEqualObjects(amount, sut.amount, @"Amount property should match assigned value.");
    STAssertEquals(currency, sut.currency, @"Currency property should match assigned value.");
}

- (void)testTwoInstances_SameAmountAndCurrencyInputs_AreEqual {
    NSDecimalNumber *amount = [NSDecimalNumber decimalNumberWithMantissa:352 exponent:2 isNegative:FALSE];
    NSString *currency = @"CDN";

    Money *sut = [[Money alloc] initWithAmount:amount andCurrency:currency];
    Money *sut2 = [[Money alloc] initWithAmount:amount andCurrency:currency];

    STAssertEqualObjects(sut, sut2, @"Two instances of Money with same inputs should be equal.");
}

- (void)testTwoInstances_SameAmountAndDifferentCurrencyInputs_AreNotEqual {
    NSDecimalNumber *amount = [NSDecimalNumber decimalNumberWithMantissa:352 exponent:2 isNegative:FALSE];
    NSString *currencyCDN = @"CDN";
    NSString *currencyUSD = @"USD";

    Money *sut = [[Money alloc] initWithAmount:amount andCurrency:currencyCDN];
    Money *sut2 = [[Money alloc] initWithAmount:amount andCurrency:currencyUSD];

    STAssertFalse([sut isEqual:sut2], @"Two instance of Money with different currencies should not be equal");
}

- (void)testTwoInstances_DifferentAmountAndSameCurrencyInputs_AreNotEqual {
    NSDecimalNumber *amount1 = [NSDecimalNumber decimalNumberWithMantissa:352 exponent:2 isNegative:FALSE];
    NSDecimalNumber *amount2 = [NSDecimalNumber decimalNumberWithMantissa:454 exponent:2 isNegative:FALSE];
    NSString *currencyCDN = @"CDN";

    Money *sut = [[Money alloc] initWithAmount:amount1 andCurrency:currencyCDN];
    Money *sut2 = [[Money alloc] initWithAmount:amount2 andCurrency:currencyCDN];

    STAssertFalse([sut isEqual:sut2], @"Two instance of Money with different amounts should not be equal");
}


@end
