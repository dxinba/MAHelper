//
//  TwoImgButton.m
//  home
//
//  Created by 宙斯 on 2018/7/16.
//  Copyright © 2018年 joyhealth. All rights reserved.
//

#import "TwoImgButton.h"

@interface TwoImgButton ()
@property (strong, nonatomic) UILabel *staticLabel;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *leftImgView;
@property (strong, nonatomic) UIImageView *rightImgView;
@end

@implementation TwoImgButton

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    [self addSubview:self.leftImgView];
    [self addSubview:self.staticLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.rightImgView];
//    [self.leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.bottom.mas_equalTo(self).with.mas_offset(0);
//    }];
//    [self.staticLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.leftImgView.mas_right).with.mas_offset(5);
//        make.top.bottom.mas_equalTo(self).with.mas_offset(0);
//        make.right.mas_equalTo(self.titleLabel.mas_left).with.mas_offset(0);
//    }];
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.staticLabel.mas_right).with.mas_offset(0);
//        make.top.bottom.mas_equalTo(self).with.mas_offset(0);
//        make.right.mas_equalTo(self.rightImgView.mas_left).with.mas_offset(-5);
//    }];
//    [self.rightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.top.bottom.mas_equalTo(self).with.mas_offset(0);
//    }];
    self.userInteractionEnabled = YES;
    self.leftImgView.userInteractionEnabled = YES;
    self.staticLabel.userInteractionEnabled = YES;
    self.titleLabel.userInteractionEnabled = YES;
    self.rightImgView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewPress)];
    [self addGestureRecognizer:tap];
}

- (void)viewPress {
    self.twoImgButtonPress();
}

- (void)setLeftImgName:(NSString *)leftImgName {
    _leftImgName = leftImgName;
    [self.leftImgView setImage:[UIImage imageNamed:_leftImgName]];
}

- (void)setTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
    self.titleLabel.text = _titleStr;
}

- (void)setTitleFontSize:(NSInteger)titleFontSize {
    _titleFontSize = titleFontSize;
    self.titleLabel.font = [UIFont systemFontOfSize:_titleFontSize];
    self.staticLabel.font = [UIFont systemFontOfSize:_titleFontSize];
}

- (void)setStaticStr:(NSString *)staticStr {
    _staticStr = staticStr;
    self.staticLabel.text = _staticStr;
}

- (void)setRightImgName:(NSString *)rightImgName {
    _rightImgName = rightImgName;
    [self.rightImgView setImage:[UIImage imageNamed:_rightImgName]];
}

- (void)layoutSubviews {
//    HPLogFunc;
//    [self sizeToFit];
}

- (UIImageView *)leftImgView {
    if (!_leftImgView) {
        _leftImgView = [[UIImageView alloc] init];
        _leftImgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _leftImgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)staticLabel {
    if (!_staticLabel) {
        _staticLabel = [[UILabel alloc] init];
        _staticLabel.font = [UIFont systemFontOfSize:12];
        _staticLabel.textColor = [UIColor whiteColor];
        _staticLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _staticLabel;
}

- (UIImageView *)rightImgView {
    if (!_rightImgView) {
        _rightImgView = [[UIImageView alloc] init];
        _rightImgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _rightImgView;
}


@end
