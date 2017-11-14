//
//  RatingCalculatorTest.m
//  OCTest
//
//  Created by ice on 2017/11/13.
//  Copyright © 2017年 ice. All rights reserved.
//

#import <Kiwi.h>
#import "RatingCalculator.h"

SPEC_BEGIN(RatingCalculatorTest)

describe(@"RatingCalculatorTest", ^{
    __block RatingCalculator *calculator;
    beforeEach(^{
        calculator = [[RatingCalculator alloc] init];
    });
    afterEach(^{
        calculator = nil;
    });
    
    context(@"when created", ^{
        it(@"should exist", ^{
            [[calculator shouldNot] beNil];
            [[calculator.scores shouldNot] beNil];
        });
    });
    
    context(@"when input correctly", ^{
        beforeEach(^{
            [calculator inputScores:@[@3,@2,@1,@4,@8.5,@5.5]];
            [[calculator.scores should] haveCountOf:6];
        });
    });
    
    context(@"should have scores", ^{
        [calculator inputScores:@[@4,@3,@2,@1]];
        [[theValue(calculator.scores.count) should] equal:theValue(4)];
        
        [[theBlock(^{
            [calculator inputScores:@[@4,@3,@"ss",@"5"]];
        }) should] raiseWithName:@"ASRatingCalculatorInputError"];
        
        it(@"return average correctly", ^{
            //[[theValue([calculator average]) should] equal:85.83 withDelta:0.01];
        });
    });
});


describe(@"SimpleString", ^{
    context(@"when assigned to Hello", ^{
        NSString *greeting = @"123";
        it(@"should exist", ^{
            [[greeting shouldNot] beNil];
        });
    });
});

SPEC_END
