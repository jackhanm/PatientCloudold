//
//  forgotPassview.h
//  PatientCloud
//
//  Created by yuhao on 16/8/2.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKCountDownButton;


@protocol forgotPassviewdelegate <NSObject>

-(void)getVerificationCode:(NSString *)phonenum;
- (void)regist:(NSString *)phone mima:(NSString *)mima yanzhengma:(NSString *)yanzhengma;

@end


@interface forgotPassview : UIView
@property (nonatomic, assign)id <forgotPassviewdelegate>delegate;
@property (nonatomic, strong)UILabel *labelphonenum;
@property (nonatomic, strong)UILabel *labelmsg;
@property (nonatomic, strong)UILabel *newpassword;
@property (nonatomic, strong)UILabel *configpassword;
@property (nonatomic, strong)UITextField *phonenum;
@property (nonatomic, strong)UITextField *msg;
@property (nonatomic, strong)UITextField *newpass;
@property (nonatomic,strong)UITextField *congigpass;
@property (nonatomic, strong)JKCountDownButton *msgbutton;
@property (nonatomic, strong)UIButton *tijiao;
@end
