//
//  PhoneCodeButton.m
//  CodingMart
//
//  Created by Ease on 15/12/15.
//  Copyright © 2015年 net.coding. All rights reserved.
//

#import "PhoneCodeButton.h"

@interface PhoneCodeButton ()
@property (nonatomic, strong, readwrite) NSTimer *timer;
@property (assign, nonatomic) NSTimeInterval durationToValidity;
@property (strong, nonatomic) UIView *lineView;
@end

@implementation PhoneCodeButton

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUI:self.bounds];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI:frame];
    }
    return self;
}

- (void)setUI:(CGRect)frame {
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.enabled = YES;
    [self setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    self.layer.cornerRadius = 5.0;
    self.layer.borderColor = [UIColor colorWithHexString:@"#F2F2F2"].CGColor;
    self.layer.borderWidth = 1.0;
    
    
//    _lineView = [[UIView alloc] initWithFrame:CGRectMake(-10, 5, 0.5, CGRectGetHeight(frame) - 2*5)];
//    _lineView.backgroundColor = [UIColor colorWithHexString:@"0xD8D8D8"];
//    [self addSubview:_lineView];
}

- (void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    UIColor *abledColor = [UIColor whiteColor];
    UIColor *enabledColor = [UIColor colorWithHexString:@"#F2F2F2"];
    UIColor *foreColor = enabled? abledColor: enabledColor;
    [self setBackgroundColor:foreColor];
    if (enabled) {
        [self setTitle:@"发送验证码" forState:UIControlStateNormal];
    }else if ([self.titleLabel.text isEqualToString:@"发送验证码"]){
        [self setTitle:@"正在发送..." forState:UIControlStateNormal];
    }
}

- (void)startUpTimer{
    _durationToValidity = 60;
    
    if (self.isEnabled) {
        self.enabled = NO;
    }
    [self setTitle:[NSString stringWithFormat:@"%.0f 秒", _durationToValidity] forState:UIControlStateNormal];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(redrawTimer:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)invalidateTimer{
    if (!self.isEnabled) {
        self.enabled = YES;
        [self setTitle:@"再次获取" forState:UIControlStateNormal];
    }
    [self.timer invalidate];
    self.timer = nil;
}

- (void)redrawTimer:(NSTimer *)timer {
    _durationToValidity--;
    if (_durationToValidity > 0) {
        self.titleLabel.text = [NSString stringWithFormat:@"%.0f 秒", _durationToValidity];//防止 button_title 闪烁
        [self setTitle:[NSString stringWithFormat:@"%.0f 秒", _durationToValidity] forState:UIControlStateNormal];
    }else{
        [self invalidateTimer];
    }
}

@end
