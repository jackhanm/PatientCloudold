//
//  bangdingzhanghaoVC.h
//  PatientCloud
//
//  Created by yuhao on 16/8/24.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKCountDownButton;

@interface bangdingzhanghaoVC : UIViewController

@property (nonatomic, strong)UILabel *labelphonenum;
@property (nonatomic, strong)UILabel *labelmsg;

@property (nonatomic, strong)UITextField *phonenum;
@property (nonatomic, strong)UITextField *msg;
@property (nonatomic, strong)UILabel *newpassword;
@property (nonatomic, strong)UITextField *newpass;
@property (nonatomic, strong)JKCountDownButton *msgbutton;
@property (nonatomic, strong)UIButton *tijiao;
@end
