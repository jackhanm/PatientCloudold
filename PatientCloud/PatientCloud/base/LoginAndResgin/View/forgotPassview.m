//
//  forgotPassview.m
//  PatientCloud
//
//  Created by yuhao on 16/8/2.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "forgotPassview.h"
#import "JKCountDownButton.h"



@interface forgotPassview ()<UITextFieldDelegate>

@end
@implementation forgotPassview


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createview];
    }
    return self;
}
- (void)createview
{
    self.labelphonenum = [[UILabel alloc]initWithFrame:CGRectMake(10/WIDTHSIXP * WIDGHT, 95/ HEIGHTSIXP * HEIGHT, 100/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.labelphonenum.text = @"手机号码";

//    self.labelphonenum.backgroundColor = [UIColor orangeColor];
    self.labelphonenum.font = [UIFont systemFontOfSize:18/ HEIGHTSIXP * HEIGHT];
    [self addSubview:self.labelphonenum];
    
    
    self.phonenum = [[UITextField alloc]initWithFrame:CGRectMake(120/WIDTHSIXP * WIDGHT, 100/ HEIGHTSIXP * HEIGHT, 245/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    NSString *holderText1 = @"手机号码，必填   ";
    NSMutableAttributedString *placeholder1 = [[NSMutableAttributedString alloc]initWithString:holderText1];
    [placeholder1 addAttribute:NSForegroundColorAttributeName
                         value:[UIColor colorWithRed:0.7602 green:0.7602 blue:0.7602 alpha:1.0]
                         range:NSMakeRange(0, holderText1.length)];
    [placeholder1 addAttribute:NSFontAttributeName
                         value:[UIFont fontWithName:@"CourierNewPSMT" size:18.0/ HEIGHTSIXP * HEIGHT]
                         range:NSMakeRange(0, holderText1.length)];
    self.phonenum.attributedPlaceholder = placeholder1;

    
    
    self.phonenum.clearsOnBeginEditing = YES;
    self.phonenum.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phonenum.textAlignment = NSTextAlignmentRight;
    self.phonenum.keyboardType = UIKeyboardTypeNumberPad;
    self.phonenum.returnKeyType = UIReturnKeyDone;
//    self.phonenum.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.phonenum];
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP * WIDGHT, 131/ HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    view1.backgroundColor = [UIColor colorWithRed:0.6431 green:0.6431 blue:0.6431 alpha:1.0];
    [self addSubview:view1];
    
    
    self.labelmsg = [[UILabel alloc]initWithFrame:CGRectMake(10/WIDTHSIXP * WIDGHT, 155/ HEIGHTSIXP * HEIGHT, 100/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.labelmsg.text = @"短信验证码";
//    self.labelmsg.backgroundColor = [UIColor orangeColor];
    self.labelmsg.font = [UIFont systemFontOfSize:18/ HEIGHTSIXP * HEIGHT];
    [self addSubview:self.labelmsg];
    
    
    self.msg = [[UITextField alloc]initWithFrame:CGRectMake(120/WIDTHSIXP * WIDGHT, 160/ HEIGHTSIXP * HEIGHT, 145/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.msg.returnKeyType = UIReturnKeyDone;
    self.msg.delegate = self;
    NSString *holderText2 =  @"验证码，必填";
    NSMutableAttributedString *placeholder2 = [[NSMutableAttributedString alloc]initWithString:holderText2];
    [placeholder2 addAttribute:NSForegroundColorAttributeName
                         value:[UIColor colorWithRed:0.7602 green:0.7602 blue:0.7602 alpha:1.0]
                         range:NSMakeRange(0, holderText2.length)];
    [placeholder2 addAttribute:NSFontAttributeName
                         value:[UIFont fontWithName:@"CourierNewPSMT" size:18.0/ HEIGHTSIXP * HEIGHT]
                         range:NSMakeRange(0, holderText2.length)];
    self.msg.attributedPlaceholder = placeholder2;
    
    [self addSubview:self.msg];
    
    
    self.msgbutton = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
    self.msgbutton .frame = CGRectMake(265/WIDTHSIXP * WIDGHT, 145/ HEIGHTSIXP * HEIGHT, 100/WIDTHSIXP * WIDGHT, 40/ HEIGHTSIXP * HEIGHT);
    [self.msgbutton setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.msgbutton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.msgbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    self.msgbutton.layer.borderWidth = 1;
    self.msgbutton.layer.borderColor = [[UIColor redColor] CGColor];
    [self.msgbutton  addTarget:self action:@selector(buttonmsgAct) forControlEvents: UIControlEventTouchUpInside];
    [self addSubview:self.msgbutton ];
    [_msgbutton  countDownButtonHandler:^(JKCountDownButton*sender, NSInteger tag) {
        
        if (self.phonenum.text.length > 0) {
            
        
        sender.enabled = NO;
        
        [sender startCountDownWithSecond:120];
        
        [sender countDownChanging:^NSString *(JKCountDownButton *countDownButton,NSUInteger second) {
            NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
            return title;
        }];
        [sender countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
            countDownButton.enabled = YES;
            return @"发送验证码";
            
        }];
        }else {
            
        }
    }];

    
    
    
    
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP * WIDGHT, 191/ HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    view2.backgroundColor = [UIColor colorWithRed:0.6431 green:0.6431 blue:0.6431 alpha:1.0];
    [self addSubview:view2];
    
    self.newpassword = [[UILabel alloc]initWithFrame:CGRectMake(10/WIDTHSIXP * WIDGHT, 215/ HEIGHTSIXP * HEIGHT, 100/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.newpassword.text = @"新密码";
//    self.newpassword.backgroundColor = [UIColor orangeColor];
    self.newpassword.font = [UIFont systemFontOfSize:18/ HEIGHTSIXP * HEIGHT];
    [self addSubview:self.newpassword];
    
    self.newpass = [[UITextField alloc]initWithFrame:CGRectMake(120/WIDTHSIXP * WIDGHT, 220/ HEIGHTSIXP * HEIGHT, 245/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.newpass.returnKeyType = UIReturnKeyDone;
    self.newpass.delegate = self;

    NSString *holderText3 = @"新密码，必填   ";
    NSMutableAttributedString *placeholder3 = [[NSMutableAttributedString alloc]initWithString:holderText3];
    [placeholder3 addAttribute:NSForegroundColorAttributeName
                         value:[UIColor colorWithRed:0.7602 green:0.7602 blue:0.7602 alpha:1.0]
                         range:NSMakeRange(0, holderText3.length)];
    [placeholder3 addAttribute:NSFontAttributeName
                         value:[UIFont fontWithName:@"CourierNewPSMT" size:18.0/ HEIGHTSIXP * HEIGHT]
                         range:NSMakeRange(0, holderText3.length)];
    self.newpass.attributedPlaceholder = placeholder3;
       self.newpass.textAlignment = NSTextAlignmentRight;
//    self.newpass.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.newpass];
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP * WIDGHT, 251/ HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    view3.backgroundColor = [UIColor colorWithRed:0.6431 green:0.6431 blue:0.6431 alpha:1.0];
    [self addSubview:view3];
    
    
    self.configpassword = [[UILabel alloc]initWithFrame:CGRectMake(10/WIDTHSIXP * WIDGHT, 275/ HEIGHTSIXP * HEIGHT, 100/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.configpassword.text = @"确认密码";
   
    
//    self.configpassword.backgroundColor = [UIColor orangeColor];
    self.configpassword.font = [UIFont systemFontOfSize:18/ HEIGHTSIXP * HEIGHT];
    [self addSubview:self.configpassword];
    
    self.congigpass = [[UITextField alloc]initWithFrame:CGRectMake(120/WIDTHSIXP * WIDGHT, 280/ HEIGHTSIXP * HEIGHT, 245/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.congigpass.returnKeyType = UIReturnKeyDone;
    self.congigpass.delegate = self;
//    self.congigpass.placeholder = @"确认密码，必填";
    NSString *holderText4 = @"确认密码，必填   ";
    NSMutableAttributedString *placeholder4 = [[NSMutableAttributedString alloc]initWithString:holderText4];
    [placeholder4 addAttribute:NSForegroundColorAttributeName
                         value:[UIColor colorWithRed:0.7602 green:0.7602 blue:0.7602 alpha:1.0]
                         range:NSMakeRange(0, holderText4.length)];
    [placeholder4 addAttribute:NSFontAttributeName
                         value:[UIFont fontWithName:@"CourierNewPSMT" size:18.0/ HEIGHTSIXP * HEIGHT]
                         range:NSMakeRange(0, holderText4.length)];
    self.congigpass.attributedPlaceholder = placeholder4;
    self.congigpass.textAlignment = NSTextAlignmentRight;
//    self.congigpass.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.congigpass];
    
    UIView *view4 = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP * WIDGHT, 312/ HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    view4.backgroundColor = [UIColor colorWithRed:0.6431 green:0.6431 blue:0.6431 alpha:1.0];
    [self addSubview:view4];
    
    
    self.tijiao = [UIButton buttonWithType:UIButtonTypeCustom];
    self.tijiao.frame = CGRectMake(35/WIDTHSIXP * WIDGHT, 400/ HEIGHTSIXP * HEIGHT, 300/WIDTHSIXP * WIDGHT, 50/ HEIGHTSIXP * HEIGHT);
    [self.tijiao setTitle:@"确定提交" forState:UIControlStateNormal];
    [self.tijiao setBackgroundColor:[UIColor redColor]];
    
    [self.tijiao addTarget:self action:@selector(tijiaoAct) forControlEvents: UIControlEventTouchUpInside];
    [self addSubview:self.tijiao];

}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
     [self endEditing:YES];
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}
-(void)buttonmsgAct
{
    [self.delegate getVerificationCode:self.phonenum.text ];
}
- (void)tijiaoAct
{
    [self.delegate regist:self.phonenum.text  mima:self.congigpass.text yanzhengma:self.msg.text];
}
@end
