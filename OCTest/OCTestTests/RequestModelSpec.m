
#import <Kiwi.h>
#import "RequestModel.h"

SPEC_BEGIN(RequestModelSpec)

describe(@"RequestModel", ^{
    it(@"requestData", ^{
        [RequestModel requestDataWithName:@"北京"
                               completion:^(NSString *reslut) {
                                   [[theValue(reslut) shouldNot] beNil];
                               }];
    });
});

SPEC_END
