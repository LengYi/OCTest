//
//  RequestModel.m
//  OCTest
//
//  Created by ice on 2017/11/14.
//  Copyright © 2017年 ice. All rights reserved.
//

#import "RequestModel.h"
#import <AFNetworking.h>

@implementation RequestModel

+ (void)requestDataWithName:(NSString *)placeName completion:(void(^)(NSString *reslut))block{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    manager.responseSerializer =[AFJSONResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json",@"text/plain", @"text/html",@"text/json",@"text/javascript", nil];
    //2.设置登录参数
    NSDictionary *dict = @{ @"a":placeName};
    
    //3.请求
    [manager GET:@"http://gc.ditu.aliyun.com/geocoding" parameters:dict success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *parseError = nil;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:&parseError];
        
        NSString *result = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"result = %@",result);
        if(block){
            block(result);
        }
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

@end
