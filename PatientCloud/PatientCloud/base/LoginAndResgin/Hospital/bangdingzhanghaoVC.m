//
//  bangdingzhanghaoVC.m
//  PatientCloud
//
//  Created by yuhao on 16/8/24.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "bangdingzhanghaoVC.h"
#import "JKCountDownButton.h"
#import "AFNetworking.h"
#import "JKAFNetTool.h"
#import "UserInfoManager.h"
#import "JkDataShare.h"
#import "JKdataBasehandle.h"
#import "ThirdLoginModel.h"
#import "UserInfoManager.h"

@interface bangdingzhanghaoVC ()<UITextFieldDelegate>

@property (nonatomic, assign) NSInteger number;
@property  (nonatomic, copy)NSString *randomNumber;
@end

@implementation bangdingzhanghaoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"绑定帐号";
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
    self.phonenum.returnKeyType = UIReturnKeyDone;
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
    
    [self.view addSubview:self.msg];
    
    
    self.msgbutton = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
    self.msgbutton .frame = CGRectMake(265/WIDTHSIXP * WIDGHT, 145/ HEIGHTSIXP * HEIGHT, 100/WIDTHSIXP * WIDGHT, 40/ HEIGHTSIXP * HEIGHT);
    [self.msgbutton setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.msgbutton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.msgbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //    self.msgbutton.layer.borderWidth = 1;
    self.msgbutton.layer.borderColor = [[UIColor redColor] CGColor];
    [self.msgbutton  addTarget:self action:@selector(buttonmsgAct) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:self.msgbutton ];
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
    
    self.newpassword = [[UILabel alloc]initWithFrame:CGRectMake(10/WIDTHSIXP * WIDGHT, 215/ HEIGHTSIXP * HEIGHT, 100/WIDTHSIXP * WIDGHT, 40/ HEIGHTSIXP * HEIGHT)];
    self.newpassword.text = @"密码";
    //    self.newpassword.backgroundColor = [UIColor orangeColor];
    self.newpassword.font = [UIFont systemFontOfSize:18/ HEIGHTSIXP * HEIGHT];
    [self.view addSubview:self.newpassword];
    
    self.newpass = [[UITextField alloc]initWithFrame:CGRectMake(120/WIDTHSIXP * WIDGHT, 220/ HEIGHTSIXP * HEIGHT, 245/WIDTHSIXP * WIDGHT, 40/ HEIGHTSIXP * HEIGHT)];
    self.newpass.returnKeyType = UIReturnKeyDone;
    self.newpass.delegate = self;
    
    NSString *holderText3 = @"请输入密码   ";
    NSMutableAttributedString *placeholder3 = [[NSMutableAttributedString alloc]initWithString:holderText3];
    [placeholder3 addAttribute:NSForegroundColorAttributeName
                         value:[UIColor colorWithRed:0.7602 green:0.7602 blue:0.7602 alpha:1.0]
                         range:NSMakeRange(0, holderText3.length)];
    [placeholder3 addAttribute:NSFontAttributeName
                         value:[UIFont fontWithName:@"CourierNewPSMT" size:18.0/ HEIGHTSIXP * HEIGHT]
                         range:NSMakeRange(0, holderText3.length)];
    self.newpass.attributedPlaceholder = placeholder3;
    self.newpass.textAlignment = NSTextAlignmentRight;
    self.newpass.secureTextEntry = YES;
    //    self.newpass.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.newpass];
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP * WIDGHT, 261/ HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    view3.backgroundColor = [UIColor colorWithRed:0.6431 green:0.6431 blue:0.6431 alpha:1.0];
    [self.view addSubview:view3];

    
    self.tijiao = [UIButton buttonWithType:UIButtonTypeCustom];
    self.tijiao.frame = CGRectMake(35/WIDTHSIXP * WIDGHT, 300/ HEIGHTSIXP * HEIGHT, 300/WIDTHSIXP * WIDGHT, 50/ HEIGHTSIXP * HEIGHT);
    [self.tijiao setTitle:@"绑定帐号" forState:UIControlStateNormal];
    [self.tijiao setBackgroundColor:[UIColor redColor]];
    
    [self.tijiao addTarget:self action:@selector(tijiaoAct) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:self.tijiao];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP * WIDGHT, 191/ HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    view2.backgroundColor = [UIColor colorWithRed:0.6431 green:0.6431 blue:0.6431 alpha:1.0];
    [self.view addSubview:view2];

}
- (void)buttonmsgAct
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
    

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
#pragma MARK  要先验证密码是否正确
- (void)tijiaoAct
{
    if ([self yanzhengma]) {
        
        [[JKdataBasehandle shareDatabase] openDB];
        [[JKdataBasehandle shareDatabase] deleteDataWithThirdloginModel:[UserInfoManager manager].usid];
        ThirdLoginModel *model = [[ThirdLoginModel alloc]init];
        //
 
        model.thirdusername = [[UserInfoManager manager] user_name];
        model.usid = [[UserInfoManager manager] usid];
        model.iconUrl = [[UserInfoManager manager] picture_path];
        model.phonenum = self.phonenum.text;
        model.message = self.newpass.text;
        [[JKdataBasehandle shareDatabase] insertdataWithThirdloginModel:model];

     NSLog(@"%@",  [[JKdataBasehandle shareDatabase] selectByUseridOfuser:[UserInfoManager manager].usid])  ;
        [self showHint:@"绑定成功"];
        [JkDataShare shareDatabase].isThirdLogin = NO;
        NSDictionary *userDic = @{
                                  @"user_realname":@"",
                                  @"user_name" : [UserInfoManager manager].user_name,
                                  @"user_phone":self.phonenum.text,
                                  @"user_identifyid":@"",
                                  @"user_address":@"",
                                  @"user_id":@"",
                                  @"usid" : [UserInfoManager manager].usid,
                                  
                                  @"picture_path" :[UserInfoManager manager].picture_path,
                                  };
        
        
        [[NSUserDefaults standardUserDefaults]setObject:userDic forKey:wUserInfo];
      
                    }
//绑定成功以后再登录
    ThirdLoginModel *model = [[[JKdataBasehandle shareDatabase]selectByUseridOfuser:[UserInfoManager manager].usid] objectAtIndex:0];
    NSDictionary *parameters = @{@"username" : model.phonenum, //诊断号
                                 
                                 @"password" : model.message//
                                 };
    
    NSString *urlString = @"http://wx.yunjiaopian.net/app/index.php/home/index/PatientLogin";
    
    AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
    
    //进行POST请求
    [managers POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"请求成功，服务器返回的信息%@",responseObject);
        if ([[responseObject objectForKey:@"code"] isEqualToString:@"0"]) {
            [self dismissViewControllerAnimated:YES completion:nil];
            
            NSDictionary *userDic = @{
                                      @"user_realname" : [[[responseObject objectForKey:@"data"] objectForKey:@"user_realname"] isEqual: [NSNull null]] ? @"":[[responseObject objectForKey:@"data"] objectForKey:@"user_realname"],
                                      @"user_name" : model.thirdusername,
                                      @"user_phone" : [[[responseObject objectForKey:@"data"] objectForKey:@"user_phone"] isEqual: [NSNull null]] ? @"":[[responseObject objectForKey:@"data"] objectForKey:@"user_phone"],
                                      @"user_identifyid" : [[[responseObject objectForKey:@"data"] objectForKey:@"user_identify_code"] isEqual: [NSNull null]] ? @"":[[responseObject objectForKey:@"data"] objectForKey:@"user_identify_code"],
                                      @"user_address" : [[[responseObject objectForKey:@"data"] objectForKey:@"user_province"] isEqual: [NSNull null]] ? @"":[[responseObject objectForKey:@"data"] objectForKey:@"user_province"],
                                      @"user_id" : [[[responseObject objectForKey:@"data"] objectForKey:@"user_id"] isEqual: [NSNull null]] ? @"":[[responseObject objectForKey:@"data"] objectForKey:@"user_id"],
                                      @"picture_path" : [[[responseObject objectForKey:@"data"] objectForKey:@"picture_path"]isEqualToString:@""] ? model.iconUrl:[[responseObject objectForKey:@"data"] objectForKey:@"picture_path"],
                                      @"usid" : model.usid,
                                      
                                      
                                      };
            
            [[NSUserDefaults standardUserDefaults]setObject:userDic forKey:wUserInfo];
            [JkDataShare shareDatabase].isLogin = YES;
            [JkDataShare shareDatabase].isTHirdLoginInfo = NO;
            [JkDataShare shareDatabase].userID = [[UserInfoManager manager] user_id];
            NSLog(@"%@", [JkDataShare shareDatabase].userID);
            
            
            [[NSUserDefaults standardUserDefaults] setObject:model.phonenum forKey:@"user"];
            [[NSUserDefaults standardUserDefaults] setObject:model.message  forKey:@"key"];

            
            
        }
    } failure:^(NSURLSessionDataTask *task, NSError * error) {
        NSLog(@"请求失败,服务器返回的信息%@",error);     }];
    

    [self.navigationController popViewControllerAnimated:YES];
    

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
