//
//  CalculatorTests.m
//  CalculatorTests
//
//  Created by Tsihsin Lee on 2019/1/17.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface CalculatorTests : XCTestCase

@end

@implementation CalculatorTests


- (void)testZeroAppendZero
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"0" input:@"0"];
    XCTAssert([result isEqualToString:@"0"]);
}

- (void)testZeroAppendOne
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"0" input:@"1"];
    XCTAssert([result isEqualToString:@"1"]);
}

- (void)testZeroAppendPoint
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"0" input:@"."];
    XCTAssert([result isEqualToString:@"0."]);
}

- (void)testZeroAppendNega
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"0" input:@"+-"];
    XCTAssert([result isEqualToString:@"-0"]);
}

- (void)testNegaZeroAppendZero
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"-0" input:@"0"];
    XCTAssert([result isEqualToString:@"-0"]);
}

- (void)testNegaZeroAppendOne
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"-0" input:@"1"];
    XCTAssert([result isEqualToString:@"-1"]);
}

- (void)testNegaZeroAppendPoint
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"-0" input:@"."];
    XCTAssert([result isEqualToString:@"-0."]);
}

- (void)testNegaZeroAppendNega
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"-0" input:@"+-"];
    XCTAssert([result isEqualToString:@"0"]);
}

- (void)testZeroAppendTwoPoint
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"0." input:@"."];
    XCTAssert([result isEqualToString:@"0."]);
}

- (void)testNegaZeroAppendTwoPoint
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"-0." input:@"."];
    XCTAssert([result isEqualToString:@"-0."]);
}

- (void)testOneAddPoint
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"1" input:@"."];
    XCTAssert([result isEqualToString:@"1."]);
}

- (void)testHundredAppendPoint
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"100" input:@"."];
    XCTAssert([result isEqualToString:@"100."]);
}

- (void)testChangeNega
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"1000" input:@"+-"];
    XCTAssert([result isEqualToString:@"-1000"]);
}

- (void)testChangeNega2
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"-1000" input:@"+-"];
    XCTAssert([result isEqualToString:@"1000"]);
}

#pragma mark - Max

- (void)testMax1
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"123456789012345" input:@"0"];
    XCTAssert([result isEqualToString:@"123456789012345"]);
}

- (void)testMax2
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"123456789012345" input:@"."];
    XCTAssert([result isEqualToString:@"123456789012345"]);
}

- (void)testMax3
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"123456789012345" input:@"+-"];
    XCTAssert([result isEqualToString:@"123456789012345"]);
}

- (void)testMax4
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"-12345678901234" input:@"+-"];
    XCTAssert([result isEqualToString:@"-12345678901234"]);
}

- (void)testNormal1
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"-1" input:@"1"];
    XCTAssert([result isEqualToString:@"-11"]);
}

- (void)testNormal2
{
    ViewController *controller = [[ViewController alloc] init];
    NSString *result = [controller compose:@"99999" input:@"1"];
    XCTAssert([result isEqualToString:@"999991"]);
}

@end
