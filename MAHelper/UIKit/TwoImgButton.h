//
//  TwoImgButton.h
//  home
//
//  Created by 宙斯 on 2018/7/16.
//  Copyright © 2018年 joyhealth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoImgButton : UIView
@property (copy, nonatomic) NSString *staticStr;
@property (copy, nonatomic) NSString *titleStr;
@property (assign, nonatomic) NSInteger titleFontSize;
@property (copy, nonatomic) NSString *leftImgName;
@property (copy, nonatomic) NSString *rightImgName;
@property (nonatomic, copy) void (^twoImgButtonPress)();
@end
