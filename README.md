# LBCodeGetButton
```objc
LBCodeGetButton *codeBtn = [[LBCodeGetButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-80)/2, 200, 80, 40) action:^(LBCodeGetButton *sender) {
    sender.waiting = YES;
}];
codeBtn.backgroundColor = [UIColor grayColor];
[codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
codeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
[codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
[codeBtn setTitle:@"还有60s" forState:UIControlStateDisabled];//这里的等待时间自定义
```
![](https://github.com/A1129434577/LBCodeGetButton/blob/master/LBCodeGetButton.gif?raw=true)
