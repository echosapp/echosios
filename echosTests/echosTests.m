//
//  echosTests.m
//  echosTests
//
//  Created by Niraj Khandekar on 1/28/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "EchosManager.h"
#import "EchosClient.h"

@interface echosTests : XCTestCase

@end

@implementation echosTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/*
- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

*/

-(void)test_validateUser
{
    EchosManager* em = [ EchosManager sharedClient];
    [ em validateUserWithuserName:@"niraj" password:@"niraj" phone:@"+17323190083" countryCode:@"+1" completion:^(NSMutableDictionary *res) {
        NSLog( @"%@", res );
    }];
    
}

-(void) test_addressbook
{
    
}

@end
