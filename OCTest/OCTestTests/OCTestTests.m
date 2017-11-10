//
//  OCTestTests.m
//  OCTestTests
//
//  Created by ice on 2017/11/9.
//  Copyright © 2017年 ice. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking.h>
#import <STAlertView/STAlertView.h>

@interface OCTestTests : XCTestCase
@property (nonatomic, strong) STAlertView *stAlertView;
@end

@implementation OCTestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSLog(@"自定义测试testExample");
    int  a= 3;
    XCTAssertTrue(a == 0,"a 等于 0");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

// 断言测试
- (void)testAssert{
    // 生成一个失败的测试；
    // XCTFail(@"Fail");
    
    // 字符串不为空,则打印后续提示,并且测试不通过,空则通过
    NSString *str = nil;
    XCTAssertNil(str,"字符串应为空");
    
    str = @"999";
    // str 不为空，则通过，通过不打印log，不通过才打印
    XCTAssertNotNil(str,@"333");
    
    // 表达式求值为真则通过，否则不通过
    XCTAssert(3 > 2,@"表达试求值必须为真");
    XCTAssertTrue(3 > 2, @"表达式结果不能为0");
    
    XCTAssertFalse((4 < 2), @"表达试求值必须为假");
    
    
    NSString *str0 = @"1111";
    NSString *str1 = @"1111";
    // 对象相等则通过
    XCTAssertEqualObjects(str0, str1,@"两对象需不相等");
    str1 = @"1112";
    // 对象不相等则通过
    XCTAssertNotEqualObjects(str0,str1, @"两对象需不相等");
    
    // 比较基本数据类型变量
    XCTAssertEqual(1,1,@"两比较数必须相等");
    
    // 比较NSArray对象
    NSArray *array1 = @[@1];
    // NSArray *array2 = @[@1];
    NSArray *array3 = array1;
    
    // XCTAssertEqual(array1, array2,@"比较对象必须相同"); // 不通过
    XCTAssertEqual(array1, array3,@"比较对象必须相同");
    
    // 判断相等，（double或float类型）提供一个误差范围，当在误差范围（+/- accuracy ）以内相等时通过测试；
    XCTAssertEqualWithAccuracy(1.0f, 1.5f, 0.5f, @"比较数值必须在允许误差范围内");
    
    // 不在误差范围内通过
    XCTAssertNotEqualWithAccuracy(1.0f, 1.5f, 0.25f, @"比较数值必须不在允许误差范围内");
    
    // 表达式异常通过
    // XCTAssertThrows();
    
    // XCTAssertThrowsSpecific(expression, specificException, format...) 异常测试，当expression发生 specificException 异常时通过；反之发生其他异常或不发生异常均不通过；
    
    // XCTAssertNoThrow(expression, format…) 异常测试，当expression没有发生异常时通过测试；
    
    // XCTAssertNoThrowSpecific(expression, specificException, format...)异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过；
    
    // XCTAssertNoThrowSpecificNamed(expression, specificException, exception_name, format...) 异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过
}

- (void)testRequest{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    [manger GET:@"http://www.weather.com.cn/adat/sk/101110101.html"
     parameters:nil
        success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"responseObject:%@",responseObject);
            XCTAssertNotNil(responseObject,@"请求结果为空");
            self.stAlertView = [[STAlertView alloc] initWithTitle:@"验证码"
                                                          message:nil
                                                    textFieldHint:@"请输入手机验证码"
                                                   textFieldValue:nil
                                                cancelButtonTitle:@"取消"
                                                 otherButtonTitle:@"确定"
                                                cancelButtonBlock:^{
                                                    //点击取消返回后执行
                                                    [self testAlertViewCancel];
                                                } otherButtonBlock:^(NSString *b) {
                                                    //点击确定后执行
                                                    [self alertViewComfirm:b];
                                                }];
            [self.stAlertView show];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
}

- (void)testAlertViewCancel{
    NSLog(@"取消");
}

- (void)alertViewComfirm:(NSString *)test{
    NSLog(@"手机验证码:%@",test);
}
@end
