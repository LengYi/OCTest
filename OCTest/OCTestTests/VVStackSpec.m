
#import <Kiwi.h>
#import "VVStack.h"

SPEC_BEGIN(VVStackSpec)
describe(@"VVStack", ^{
    context(@"when create", ^{
        // stack分别是在beforeEach和afterEach的block中的赋值的，因此我们需要在声明时在其前面加上__block标志
        __block VVStack *stack = nil;
        beforeEach(^{
            stack = [VVStack new];
        });
        
        afterEach(^{
            stack = nil;
        });
        
        it(@"should have the class VVStack", ^{
            [[[stack class] shouldNot] beNil];
        });
        
        it(@"should exist", ^{
            [[stack shouldNot] beNil];
        });
        
        it(@"should be able to push and get top", ^{
            // 期望描述的should或者shouldNot是作用在对象上,因此对于标量，我们需要先将其转换为对象
            [stack push:2.3];
            [[theValue([stack pop]) should] equal:theValue(2.3)];
            
            [stack push:4.6];
            // 浮点数精度问题，我们一般使用带有精度的比较期望来进行描述
            [[theValue([stack pop]) should] equal:4.6 withDelta:0.001];
        });
    });
    
    context(@"when new created and pushed 4.6", ^{
        __block VVStack *stack = nil;
        beforeEach(^{
            stack = [VVStack new];
            [stack push:4.6];
        });
        
        afterEach(^{
            stack = nil;
        });
        
        
        it(@"can be poped and the value equals 4.6", ^{
            [[theValue([stack top]) should] equal:theValue(4.6)];
        });
        
        it(@"should contains 0 element after pop", ^{
            [stack pop];
            [[stack should] beEmpty];
        });
    });
});

SPEC_END
