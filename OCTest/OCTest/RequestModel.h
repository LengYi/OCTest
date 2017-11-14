//
//  RequestModel.h
//  OCTest
//
//  Created by ice on 2017/11/14.
//  Copyright © 2017年 ice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestModel : NSObject
+ (void)requestDataWithName:(NSString *)placeName
                 completion:(void(^)(NSString *reslut))block;
@end
