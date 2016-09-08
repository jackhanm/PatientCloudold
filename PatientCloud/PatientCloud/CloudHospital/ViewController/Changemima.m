//
//  Changemima.m
//  PatientCloud
//
//  Created by yuhao on 16/8/4.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "Changemima.h"
#import "JKCountDownButton.h"
#import "AFNetworking.h"

@interface Changemima ()
@property  (nonatomic, copy)NSString *randomNumber;
@property (nonatomic, assign) NSInteger number;
@end

@implementation Changemima

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"修改密码";
    self.view.backgroundColor = [UIColor whiteColor];
    [self createview];
    // Do any additional setup after loading the view.
}
- (void)createview
{
    self.labelphonenum = [[UILabel alloc]initWithFrame:CGRectMake(10/WIDTHSIXP * WIDGHT, 95/ HEIGHTSIXP * HEIGHT, 100/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.labelphonenum.text = @"手机号码";
    
    //    self.labelphonenum.backgroundColor = [UIColor orangeColor];
    self.labelphonenum.font = [UIFont systemFontOfSize:18/ HEIGHTSIXP * HEIGHT];
    [self.view addSubview:self.labelphonenum];
    
    
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
    //    self.phonenum.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.phonenum];
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP * WIDGHT, 131/ HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    view1.backgroundColor = [UIColor colorWithRed:0.6431 green:0.6431 blue:0.6431 alpha:1.0];
    [self.view addSubview:view1];
    
    
    self.labelmsg = [[UILabel alloc]initWithFrame:CGRectMake(10/WIDTHSIXP * WIDGHT, 155/ HEIGHTSIXP * HEIGHT, 100/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.labelmsg.text = @"短信验证码";
    //    self.labelmsg.backgroundColor = [UIColor orangeColor];
    self.labelmsg.font = [UIFont systemFontOfSize:18/ HEIGHTSIXP * HEIGHT];
    [self.view addSubview:self.labelmsg];
    
    
    self.msg = [[UITextField alloc]initWithFrame:CGRectMake(120/WIDTHSIXP * WIDGHT, 160/ HEIGHTSIXP * HEIGHT, 145/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    
    NSString *holderText2 =  @"验证码，必填";
    NSMutableAttributedString *placeholder2 = [[NSMutableAttributedString alloc]initWithString:holderText2];
    [placeholder2 addAttribute:NSForegroundColorAttributeName
                         value:[UIColor colorWithRed:0.7602 green:0.7602 blue:0.7602 alpha:1.0]
                         range:NSMakeRange(0, holderText2.length)];
    [placeholder2 addAttribute:NSFontAttributeName
                         value:[UIFont fontWithName:@"CourierNewPSMT" size:18.0/ HEIGHTSIXP * HEIGHT]
                         range:NSMakeRange(0, holderText2.length)];
    self.msg.attributedPlaceholder = placeholder2;
    
    [self.view addSubview:self.msg];
    
    
    self.msgbutton = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
    self.msgbutton .frame = CGRectMake(265/WIDTHSIXP * WIDGHT, 155/ HEIGHTSIXP * HEIGHT, 100/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    [self.msgbutton setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.msgbutton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.msgbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.msgbutton.layer.borderWidth = 1;
    self.msgbutton.layer.borderColor = [[UIColor redColor] CGColor];
    [self.msgbutton  addTarget:self action:@selector(buttonmsgAct) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:self.msgbutton ];
    [_msgbutton  countDownButtonHandler:^(JKCountDownButton*sender, NSInteger tag) {
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
        
    }];
    
    
    
    
    
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP * WIDGHT, 191/ HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    view2.backgroundColor = [UIColor colorWithRed:0.6431 green:0.6431 blue:0.6431 alpha:1.0];
    [self.view addSubview:view2];
    
    self.newpassword = [[UILabel alloc]initWithFrame:CGRectMake(10/WIDTHSIXP * WIDGHT, 215/ HEIGHTSIXP * HEIGHT, 100/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.newpassword.text = @"新密码";
    //    self.newpassword.backgroundColor = [UIColor orangeColor];
    self.newpassword.font = [UIFont systemFontOfSize:18/ HEIGHTSIXP * HEIGHT];
    [self.view addSubview:self.newpassword];
    
    self.newpass = [[UITextField alloc]initWithFrame:CGRectMake(120/WIDTHSIXP * WIDGHT, 220/ HEIGHTSIXP * HEIGHT, 245/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    
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
    [self.view addSubview:self.newpass];
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP * WIDGHT, 251/ HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    view3.backgroundColor = [UIColor colorWithRed:0.6431 green:0.6431 blue:0.6431 alpha:1.0];
    [self.view addSubview:view3];
    
    
    self.configpassword = [[UILabel alloc]initWithFrame:CGRectMake(10/WIDTHSIXP * WIDGHT, 275/ HEIGHTSIXP * HEIGHT, 100/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.configpassword.text = @"确认密码";
    
    
    //    self.configpassword.backgroundColor = [UIColor orangeColor];
    self.configpassword.font = [UIFont systemFontOfSize:18/ HEIGHTSIXP * HEIGHT];
    [self.view addSubview:self.configpassword];
    
    self.congigpass = [[UITextField alloc]initWithFrame:CGRectMake(120/WIDTHSIXP * WIDGHT, 280/ HEIGHTSIXP * HEIGHT, 245/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
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
    [self.view addSubview:self.congigpass];
    
    UIView *view4 = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP * WIDGHT, 312/ HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    view4.backgroundColor = [UIColor colorWithRed:0.6431 green:0.6431 blue:0.6431 alpha:1.0];
    [self.view addSubview:view4];
    
    
    self.tijiao = [UIButton buttonWithType:UIButtonTypeCustom];
    self.tijiao.frame = CGRectMake(30/WIDTHSIXP * WIDGHT, 340/ HEIGHTSIXP * HEIGHT, 300/WIDTHSIXP * WIDGHT, 40/ HEIGHTSIXP * HEIGHT);
    [self.tijiao setTitle:@"确定提交" forState:UIControlStateNormal];
    [self.tijiao setBackgroundColor:[UIColor redColor]];
    
    [self.tijiao addTarget:self action:@selector(tijiaoAct) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:self.tijiao];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
-(void)buttonmsgAct
{
    self.number = (arc4random() % 10000) ;
    self.randomNumber = [NSString stringWithFormat:@"%.4ld", (long)self.number];
    NSDictionary *parameters = @{@"account" : @"003008", //
                                 @"pswd" : @"Sd123456"  ,
                                 @"mobile" : self.phonenum.text,
                                 @"msg":     [NSString stringWithFormat:@"您好，您的验证码是：%@", self.randomNumber]  ,
                                 @"needstatus" : @"true",
                                 
                                 };
    
    NSString *urlString = @"http://120.26.69.248/msg/HttpSendSM";
    //
    AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
    managers.responseSerializer = [AFHTTPResponseSerializer serializer];
    [managers.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/x-javascript",@"image/jpeg", nil]];
    //进行POST请求
    [managers POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"请求成功，服务器返回的信息%@",responseObject );
        NSString *result  =[[ NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"请求成功，服务器返回的信息%@",result );
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //        NSLog(@"%@",dic);
        
    } failure:^(NSURLSessionDataTask *task, NSError * error) {
        NSLog(@"请求失败,服务器返回的信息%@",error);
    }];
    
    //

}
- (void)tijiaoAct
{

    
    if ([self yanzhengma]) {
        if ([self yanzhengmima]) {
            NSDictionary *parameters = @{@"username" : self.phonenum.text, //
                                         @"newpassword" : self.congigpass.text                                                                    };
            
            NSString *urlString = @"http://wx.yunjiaopian.net/app/index.php/home/index/resetPassword";
            
            AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
            
            //进行POST请求
            [managers POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                NSLog(@"请求成功，服务器返回的信息%@",responseObject);
                if ([[responseObject objectForKey:@"code"] isEqualToString:@"3"]) {
                    
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"保存失败" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *right = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                        
                    }];
                    UIAlertAction *left= [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                        
                    }];
                    [alert addAction:right];
                    [alert addAction:left];
                    
                    [self presentViewController:alert animated:YES completion:^{
                        
                        
                    }];
                    
                }
                
                
            } failure:^(NSURLSessionDataTask *task, NSError * error) {
                NSLog(@"请求失败,服务器返回的信息%@",error);
            }];
        }
        
    }


}
- (BOOL )yanzhengma
                {
                    if (![self.msg.text isEqualToString:self.randomNumber]) {
                        
                        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证码输入有误" preferredStyle:UIAlertControllerStyleAlert];
                        UIAlertAction *right = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
                            
                        }];
                        UIAlertAction *left= [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
                            
                        }];
                        [alert addAction:right];
                        [alert addAction:left];
                        
                        [self presentViewController:alert animated:YES completion:^{
                            
                            
                        }];
                        return NO;
                    }else {
                        return YES;
                    }
                }

- (BOOL)yanzhengmima
{
    if (![self.newpass.text isEqualToString:self.congigpass.text]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"两次输入密码不一致" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *right = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
        }];
        UIAlertAction *left= [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
        }];
        [alert addAction:right];
        [alert addAction:left];
        
        [self presentViewController:alert animated:YES completion:^{
            
            
        }];
        return NO ;
        
    }else {
        return YES;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
