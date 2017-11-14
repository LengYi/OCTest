//
//  ViewController.m
//  OCTest
//
//  Created by ice on 2017/11/9.
//  Copyright © 2017年 ice. All rights reserved.
//

#import "ViewController.h"
#import "RequestModel.h"

@interface ViewController ()
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.textField];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.btn];
}


- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 300, 40)];
        _textField.layer.borderWidth = 1;
        _textField.layer.borderColor = [UIColor redColor].CGColor;
        _textField.text = @"重庆";
    }
    return _textField;
}

- (UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 400, 60, 30)];
        [_btn addTarget:self action:@selector(pressAction) forControlEvents:UIControlEventTouchUpInside];
        [_btn setTitle:@"Press" forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor redColor];
    }
    return _btn;
}

- (UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(50, 180, 200, 200)];
        _textView.layer.borderWidth = 1;
        _textView.layer.borderColor = [UIColor redColor].CGColor;
    }
    
    return _textView;
}

- (void)pressAction{
    [RequestModel requestDataWithName:_textField.text
                           completion:^(NSString *reslut) {
                               self.textView.text = reslut;
                           }];
}

@end
