//
//  SickerAppliersadviseViewController.m
//  Cloudhospital
//
//  Created by yuhao on 16/7/5.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "SickerAppliersadviseViewController.h"
#import "AFNetworking.h"
//#import "SickerAppliers.h"
#import "AES128Util.h"
#import "NSData+ASE128.h"
@interface SickerAppliersadviseViewController ()<UITextViewDelegate>

@end

@implementation SickerAppliersadviseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"签名" style:UIBarButtonItemStylePlain target:self action:@selector(rightACt)];
    
    [self createview];
    // Do any additional setup after loading the view.
}
- (void)rightACt
{
//    if (self.DoctorAdvise.text.length < 1) {
//        NSLog(@" 签名信息不能是空");
//        return;
//    }
//    NSString * url =@"http://192.168.0.30:9080/TestWeb/test/getOriginalText";
//    NSDictionary * dict = @{
//                            @"originalText":@"我是"
//                            };
////    NSLog(@"self.orginalText.text = %@",self.orginalText.text);
//    NSData * json = [NSJSONSerialization dataWithJSONObject:dict options:0 error:NULL];
//    NSURLRequest * request = [SickerAppliers  creatYHTURLRequestWithURL:url andData:json];
//    NSURLSession * session =  [NSURLSession sharedSession];
//    NSURLSessionDataTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if(data == nil || error)
//        {
//            [[NSOperationQueue mainQueue]addOperation:[NSBlockOperation blockOperationWithBlock:^{
////                [self removeIndacator];
////                [self addTipView:@"网络连接错误"];
//            }]];
//            
//        }else
//        {
//            [[NSOperationQueue mainQueue]addOperation:[NSBlockOperation blockOperationWithBlock:^{
////                [self removeIndacator];
//            }]];
//            NSDictionary * result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:NULL];
//            NSLog(@"返回结果 result= %@",result);
//            BOOL isok = ((NSString *)result[@"isOk"]).boolValue;
//            NSString * tokenId = result[@"tokenId"];
//            NSString * signatureUuid = result[@"signatureUuid"];
//            
//            if(isok)//把原文发给服务器成功
//            {
//                
//                UIApplication * app = [UIApplication sharedApplication];
//                NSString * urlStr =[NSString stringWithFormat:@"UKey://tokenId=%@",tokenId ];
//                NSLog(@"%@",tokenId);
//                NSURL *url = [NSURL URLWithString:urlStr];
//                NSBlockOperation * block = [NSBlockOperation blockOperationWithBlock:^{
//                    if([app canOpenURL:url])
//                    {
//                        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"signedMessage"];
////                        self.signedMessage.text = @"密文:";
//                        [app openURL:url];
//                    }else
//                    {
//                        NSLog(@"打开app 失败,跳转到app下载界面");
//                    }
//                }];
//                [[NSOperationQueue mainQueue]addOperation:block];
//                
//            }
//        }
//        
//    }];
//    [task resume];
   NSString *plainText = @"1";
   NSString  *key = @"3c837d501a8f49b1";
    NSData *originData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"originData: %@", originData);
    NSData *encryData = [originData AES128EncryptWithKey:key];
    NSLog(@"encryData: %@", encryData);
    NSData *decryData = [encryData AES128DecryptWithKey:key];
    NSLog(@"decryData: %@", decryData);
 NSString   *decryStr = [[NSString alloc] initWithData:decryData encoding:NSUTF8StringEncoding];
    NSLog(@"decryStr: %@", decryStr);
    
      NSDictionary *parameters = @{@"CONSULT_ID" : self.patientID,
                                                                @"CONSULT_READING" : self.DoctorAdvise.text,
                                                                @"CONSULT_DIAG" : self.DoctorAdvise.text,
                                                            };
                                 
            NSString *urlString = @"http://wx.yunjiaopian.net/test/index.php/home/Report/writereport";
                                 
                                 
             AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
    [managers.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/x-javascript",@"image/jpeg", nil]];
       managers.responseSerializer = [AFJSONResponseSerializer serializer];
                                             //进行POST请求
            [managers POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
                    NSLog(@"请求成功，服务器返回的信息%@",responseObject);
                
                if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"UKey://.Cloudhospital"]]) {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"UKey://.Cloudhospital"]];
                } else
                {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"items-apps://itunes.apple.com/app/id1116874386"]];
                }

                    } failure:^(NSURLSessionDataTask *task, NSError * error) {
                        
             NSLog(@"请求失败,服务器返回的信息%@",error);
                }];
//

}
- (void)createview
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.seen = [[UILabel alloc]initWithFrame:CGRectMake(10/ WIDTHSIXP * WIDGHT, 70/HEIGHTSIXP *HEIGHT, 45/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.seen.text = @" 所见:";
    //    self.seen.backgroundColor = [UIColor orangeColor];
    self.seen.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.view addSubview:self.seen];
    
    self.Doctorsee = [[UITextView alloc]initWithFrame:CGRectMake(30/ WIDTHSIXP * WIDGHT, 110/HEIGHTSIXP *HEIGHT, 320/ WIDTHSIXP * WIDGHT, 100/HEIGHTSIXP *HEIGHT)];
    self.Doctorsee.editable = YES;
    self.Doctorsee.text = [NSString stringWithFormat:@"%@",self.temp];;
    //    self.Doctorsee.backgroundColor = [UIColor orangeColor];
//    self.Doctorsee.delegate = self;
    self.Doctorsee.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    self.Doctorsee.layer.borderColor = [[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0] CGColor];
    self.Doctorsee.layer.borderWidth =1/ WIDTHSIXP * WIDGHT;
    //     self.Doctorsee.layer.cornerRadius =5.0;
    [self.view addSubview:self.Doctorsee];
    
    self.commond = [[UILabel alloc]initWithFrame:CGRectMake(10/ WIDTHSIXP * WIDGHT, 230/HEIGHTSIXP *HEIGHT, 45/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.commond.text = @"结论:";
    //    self.commond.backgroundColor = [UIColor orangeColor];
    self.commond.font = [UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.view addSubview:self.commond];
    
    
    self.DoctorCommond = [[UITextView alloc]initWithFrame:CGRectMake(30/ WIDTHSIXP * WIDGHT, 280/HEIGHTSIXP *HEIGHT, 320/ WIDTHSIXP * WIDGHT,100/HEIGHTSIXP *HEIGHT )];
    
   self.DoctorCommond.text =[NSString stringWithFormat:@"%@",self.temp2];
    //    self.DoctorCommond.backgroundColor = [UIColor orangeColor];
//    self.DoctorCommond.delegate = self;
    self.DoctorCommond.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    self.DoctorCommond.layer.borderColor = [[UIColor colorWithRed:0.702 green:0.702 blue:0.702 alpha:1.0] CGColor];
    self.DoctorCommond.layer.borderWidth =1/ WIDTHSIXP * WIDGHT;
    //     self.Doctorsee.layer.cornerRadius =5.0;
    [self.view addSubview:self.DoctorCommond];
    //       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
        self.advise = [[UILabel alloc]initWithFrame:CGRectMake(10/ WIDTHSIXP * WIDGHT, 380/HEIGHTSIXP *HEIGHT, 100/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
        self.advise.text = @"会诊意见";
        self.advise.font = [UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
        [self.view addSubview:self.advise];
    
        self.DoctorAdvise = [[UITextView alloc]initWithFrame:CGRectMake(30/ WIDTHSIXP * WIDGHT, 420/HEIGHTSIXP *HEIGHT, 320/ WIDTHSIXP * WIDGHT,160/HEIGHTSIXP *HEIGHT )];
        self.DoctorAdvise.delegate = self;
        self.DoctorAdvise.text = [NSString stringWithFormat:@"%@",self.diag];
        self.DoctorAdvise.font = [UIFont systemFontOfSize:15 /HEIGHTSIXP *HEIGHT];
        self.DoctorAdvise.layer.borderColor = [[UIColor colorWithRed:0.702 green:0.702 blue:0.702 alpha:1.0] CGColor];
        self.DoctorAdvise.layer.borderWidth = 1/WIDTHSIXP *WIDGHT;
        [self.view addSubview:self.DoctorAdvise];
    
    
    
    
}
#pragma mark - 监听
//- (void)keyboardWillChangeFrame:(NSNotification *)note
//{
//    
//    // 取出键盘最终的frame
//    
//    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    
//    // 取出键盘弹出需要花费的时间
//    
//    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    // 修改transform
//    
//    [UIView animateWithDuration:duration animations:^{
//        self.DoctorCommond.frame=CGRectMake(10/ WIDTHSIXP * WIDGHT, 70/HEIGHTSIXP *HEIGHT , 320/ WIDTHSIXP * WIDGHT,  ([UIScreen mainScreen].bounds.size.height - rect.size.height )/HEIGHTSIXP *HEIGHT);
//        
//        
//    }];
//    
//}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView == self.DoctorAdvise) {
        [UIView animateWithDuration:0.1 animations:^{
            self.DoctorAdvise.frame=CGRectMake(10/ WIDTHSIXP * WIDGHT, 70 , 345/ WIDTHSIXP * WIDGHT,  ([UIScreen mainScreen].bounds.size.height - 320)/HEIGHTSIXP *HEIGHT );
            
            
        }];
    }
    
    
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
//    if (textView == self.Doctorsee) {
//        [textView flashScrollIndicators];   // 闪动滚动条
//        
//        static CGFloat maxHeight = 200.0f;
//        CGRect frame = textView.frame;
//        CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
//        CGSize size = [textView sizeThatFits:constraintSize];
//        if (size.height >= maxHeight)
//        {
//            size.height = maxHeight;
//            textView.scrollEnabled = YES;   // 允许滚动
//        }
//        else
//        {
//            textView.scrollEnabled = NO;    // 不允许滚动，当textview的大小足以容纳它的text的时候，需要设置scrollEnabed为NO，否则会出现光标乱滚动的情况
//        }
//        
//    }
    if (textView == self.DoctorAdvise) {
        [textView flashScrollIndicators];   // 闪动滚动条
        
        static CGFloat maxHeight = 200.0f;
        CGRect frame = textView.frame;
        CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
        CGSize size = [textView sizeThatFits:constraintSize];
        if (size.height >= maxHeight)
        {
            size.height = maxHeight;
            textView.scrollEnabled = YES;   // 允许滚动
        }
        else
        {
            textView.scrollEnabled = NO;    // 不允许滚动，当textview的大小足以容纳它的text的时候，需要设置scrollEnabed为NO，否则会出现光标乱滚动的情况
        }
        [UIView animateWithDuration:0.1 animations:^{
            self.DoctorAdvise.frame =CGRectMake(30/ WIDTHSIXP * WIDGHT, 420/HEIGHTSIXP *HEIGHT, 320/ WIDTHSIXP * WIDGHT,160/HEIGHTSIXP *HEIGHT );
            
            
        }];
        
        
    }
    
    
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //    [self.text1 resignFirstResponder];
    //    [self.text2 resignFirstResponder];
    //    [self.text3 resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
    
    [self.Doctorsee resignFirstResponder];
    [self.DoctorCommond resignFirstResponder];
    [self.DoctorAdvise resignFirstResponder];
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
