//
//  GetCodeButton.h
//  MBP_MAPP
//
//  Created by 刘彬 on 16/4/11.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBCodeGetButton : UIButton
@property(nonatomic,strong)NSDictionary *datas;
@property(nonatomic,assign,getter=isWaiting)BOOL waiting;
- (instancetype)initWithFrame:(CGRect)frame action:(void (^)(LBCodeGetButton *sender))action;
@end
