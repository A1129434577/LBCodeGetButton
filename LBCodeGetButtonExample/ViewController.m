//
//  ViewController.m
//  LBTextFieldDemo
//
//  Created by 刘彬 on 2019/9/24.
//  Copyright © 2019 刘彬. All rights reserved.
//

#import "ViewController.h"
#import "LBCodeGetButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"LBCodeGetButton";
    LBCodeGetButton *codeBtn = [[LBCodeGetButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-80)/2, 200, 80, 40) action:^(LBCodeGetButton *sender) {
        sender.waiting = YES;
    }];
    codeBtn.backgroundColor = [UIColor grayColor];
    [codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    codeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [codeBtn setTitle:@"还有60s" forState:UIControlStateDisabled];//这里的等待时间自定义
    [self.view addSubview:codeBtn];
}

@end
