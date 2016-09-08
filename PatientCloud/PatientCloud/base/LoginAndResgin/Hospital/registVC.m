//
//  registVC.m
//  PatientCloud
//
//  Created by yuhao on 16/8/2.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "registVC.h"
#import "forgotPassview.h"
#import "AFNetworking.h"
#import "JKdataBasehandle.h"
#import "JKAFNetTool.h"
#import "UserInfoManager.h"
#import "JkDataShare.h"
@interface registVC ()<forgotPassviewdelegate>
@property (nonatomic, retain)  forgotPassview *viewq;
@property (nonatomic, assign) NSInteger number;
@property  (nonatomic, copy)NSString *randomNumber;
@end

@implementation registVC
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.viewq = [[forgotPassview alloc]initWithFrame:self.view.bounds];
      self.viewq.newpassword.text = @"密码";
  
    self.viewq.delegate = self;
    
    [self.view addSubview:self.viewq];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.viewq.delegate = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"注册帐号";
//    self.viewq = [[forgotPassview alloc]initWithFrame:self.view.bounds];
//    self.viewq.delegate =  self;
  
//    [self.view addSubview:self.viewq];
    // Do any additional setup after loading the view.
}
#pragma mark 实现协议办法
-(void)regist:(NSString *)phone mima:(NSString *)mima yanzhengma:(NSString *)yanzhengma
{

    if ([self.navigationItem.title isEqualToString: @"注册帐号"]) {
        
        if ([self yanzhengma]) {
            if ([self yanzhengmima]) {
                NSDictionary *parameters = @{@"username" : phone, //
                                             @"password" : mima                                                                    };
                
                NSString *urlString = @"http://wx.yunjiaopian.net/app/index.php/home/index/PatientRegister";
                
                AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
                
                //进行POST请求
                [managers POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                    NSLog(@"请求成功，服务器返回的信息%@",responseObject);
                    if ([[responseObject objectForKey:@"code"] isEqualToString:@"0"]) {
                        [self showHint:@"注册成功"];
                        if (self.isThirdLogin == YES) {
                            [[JKdataBasehandle shareDatabase] openDB];
                            [[JKdataBasehandle shareDatabase] upDataWithThirdloginModelwithsuerid:[UserInfoManager manager].usid ThirdloginModel:nil phonenum: self.viewq.phonenum.text];
                       
                            [JkDataShare shareDatabase].isThirdLogin = NO;
                        }
                        
                        
                    }
                    
                    
                    if ([[responseObject objectForKey:@"code"] isEqualToString:@"8"]) {
                          
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户已存在" preferredStyle:UIAlertControllerStyleAlert];
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

    
        }
- (BOOL )yanzhengma
{
   
    
        if (self.viewq.phonenum.text.length > 0) {
            if (![self.viewq.msg.text isEqualToString:self.randomNumber]) {
                
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
        }else {
            [self showHint:@"请先输入手机号"];
            return NO;
        }

    
}
- (BOOL)yanzhengmima
{
    if (![self.viewq.newpass.text isEqualToString:self.viewq.congigpass.text]) {
          
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
- (void)getVerificationCode:(NSString *)phonenum
{

    self.number = (arc4random() % 10000) ;
    self.randomNumber = [NSString stringWithFormat:@"%.4ld", (long)self.number];
    NSDictionary *parameters = @{@"account" : @"003008", //
                                 @"pswd" : @"Sd123456"  ,
                                 @"mobile" : self.viewq.phonenum.text,
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

   

  }
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
