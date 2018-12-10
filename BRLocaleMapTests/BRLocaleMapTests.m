//
//  BRLocaleMapTests.m
//  BRLocaleMapTests
//
//  Created by Brian Chan on 2018/12/10.
//  Copyright © 2018 b123400. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BRLocaleMap.h"

@interface BRLocaleMap ()
+ (NSArray<NSString*> *)fallbacksWithLocale:(NSString*)localeCode;
@end

@interface BRLocaleMapTests : XCTestCase

@end

@implementation BRLocaleMapTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testBasicFallback {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSArray <NSString*> *expected = @[@"zh_Hant_HK", @"zh_Hant", @"zh"];
    XCTAssertEqualObjects([BRLocaleMap fallbacksWithLocale:@"zh_Hant_HK"], expected);
}

- (void)testMixedFallback {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSArray <NSString*> *expected = @[@"zh-Hant_HK", @"zh-Hant", @"zh"];
    XCTAssertEqualObjects([BRLocaleMap fallbacksWithLocale:@"zh-Hant_HK"], expected);
    
    NSArray <NSString*> *expected2 = @[@"zh_Hant-HK", @"zh_Hant", @"zh"];
    XCTAssertEqualObjects([BRLocaleMap fallbacksWithLocale:@"zh_Hant-HK"], expected2);
}

@end
