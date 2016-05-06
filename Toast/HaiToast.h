//
//  HaiToast.h
//  Toast
//
//  Created by 比邻盛世 on 16/5/6.
//  Copyright © 2016年 HaiChecker. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    HaiToastTop,
    HaiToastLeft,
    HaiToastRight,
    HaiToastBottom,
} HaiToastMode;

@interface HaiToastConfig : NSObject

@property CGFloat width;
@property CGFloat height;
@property HaiToastMode mode;
@property UIColor *textColor;
@property UIFont *textFont;
@property UIColor *toastColor;


+(instancetype) HaiToastConfig:(CGFloat) width height:(CGFloat)height mode :(HaiToastMode) mode;

@end

@interface HaiToast : UIView


//msg 提醒的消息
//delay 关闭时间
+(void) showToastMsg:(NSString *) msg delay :(CGFloat) delay config:(HaiToastConfig *) config superView:(UIView *) superview;

//view 显示在里面的View，可自由发挥
//delay 关闭时间
// mode 显示方向
+(void) showToastView :(UIView *) view delay :(CGFloat) delay config:(HaiToastConfig *) config superView:(UIView *) superview;

//手动关闭所有提示
+(void) hidden;

@end
