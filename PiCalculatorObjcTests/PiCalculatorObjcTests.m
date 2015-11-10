//
//  PiCalculatorObjcTests.m
//  PiCalculatorObjcTests
//
//  Created by EricYang on 9/11/2015.
//  Copyright © 2015 Eric. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PiCalculateService.h"

@interface PiCalculatorObjcTests : XCTestCase{
    PiCalculateService *piCalculateService;
}


@end

@implementation PiCalculatorObjcTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    piCalculateService = [[PiCalculateService alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void) testPiAlgorithm{
    XCTAssertGreaterThan([piCalculateService PiAlgorithm],0);
}

@end
