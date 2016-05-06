//
//  ViewController.m
//  Toast
//
//  Created by 比邻盛世 on 16/5/6.
//  Copyright © 2016年 HaiChecker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)nav2:(id)sender {
    HaiToastConfig *c = [HaiToastConfig HaiToastConfig:self.view.frame.size.width height:50 mode:HaiToastTop];
    c.textColor = [UIColor whiteColor];
    c.toastColor = [UIColor darkTextColor];
    [HaiToast showToastMsg:@"显示在按钮下" delay:2 config:c superView:sender];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)nav:(id)sender {
    HaiToastConfig *c = [HaiToastConfig HaiToastConfig:self.view.frame.size.width height:50 mode:HaiToastTop];
    c.textColor = [UIColor whiteColor];
    c.toastColor = [UIColor darkTextColor];
    [HaiToast showToastMsg:@"显示在导航栏下" delay:2 config:c superView:self.navigationController.navigationBar];
}
@end
