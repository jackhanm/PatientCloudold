//
//  loginViewControlller.m
//  LoginorRegiest
//
//  Created by yuhao on 16/8/1.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "loginViewControlller.h"
#import "forgotPasswordVC.h"
#import "registVC.h"
#import "AFNetworking.h"
#import "JkDataShare.h"
#import "UMSocial.h"
#import "JKdataBasehandle.h"
#import "ThirdLoginModel.h"
#import "UserInfoManager.h"
@interface loginViewControlller ()<UITextFieldDelegate>
@property (nonatomic, strong) UINavigationController *na ;
@end

@implementation loginViewControlller
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    

    
    self.image = [[UIImageView  alloc]init];
    self.image.frame = self.view.bounds;
    self.image.image = [UIImage imageNamed:@"login_register_background"] ;
    [self.view addSubview:self.image];
    [self createview];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)createview
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20 / WIDTHSIXP * WIDGHT, 40 / HEIGHTSIXP * HEIGHT, 30/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
//    [button setBackgroundColor:[UIColor orangeColor]];
    [button setImage:[UIImage imageNamed:@"chahao"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAct) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:button];
    

    
    
    
    UIView *viewlineone = [[UIView alloc]initWithFrame:CGRectMake(50/ WIDTHSIXP * WIDGHT, 170/ HEIGHTSIXP * HEIGHT, 270/ WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    viewlineone.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:viewlineone];
    

    [self imagelogin];
    
    
    self.fieldlogin= [[UITextField alloc]initWithFrame:CGRectMake(90 / WIDTHSIXP * WIDGHT, 185  / HEIGHTSIXP * HEIGHT,  210/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];

    NSString *holderText = @"请输入手机号";
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:holderText];
    [placeholder addAttribute:NSForegroundColorAttributeName
                       value:[UIColor whiteColor]
                       range:NSMakeRange(0, holderText.length)];
    [placeholder addAttribute:NSFontAttributeName
                       value:[UIFont fontWithName:@"CourierNewPSMT" size:15.0/ HEIGHTSIXP * HEIGHT]
                       range:NSMakeRange(0, holderText.length)];
    self.fieldlogin.attributedPlaceholder = placeholder;
      self.fieldlogin.clearButtonMode = UITextFieldViewModeAlways;
    self.fieldlogin.delegate = self;
      self.fieldlogin.clearsOnBeginEditing = YES;
    self.fieldlogin.clearButtonMode = YES;
//    self.fieldlogin.backgroundColor = [UIColor clearColor];
    self.fieldlogin.borderStyle = UITextBorderStyleNone;
     self.fieldlogin.keyboardType =  UIKeyboardTypeNumberPad;
    self.fieldlogin.textColor = [UIColor whiteColor];
    [self.view addSubview:self.fieldlogin];

    
    UIView *viewlinesen = [[UIView alloc]initWithFrame:CGRectMake(50/ WIDTHSIXP * WIDGHT, 220/ HEIGHTSIXP * HEIGHT, 270/ WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    viewlinesen.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewlinesen];
    
    
    self.imagepassword = [[UIImageView alloc]initWithFrame:CGRectMake(60/ WIDTHSIXP * WIDGHT, 235/ HEIGHTSIXP * HEIGHT, 20/ WIDTHSIXP * WIDGHT, 20/ HEIGHTSIXP * HEIGHT)];
    self.imagepassword.backgroundColor = [UIColor whiteColor];
    self.imagepassword.image = [UIImage imageNamed: @"mima1"];
    [self.view addSubview:self.imagepassword];
    
    self.fieldpassword= [[UITextField alloc]initWithFrame:CGRectMake(90 / WIDTHSIXP * WIDGHT, 235 / HEIGHTSIXP * HEIGHT ,  210/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.fieldpassword.returnKeyType = UIReturnKeyDefault;
    self.fieldpassword.delegate = self;
    NSString *holderText1 = @"请输入密码";
    NSMutableAttributedString *placeholder1 = [[NSMutableAttributedString alloc]initWithString:holderText1];
    [placeholder1 addAttribute:NSForegroundColorAttributeName
                        value:[UIColor whiteColor]
                        range:NSMakeRange(0, holderText1.length)];
    [placeholder1 addAttribute:NSFontAttributeName
                        value:[UIFont fontWithName:@"CourierNewPSMT" size:15.0/ HEIGHTSIXP * HEIGHT]
                        range:NSMakeRange(0, holderText1.length)];
    self.fieldpassword.attributedPlaceholder = placeholder1;
    self.fieldpassword.clearButtonMode = UITextFieldViewModeAlways;
    self.fieldpassword.delegate = self;
    self.fieldpassword.clearsOnBeginEditing = YES;
    self.fieldpassword.clearButtonMode = YES;
    self.fieldpassword.secureTextEntry = YES;
    self.fieldpassword.backgroundColor = [UIColor clearColor];
    self.fieldpassword.borderStyle = UITextBorderStyleNone;
    self.fieldpassword.textColor = [UIColor whiteColor];
    self.fieldpassword.keyboardType =  UIKeyboardTypeNumbersAndPunctuation;
    [self.view addSubview:self.fieldpassword];

    UIView *viewlinethrid = [[UIView alloc]initWithFrame:CGRectMake(50/ WIDTHSIXP * WIDGHT, 270/ HEIGHTSIXP * HEIGHT, 270/ WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    viewlinethrid.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewlinethrid];
    
    self.forgetlabel = [[UILabel alloc]initWithFrame:CGRectMake(250/ WIDTHSIXP * WIDGHT, 280/ HEIGHTSIXP * HEIGHT, 80/ WIDTHSIXP * WIDGHT, 20/ HEIGHTSIXP * HEIGHT)];
    self.forgetlabel.textColor = [UIColor whiteColor];
    self.forgetlabel.font = [UIFont systemFontOfSize:15/ HEIGHTSIXP * HEIGHT];
    self.forgetlabel.text = @"忘记密码？" ;
    self.forgetlabel.userInteractionEnabled = YES ;
    [self.view addSubview:self.forgetlabel];
    
    
    UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ForgetACT)];
    [self.forgetlabel addGestureRecognizer:tap];
    
    
    self.loginbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.loginbutton setFrame:CGRectMake(50/ WIDTHSIXP * WIDGHT, 330/ HEIGHTSIXP * HEIGHT, 270/ WIDTHSIXP * WIDGHT, 40/ HEIGHTSIXP * HEIGHT)];
    self.loginbutton.backgroundColor = [UIColor orangeColor];
    [self.loginbutton setTitle:@"login" forState:UIControlStateNormal];
    [self.loginbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginbutton.layer.cornerRadius = 5;
    self.loginbutton.layer.masksToBounds = YES;
//    [self.loginbutton setImage:[UIImage imageNamed:@"loginBtnBg"] forState:UIControlStateNormal];
//      [self.loginbutton setImage:[UIImage imageNamed:@"loginBtnBgClick"] forState:UIControlStateSelected];
    [self.loginbutton addTarget:self action:@selector(buttonlogin) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:self.loginbutton];
    
    self.registlabel = [[UILabel alloc]initWithFrame:CGRectMake(170/ WIDTHSIXP * WIDGHT, 400/ HEIGHTSIXP * HEIGHT, 160/ WIDTHSIXP * WIDGHT, 20/ HEIGHTSIXP * HEIGHT)];
    self.registlabel.text = @"还没有帐号？立即注册";
    self.registlabel.font = [UIFont systemFontOfSize:15/ HEIGHTSIXP * HEIGHT];
    self.registlabel.textColor = [UIColor whiteColor];
    self.registlabel.textColor = [UIColor redColor];
    self.registlabel.userInteractionEnabled = YES;
//    self.registlabel.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.registlabel];
    
    self.otherlogin =  [[UILabel alloc]initWithFrame:CGRectMake(120/WIDTHSIXP * WIDGHT, 450/ HEIGHTSIXP * HEIGHT, 120/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    self.otherlogin.textColor = [UIColor whiteColor];
    self.otherlogin.text = @" 其它方式登录";
    self.otherlogin.textAlignment = NSTextAlignmentCenter;
    self.otherlogin.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:self.otherlogin];
    
    UIView *viewline = [[UIView alloc]initWithFrame:CGRectMake(10/WIDTHSIXP * WIDGHT, 465/ HEIGHTSIXP * HEIGHT, 110/ WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    viewline.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewline];
    
    UIView *viewlinetwo = [[UIView alloc]initWithFrame:CGRectMake(240/WIDTHSIXP * WIDGHT, 465/ HEIGHTSIXP * HEIGHT, 120/ WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT)];
    viewlinetwo.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewlinetwo];
    
    
    UITapGestureRecognizer *registtap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(RegistAct)];
    [self.registlabel addGestureRecognizer:registtap];
    
    
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(330/ WIDTHSIXP * WIDGHT, 403/ HEIGHTSIXP * HEIGHT, 16/ WIDTHSIXP * WIDGHT, 16/ HEIGHTSIXP * HEIGHT)];
//    image1.backgroundColor = [UIColor whiteColor];
    image1.image = [UIImage imageNamed:@"jiantou16"];
    image1.userInteractionEnabled =YES;
    [self.view addSubview:image1];
    
    
    
    
    
    UIButton *qqlogin = [UIButton buttonWithType:UIButtonTypeCustom];
    qqlogin.frame = CGRectMake(70 / WIDTHSIXP * WIDGHT, 510 / HEIGHTSIXP * HEIGHT, 32 / WIDTHSIXP * WIDGHT, 32 / HEIGHTSIXP * HEIGHT);
    [qqlogin setBackgroundColor:[UIColor clearColor]];
    [qqlogin setImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
    [qqlogin addTarget:self action:@selector(qqloginAct) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:qqlogin];
    
    UIButton *weixinlogin = [UIButton buttonWithType:UIButtonTypeCustom];
    weixinlogin.frame = CGRectMake(175  / WIDTHSIXP * WIDGHT, 510 / HEIGHTSIXP * HEIGHT, 32 / WIDTHSIXP * WIDGHT, 32 / HEIGHTSIXP * HEIGHT);
    [weixinlogin setBackgroundColor:[UIColor clearColor]];
     [weixinlogin setImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
    [weixinlogin addTarget:self action:@selector(weixinloginAct) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:weixinlogin];
    
    UIButton *sinalogin = [UIButton buttonWithType:UIButtonTypeCustom];
    sinalogin.frame = CGRectMake(270 / WIDTHSIXP * WIDGHT, 510 / HEIGHTSIXP * HEIGHT, 32 / WIDTHSIXP * WIDGHT, 32 / HEIGHTSIXP * HEIGHT);
    [sinalogin setBackgroundColor:[UIColor clearColor]];
      [sinalogin setImage:[UIImage imageNamed:@"sina"] forState:UIControlStateNormal];
    [sinalogin addTarget:self action:@selector(sinaloginAct) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:sinalogin];
    
    
    

//    [image1 addGestureRecognizer:registtap];
}
- (void)qqloginAct
{
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            NSDictionary *dic = [NSDictionary dictionaryWithDictionary:response.thirdPlatformUserProfile];
                 NSDictionary *userDic = @{
                                       @"user_realname":@"",
                                      @"user_name" : snsAccount.userName,
                                      @"user_phone":@"",
                                       @"user_identifyid":@"",
                                       @"user_address":@"",
                                       @"user_id":@"",
                                      @"usid" : snsAccount.usid,
                                     
                                      @"picture_path" : [dic objectForKey:@"figureurl_qq_2"],
                                      };
            
            
            [[NSUserDefaults standardUserDefaults]setObject:userDic forKey:wUserInfo];
            
            [JkDataShare shareDatabase].isTHirdLoginInfo = YES;
            
            [[JKdataBasehandle shareDatabase] openDB];
            [[JKdataBasehandle shareDatabase] createThirdLoginfoTable];

          NSMutableArray *Arr =   [[JKdataBasehandle shareDatabase] selectAllThirdLoginUser];
            NSLog(@"%ld", [[[JKdataBasehandle shareDatabase] selectAllThirdLoginUser] count]);
            if (Arr.count == 0 ) {
                ThirdLoginModel *model = [[ThirdLoginModel alloc]init];
                
                
                model.thirdusername =snsAccount.userName;
                model.usid = snsAccount.usid;
                model.tocken =snsAccount.accessToken;
                model.figureurl_qq_2 = [dic objectForKey:@"figureurl_qq_2"];
                model.phonenum = @"";
                [[JKdataBasehandle shareDatabase] insertdataWithThirdloginModel:model];
                [JkDataShare shareDatabase].isLogin = YES;
                [JkDataShare shareDatabase].isThirdLogin = YES;

            } else {
            for (ThirdLoginModel *model in Arr) {
                if ([model.usid isEqualToString:snsAccount.usid]) {
                    NSLog(@"有了");
                
                    [JkDataShare shareDatabase].isLogin = YES;
                    [JkDataShare shareDatabase].isThirdLogin = YES;

                     break;

                } else {
                    ThirdLoginModel *model = [[ThirdLoginModel alloc]init];
                    
                    
                    model.thirdusername =snsAccount.userName;
                    model.usid = snsAccount.usid;
                    model.tocken =snsAccount.accessToken;
                    model.figureurl_qq_2 = [dic objectForKey:@"figureurl_qq_2"];
                    model.phonenum = @"";
                    [[JKdataBasehandle shareDatabase] insertdataWithThirdloginModel:model];
                    [JkDataShare shareDatabase].isLogin = YES;
                    [JkDataShare shareDatabase].isThirdLogin = YES;
                }
            }
           
            }
            
            
                    [self dismissViewControllerAnimated:YES completion:^{
                
                                          

            }];

            
        }});}
- (void)weixinloginAct
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
                             NSDictionary *userDic = @{
                                      @"user_realname" : @"",
                                      @"user_name" : snsAccount.userName,
                                      @"user_phone" : @"",
                                      @"user_identifyid" :snsAccount.usid,
                                      @"user_address" : @"",
                                      @"picture_path" : [response.thirdPlatformResponse objectForKey:@"figureurl_qq_2"],
                                      };
            
            [[NSUserDefaults standardUserDefaults]setObject:userDic forKey:wUserInfo];
            [JkDataShare shareDatabase].isLogin = YES;
             [JkDataShare shareDatabase].isThirdLogin = YES;
             [self dismissViewControllerAnimated:YES completion:nil];

            
            
        }
        
    });

    
}
- (void)sinaloginAct
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            NSDictionary *userDic = @{
                                      @"user_realname" : @"",
                                      @"user_name" : snsAccount.userName,
                                      @"user_phone" : @"",
                                      @"user_identifyid" :@"",
                                      @"user_address" : @"",
                                      @"picture_path" : [response.thirdPlatformResponse objectForKey:@"figureurl_qq_2"],
                                      };
            
            [[NSUserDefaults standardUserDefaults]setObject:userDic forKey:wUserInfo];
            [JkDataShare shareDatabase].isLogin = YES;
             [JkDataShare shareDatabase].isThirdLogin = YES;
            
            [self dismissViewControllerAnimated:YES completion:nil];

            
        }});
}
#pragma mark 登陆
- (void)buttonlogin
{
    NSDictionary *parameters = @{@"username" : self.fieldlogin.text, //诊断号
                                 
                                 @"password" : self.fieldpassword.text//
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
                                      @"user_name" : [[[responseObject objectForKey:@"data"] objectForKey:@"user_name"] isEqual: [NSNull null]] ? @"":[[responseObject objectForKey:@"data"] objectForKey:@"cuser_name"],
                                      @"user_phone" : [[[responseObject objectForKey:@"data"] objectForKey:@"user_phone"] isEqual: [NSNull null]] ? @"":[[responseObject objectForKey:@"data"] objectForKey:@"user_phone"],
                                       @"user_identifyid" : [[[responseObject objectForKey:@"data"] objectForKey:@"user_identify_code"] isEqual: [NSNull null]] ? @"":[[responseObject objectForKey:@"data"] objectForKey:@"user_identify_code"],
                                        @"user_address" : [[[responseObject objectForKey:@"data"] objectForKey:@"user_province"] isEqual: [NSNull null]] ? @"":[[responseObject objectForKey:@"data"] objectForKey:@"user_province"],
                                         @"user_id" : [[[responseObject objectForKey:@"data"] objectForKey:@"user_id"] isEqual: [NSNull null]] ? @"":[[responseObject objectForKey:@"data"] objectForKey:@"user_id"],
                                        @"picture_path" : [[[responseObject objectForKey:@"data"] objectForKey:@"picture_path"] isEqual: [NSNull null]] ? @"":[[responseObject objectForKey:@"data"] objectForKey:@"picture_path"],
                                      };
            
            [[NSUserDefaults standardUserDefaults]setObject:userDic forKey:wUserInfo];
            [JkDataShare shareDatabase].isLogin = YES;
            [JkDataShare shareDatabase].userID = [[responseObject objectForKey:@"data"] objectForKey:@"user_id"];
            NSLog(@"%@", [JkDataShare shareDatabase].userID);
           
            
            [[NSUserDefaults standardUserDefaults] setObject:self.fieldlogin.text forKey:@"user"];
            [[NSUserDefaults standardUserDefaults] setObject:self.fieldpassword.text  forKey:@"key"];
            

        
        }
    } failure:^(NSURLSessionDataTask *task, NSError * error) {
        NSLog(@"请求失败,服务器返回的信息%@",error);     }];

}
#pragma mark 忘记密码
- (void)ForgetACT
{
    NSLog(@"1111");
    forgotPasswordVC *forgetlabel = [[forgotPasswordVC alloc]init];
    [self.navigationController pushViewController:forgetlabel animated:YES];
  
    
    
}
#pragma mark 注册帐号
- (void)RegistAct
{
    registVC *regist = [[registVC alloc]init];
    [self.navigationController pushViewController:regist animated:YES];
}
- (void)buttonAct
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (UIImageView *)imagelogin
{
    if (!_imagelogin) {
        _imagelogin =   [[UIImageView alloc]initWithFrame:CGRectMake(60/ WIDTHSIXP * WIDGHT, 185/ HEIGHTSIXP * HEIGHT, 20/ WIDTHSIXP * WIDGHT, 20/ HEIGHTSIXP * HEIGHT)];
        _imagelogin.backgroundColor = [UIColor whiteColor];
        _imagelogin.image = [UIImage imageNamed:@"touxiang"];
        [self.view addSubview:_imagelogin];
    }
    return _imagelogin;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
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
