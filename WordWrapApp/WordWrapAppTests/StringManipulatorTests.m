#import "StringManipulatorTests.h"
#import "StringManipulator.h"

@implementation StringManipulatorTests

- (void)setUp {
    [super setUp];
    sut = [[StringManipulator alloc] init];
}

- (void)testLineWrapByColumnWidthMethod_columnWidthIsZero_stringHasNoLineBreaks {
    NSString *input = @"Here is my string with no breaks, but enough length for at least 2 or 3 of them. Sound good?";
    NSString *expected = input;

    NSString *result = [sut lineWrap:input byColumnWidth:0];

    STAssertEqualObjects(result, expected, @"When column width is 0, result should have no line breaks.");
}

@end
