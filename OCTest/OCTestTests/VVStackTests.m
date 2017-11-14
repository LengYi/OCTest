#import <XCTest/XCTest.h>
#import "VVStack.h"

@interface VVStackTests : XCTestCase

@end

@implementation VVStackTests

- (void)setUp {
    [super setUp];
  
}

- (void)tearDown {

    [super tearDown];
}

- (void)testStackExist{
    XCTAssertNotNil([VVStack class],@"VVStack class should exist.");
}

- (void)testPushAndPop{
    VVStack *stack = [[VVStack alloc] init];
    [stack push:2.3];
    double top = [stack pop];
    XCTAssertEqual(top, 2.3,@"VVStack should can be pushed and has that top value");
}

@end
