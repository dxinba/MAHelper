//
//  MAHeader.h
//  homeplus
//
//  Created by v on 16/7/13.
//  Copyright © 2016年 homeplus. All rights reserved.
//

#ifndef MAHeader_h
#define MAHeader_h

#define IOS8            ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0)
#define IOS9            ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 9.0)
#define IOS10            ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 10.0)

#define HPSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define HPSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define UISreenWidthScale   HPSCREEN_WIDTH / 375.0
//根据屏幕改变大小
#define VALUE(value) (value * HPSCREEN_WIDTH/375.0)

#define Search_Page_Size            2
#define Message_Font_Size           14  // 普通聊天文字大小
#define Notification_Font_Size      10  // 通知文字大小
#define Chatroom_Message_Font_Size  16  // 聊天室聊天文字大小

#define BgColor [UIColor colorWithHexString:@"#3597E2"]
#define TextNormalColor [UIColor colorWithHexString:@"#888888"]
#define WhiteColor [UIColor whiteColor]
#define RedColor [UIColor colorWithHexString:@"#dd4842"]

#define PAYBACK @"PAYMENTBACKACTIONS"

#define JPUSH_APPKEY @"8361d1487d200998539b8047"
#define WX_APPKEY @"wx7bc1ad5ec7025dd1"
#define WX_APPSECRET @"6b98bd106f4ce0f457e72655c20ca2fa"
#define SHARESDK_APPKEY @"191753da32798"
//
#define UPDATESHOW @"ISUPDATESHOWORNOTSHOW"
#define NEWVERSION @"NEWVERSION"
#define JPUSH_REGISTRAQTION_ID @"jpush_Registration_ID"
#define USER_ID @"userId"
#define USERCOMMUNITY @"USERCOMMUNITY"
#define USERPHONE @"selfPhone"

#define LOGINFIRST @"LOGINFIRST"
#define UnlimitedBladeWorks @"UnlimitedTimes"

#define PORT_SUCCESS_CODE @"10000"
//#define PORT_FAIL_CODE @"10000"


// NIM宏

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#pragma mark - UIColor宏定义
#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#define UIColorFromRGB(rgbValue) UIColorFromRGBA(rgbValue, 1.0)



#define dispatch_async_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

#ifndef NS_ENUM
#define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
#endif

#ifndef NS_OPTIONS
#define NS_OPTIONS(_type, _name) enum _name : _type _name; enum _name : _type
#endif

#if OS_OBJECT_USE_OBJC
#undef NIMDispatchQueueRelease
#undef NIMDispatchQueueSetterSementics
#define NIMDispatchQueueRelease(q)
#define NIMDispatchQueueSetterSementics strong
#else
#undef NIMDispatchQueueRelease
#undef NIMDispatchQueueSetterSementics
#define NIMDispatchQueueRelease(q) (dispatch_release(q))
#define NIMDispatchQueueSetterSementics assign
#endif

extern UIImage *NIMScaledImageForKey(NSString *key, UIImage *image);

typedef void(^NIMWebImageNoParamsBlock)();

extern NSString *const NIMWebImageErrorDomain;

#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

//#define dispatch_main_async_safe(block)\
//if ([NSThread isMainThread]) {\
//block();\
//} else {\
//dispatch_async(dispatch_get_main_queue(), block);\

static inline void method_execute_frequency(id obj ,SEL selecter, NSTimeInterval timeInterval){
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [obj performSelector:selecter withObject:nil afterDelay:0];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            onceToken = 0;
        });
    });
}

#endif /* MAHeader_h */
