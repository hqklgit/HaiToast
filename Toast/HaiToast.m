//
//  HaiToast.m
//  Toast
//
//  Created by 比邻盛世 on 16/5/6.
//  Copyright © 2016年 HaiChecker. All rights reserved.
//

#import "HaiToast.h"
static HaiToast *toast;
@implementation HaiToastConfig

+(instancetype) HaiToastConfig:(CGFloat) width height:(CGFloat)height mode:(HaiToastMode)mode
{
    HaiToastConfig *config = [[HaiToastConfig alloc] init];
    config.width = width;
    config.height = height;
    config.mode = mode;
    return config;
}

@end

@implementation HaiToast

//msg 提醒的消息
//delay 关闭时间
+(void) showToastMsg:(NSString *) msg delay :(CGFloat) delay config:(HaiToastConfig *) config superView:(UIView *) superview{
    
    if (toast) {
        [HaiToast hidden];
    }
    
    toast = [[HaiToast alloc] initWithFrame:CGRectMake(10, superview.frame.origin.y , config.width - 20, config.height)];
    [toast.layer setMasksToBounds:YES];
    [toast.layer setCornerRadius:5];
    [toast setBackgroundColor:[UIColor grayColor]];
    UILabel *lib = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, config.width - 5, config.height - 5)];
    lib.textAlignment = NSTextAlignmentLeft|NSTextAlignmentCenter;
    lib.text = msg;
    if (config.textColor) {
        lib.textColor = config.textColor;
    }
    if (config.textFont) {
        lib.font = config.textFont;
    }
    [toast setAlpha:0];
    [toast addSubview:lib];
    
    
    
    if (superview.superview) {
        [superview.superview addSubview:toast];
        [superview.superview bringSubviewToFront:superview];
    }else{
        CGRect s = toast.frame;
        s.origin.y = superview.frame.origin.y - config.height;
        toast.frame = s;
        [superview addSubview:toast];
        [superview bringSubviewToFront:toast];
    }
    
    
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [toast setAlpha:0.5];
        CGRect frame = toast.frame;
        frame.origin.y += frame.size.height;
        [toast setFrame:frame];
        
    } completion:^(BOOL finch){
        if (delay != 0) {
            [UIView animateWithDuration:0.3f delay:delay options:UIViewAnimationOptionCurveEaseOut animations:^{
                [toast setAlpha:0];
                CGRect frame = toast.frame;
                frame.origin.y -= frame.size.height;
                [toast setFrame:frame];
                
            } completion:^(BOOL is){
                [toast removeFromSuperview];
                toast = nil;
            }];
        }
    }];

    
}

//view 显示在里面的View，可自由发挥
//delay 关闭时间
// mode 显示方向
+(void) showToastView :(UIView *) view delay :(CGFloat) delay config:(HaiToastConfig *) config superView:(UIView *) superview{
    
    if (toast) {
        [HaiToast hidden];
    }
    
    toast = [[HaiToast alloc] initWithFrame:CGRectMake(10, superview.frame.origin.y , config.width - 20, config.height)];
    [toast.layer setMasksToBounds:YES];
    [toast.layer setCornerRadius:5];
    [toast setBackgroundColor:[UIColor grayColor]];
    [toast addSubview:view];
    
    if (superview.superview) {
        [superview.superview addSubview:toast];
        [superview.superview bringSubviewToFront:superview];
    }else{
        CGRect s = toast.frame;
        s.origin.y = superview.frame.origin.y - config.height;
        toast.frame = s;
        [superview addSubview:toast];
        [superview bringSubviewToFront:toast];
    }

    if (delay != 0) {
        [UIView animateWithDuration:0.3f delay:delay options:UIViewAnimationOptionCurveEaseOut animations:^{
            [toast setAlpha:0];
            CGRect frame = toast.frame;
            frame.origin.y -= frame.size.height;
            [toast setFrame:frame];
            
        } completion:^(BOOL is){
            [toast removeFromSuperview];
            toast = nil;
        }];
    }

    
}

//手动关闭所有提示
+(void) hidden
{
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [toast setAlpha:0];
        CGRect frame = toast.frame;
        frame.origin.y -= frame.size.height;
        [toast setFrame:frame];
        
    } completion:^(BOOL is){
        [toast removeFromSuperview];
    }];
}

@end
