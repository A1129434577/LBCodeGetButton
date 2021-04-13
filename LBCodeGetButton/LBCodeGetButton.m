//
//  GetCodeButton.m
//  MBP_MAPP
//
//  Created by 刘彬 on 16/4/11.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#import "LBCodeGetButton.h"

@interface LBCodeGetButton()
@property (nonatomic,strong)NSString *secondsString;
@property (nonatomic,assign)NSUInteger secondsFrontLenth;
@property (nonatomic,assign)NSUInteger secondsBehindLenth;
@property (nonatomic, strong) UIColor *theBackgroundColor;
@property (nonatomic,copy)void (^action)(LBCodeGetButton *sender);
@property (nonatomic,assign)UIBackgroundTaskIdentifier taskIdentifier;
@end
@implementation LBCodeGetButton

- (instancetype)initWithFrame:(CGRect)frame action:(void (^)(LBCodeGetButton *sender))action
{
    self = [super initWithFrame:frame];
    if (self) {
        _action = action;
        self.waiting = NO;
        [self addTarget:self action:@selector(getCodeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
-(void)getCodeButtonAction{
    __weak typeof(self) weakSelf = self;
    _action?_action(weakSelf):NULL;
}

-(void)setWaiting:(BOOL)waiting{
    _waiting = waiting;
    
    if (waiting) {
        self.enabled = NO;
        __weak typeof(self) weakSelf = self;
        [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSString *currentTitle = [weakSelf currentTitle];
            
            NSString *secondsString = [currentTitle stringByReplacingCharactersInRange:NSMakeRange(0, weakSelf.secondsFrontLenth) withString:@""];
            secondsString = [secondsString stringByReplacingCharactersInRange:NSMakeRange(secondsString.length-weakSelf.secondsBehindLenth, weakSelf.secondsBehindLenth) withString:@""];
            
            NSInteger seconds = [secondsString integerValue];
            seconds --;
            
            [super setTitle:[currentTitle stringByReplacingCharactersInRange:NSMakeRange(weakSelf.secondsFrontLenth, currentTitle.length-weakSelf.secondsFrontLenth-weakSelf.secondsBehindLenth) withString:[NSString stringWithFormat:@"%ld",seconds]] forState:UIControlStateDisabled];
            if (seconds == 0) {
                weakSelf.waiting = NO;
                [timer invalidate];
            }
        }];
        _taskIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
    }else{
        NSString *currentTitle = [self currentTitle];
        
        [super setTitle:[currentTitle stringByReplacingCharactersInRange:NSMakeRange(self.secondsFrontLenth, currentTitle.length-self.secondsFrontLenth-self.secondsBehindLenth) withString:_secondsString] forState:UIControlStateDisabled];
        self.enabled = YES;
        [[UIApplication sharedApplication] endBackgroundTask:_taskIdentifier];
    }
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    if (state == UIControlStateDisabled) {
        // Intermediate
        NSMutableString *numberString = [[NSMutableString alloc] init];
        NSScanner *scanner = [NSScanner scannerWithString:[self titleForState:UIControlStateDisabled]];
        NSCharacterSet *characterSet = [NSCharacterSet decimalDigitCharacterSet];
        NSString *tempStr;
        while (![scanner isAtEnd]) {
            // Throw away characters before the first number.
            [scanner scanUpToCharactersFromSet:characterSet intoString:NULL];
            // Collect numbers.
            [scanner scanCharactersFromSet:characterSet intoString:&tempStr];
            [numberString appendString:tempStr];
            tempStr = @"";
        }
        _secondsString = numberString;
        _secondsFrontLenth = [title rangeOfString:_secondsString].location;
        _secondsBehindLenth = title.length-(_secondsFrontLenth+[title rangeOfString:_secondsString].length);
    }
}

- (void)setBackgroundColor:(UIColor *)backgroundColor{
    [super setBackgroundColor:backgroundColor];
    _theBackgroundColor = backgroundColor;
}
-(void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    if (self.theBackgroundColor) {
        if (enabled) {
            super.backgroundColor = self.theBackgroundColor;
        }else{
            super.backgroundColor = [UIColor lightGrayColor];
        }
    }
}
@end
