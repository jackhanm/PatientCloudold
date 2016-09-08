//
//  makebingliDetail.m
//  PatientCloud
//
//  Created by yuhao on 16/4/27.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "makebingliDetail.h"
#import "makebingliDetailView.h"
#import "RPreportSearchView.h"
#import "AFNetworking.h"
#import "JkDataShare.h"
@interface makebingliDetail ()<UITextFieldDelegate,RPreportSearchViewDelegate>
@property (nonatomic ,retain)UITextField *data ;
@property (nonatomic, retain)UITextField *name;
@property (nonatomic, retain) UITextField *sex;
@end

@implementation makebingliDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    [self createview];
    // Do any additional setup after loading the view.
}
- (void)createview
{
    makebingliDetailView *view = [[makebingliDetailView alloc]init];
    [self.view addSubview:view];
    
    self.name = [[UITextField alloc]initWithFrame:CGRectMake(250/WIDTHSIXP * WIDGHT, 75/HEIGHTSIXP *HEIGHT, 100/WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
    self.name.placeholder = @"请输入称呼";
    [self.view addSubview:self.name];
    
    self.sex = [[UITextField alloc]initWithFrame:CGRectMake(250/WIDTHSIXP * WIDGHT, 117/HEIGHTSIXP *HEIGHT, 100/WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
    self.sex.placeholder = @"请输入性别";
    [self.view addSubview:self.sex];
    
   self.data = [[UITextField alloc]initWithFrame:CGRectMake(250/WIDTHSIXP * WIDGHT, 159/HEIGHTSIXP *HEIGHT, 100/WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
    self.data.placeholder = @"请选择日期";
    [self.view addSubview:self.data];

    
    UILabel  *label = [[UILabel alloc]initWithFrame:CGRectMake(120/WIDTHSIXP * WIDGHT, self.data.frame.origin.y + self.data.frame.size.height + 20/HEIGHTSIXP *HEIGHT, 150/WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
    label.text = @"创建档案并提交";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:label];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAct)];
    [self.view addGestureRecognizer:tap];

    [self createPickview];
}
- (void)createPickview
{
    NSDate *now = [NSDate date];
    //block
    NSArray *txfAry = @[self.data];
    int a[] = {1};
    for (int i=0; i<txfAry.count; i++) {
        
        UITextField *field = txfAry[i];
        
        RPreportSearchView *datePicker = [[RPreportSearchView alloc]initWithframe:CGRectMake(0, 0, 320/WIDTHSIXP *WIDGHT, 200/HEIGHTSIXP *HEIGHT)
                                                                      PickerStyle:a[i]
                                                                      didSelected:^(NSString *year,
                                                                                    NSString *month,
                                                                                    NSString *day,
                                                                                    NSString *hour,
                                                                                    NSString *minute,
                                                                                    NSString *weekDay) {
                field.text = [NSString stringWithFormat:@"%@-%@-%@",year,month,day];
                                                                                                                                             }];
      
        field.inputView = datePicker;
    }
    
    
    //delegate
    RPreportSearchView *datePicker1= [[RPreportSearchView alloc]initWithframe:CGRectMake(0, 0, 320/WIDTHSIXP *WIDGHT, 400/HEIGHTSIXP *HEIGHT)
                                                                     Delegate:self
                                                                  PickerStyle:UUDateStyle_YearMonthDay];
    datePicker1.ScrollToDate = now;
    datePicker1.maxLimitDate = now;
    datePicker1.minLimitDate = [now dateByAddingTimeInterval:-111111111];
    

}
- (void)tapAct
{
    
//    
//           NSDictionary *parameters = @{@"CONSULT_ID" : @"168",
//                                                                  @"CONSULT_READING" : @"1",
//                                                                  @"CONSULT_DIAG" : @"1",
//                                                                 };
//    
//            NSString *urlString = @"http://wx.yunjiaopian.net/test/index.php/home/Report/writereport";
//    
//    
//            AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
//    
//            //进行POST请求
//            [managers POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
//                NSLog(@"请求成功，服务器返回的信息%@",responseObject);
//            } failure:^(NSURLSessionDataTask *task, NSError * error) {
//                NSLog(@"请求失败,服务器返回的信息%@",error);
//            }];

    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    NSLog(@"locationString:%@",locationString);
    
    
   
    
    NSDictionary *parameters = @{@"consult_code" : locationString, //诊断号
                                                                     @"CONSULT_PATIENTID" : @"668", //
                                                                     @"consult_region" : self.name.text,   //
                                                                     @"consult_hospitalid" : @"",
                                                                     @"consult_divison" : @"1",
                                                                     @"consult_EXPERTID" : @"",
                                                                     @"CONSULT_TYPE" : @"已申请", //诊断类型
                                                                     @"CONSULT_MEMO" : self.consult_memo, //病人自诊
                                                                     @"consult_symptoms" : self.sex.text,
                                                                     @"consult_purpose" : self.data.text,
                                                                     @"consult_reading" : @"已申请",
                                                                     @"CONSULT_USERID" : [JkDataShare shareDatabase].userID,
                                                                     @"consult_src" : @"", //附件URL
                                                                     @"cyqbm":@"0571_XSZYY"
                                 };
    
     NSString *urlString = @"http://wx.yunjiaopian.net/app/index.php/Home/index/applydiagnosis";
//     NSString *urlString = @"http://wx.yunjiaopian.net/app/index.php/Home/index/scandiagnosis/cyqbm/0571_XSZYY";
    AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
    
    //进行POST请求
    [managers POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"请求成功，服务器返回的信息%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError * error) {
        NSLog(@"请求失败,服务器返回的信息%@",error);
    }];

//        NSDictionary *parameters = @{@"username":@"18942930377",
//                                     @"password":@"1"
//                                     };
//    
//        NSString *urlString = @"http://wx.yunjiaopian.net/test/index.php/home/Report/loginAction";
//
//        AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
//    
//        //进行POST请求
//        [managers POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
//            NSLog(@"请求成功，服务器返回的信息%@",responseObject);
//        } failure:^(NSURLSessionDataTask *task, NSError * error) {
//            NSLog(@"请求失败,服务器返回的信息%@",error);
//        }];


    
    
    
    
//    NSString *str = @"http://wx.yunjiaopian.net/test/index.php/home/Report/scandiagnosis/datefrom/2015-2-1";

    
//        NSString *str = @"http://wx.yunjiaopian.net/test/index.php/home/Report/loginAction";
//        NSString *urlstr = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//        NSURL *url = [NSURL URLWithString:urlstr];
//    //    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        NSMutableURLRequest  *request = [NSMutableURLRequest requestWithURL:url];
//       request.HTTPMethod = @"POST";
//         [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//        NSDictionary *parameters = @{@"username" : @"18942930377",
//                                     @"password" : @"1",
//                            };
//    
//    
//       NSData *data =    [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
//        request.HTTPBody = data;
//
//    
//        NSURLSession *senssion = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] ];
//        NSURLSessionDataTask * PostT =  [senssion dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//            id result = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
//            NSLog(@"%@", result);
//        }];
//        
//        [PostT resume];
    
//  NSString *str = @"http://wx.yunjiaopian.net/test/index.php/home/Report/writereport";
//    NSString *urlstr = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    NSURL *url = [NSURL URLWithString:urlstr];
//    //    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSMutableURLRequest  *request = [NSMutableURLRequest requestWithURL:url];
//    request.HTTPMethod = @"POST";
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    NSDictionary *parameters = @{@"CONSULT_ID" : @"1898888",
//                                 @"CONSULT_READING" : @"1",
//                                 @"CONSULT_DIAG" : @"1",
//                                };
//    
//    
//    NSData *data =    [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
//    request.HTTPBody = data;
//    
//    NSURLSession *senssion = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] ];
//    NSURLSessionDataTask * PostT =  [senssion dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        id result = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
//        NSLog(@"%@", result);
//    }];
//    
//    [PostT resume];
    

//    NSString *str = @"http://wx.yunjiaopian.net/test/index.php/home/Report/applydiagnosis";
//    NSString *urlstr = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    NSURL *url = [NSURL URLWithString:urlstr];
////    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    NSMutableURLRequest  *request = [NSMutableURLRequest requestWithURL:url];
//   request.HTTPMethod = @"POST";
//     [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    NSDictionary *parameters = @{@"consult_code" : @"1898888",
//                                 @"CONSULT_PATIENTID" : @"1",
//                                    @"consult_region" : @"1",
//                                    @"consult_hospitalid" : @"1",
//                                    @"consult_divison" : @"1",
//                                    @"CONSULT_TYPE" : @"1",
//                                    @"CONSULT_MEMO" : @"1",
//                                    @"consult_symptoms" : @"1",
//                                    @"consult_purpose" : @"1",
//                                    @"CONSULT_USERID" : @"1",
//                                    @"consult_src" : @"1"
//                                                                    };
//
//  
//   NSData *data =    [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
//    request.HTTPBody = data;
//    
//    NSURLSession *senssion = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] ];
//    NSURLSessionDataTask * PostT =  [senssion dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        id result = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:nil];
//        NSLog(@"%@", result);
//    }];
//    
//    [PostT resume];
    

    

}
#pragma MARK 回首键盘方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
#pragma mark Pickview协议
-(void)Datepicker:(RPreportSearchView *)datepocker year:(NSString *)year month:(NSString *)month day:(NSString *)day hour:(NSString *)hour minute: (NSString *)minute weekDay:(NSString *)weekDay
{
    
}
- (void)uuDatePicker:(RPreportSearchView *)datePicker
                year:(NSString *)year
               month:(NSString *)month
                 day:(NSString *)day
                hour:(NSString *)hour
              minute:(NSString *)minute
             weekDay:(NSString *)weekDay
{
    self.data.text = [NSString stringWithFormat:@"%@-%@-%@ ",year,month,day];
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
