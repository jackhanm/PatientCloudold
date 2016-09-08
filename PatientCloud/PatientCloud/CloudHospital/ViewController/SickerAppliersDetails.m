//
//  SickerAppliersDetails.m
//  Cloudhospital
//
//  Created by yuhao on 16/7/4.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "SickerAppliersDetails.h"
#import "RPreportDetailView.h"
#import "SickerAppliersAdvise.h"
#import "SickerAppliersadviseViewController.h"
#import "ReadpaperdetailViewController.h"
#import <AFNetworking.h>
@interface SickerAppliersDetails ()<RPreportDetailViewdelegate>
@property (nonatomic, retain)RPreportDetailView *detailView;
@property  (nonatomic,copy)NSString *Url;
@property  (nonatomic, copy)NSString *seen;
@property  (nonatomic, copy)NSString  *conlusm;

@property  (nonatomic, retain)NSMutableDictionary *dic;
@end

@implementation SickerAppliersDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.actv = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.actv.frame = CGRectMake(50/ WIDTHSIXP * WIDGHT , 100 / HEIGHTSIXP * HEIGHT, 60 / WIDTHSIXP * WIDGHT, 60 / HEIGHTSIXP * HEIGHT);
    self.actv.backgroundColor = [UIColor colorWithWhite:0.874 alpha:1.000];
    self.actv.color = [UIColor colorWithRed:0.744 green:0.729 blue:0.745 alpha:1.000];
    self.actv.center = CGPointMake(self.view.frame.size.width / 2 , self.view.frame.size.height / 2);
    self.actv.layer.cornerRadius = 5;
    self.actv.layer.masksToBounds = YES;
    [self.view addSubview:self.actv];
    [self.actv startAnimating];
    [self createview];
    [self getdata];

    // Do any additional setup after loading the view.
}
-(void)getdata
{
    NSDictionary *parameters = @{@"cyqbm":@"0571_XSZYY",
                                 @"caccno":self.strmag
                                 };
    NSLog(@"%@", self.strmag);
    
    NSString *urlString = @"http://wx.yunjiaopian.net/app/index.php/home/Index/doctorScanAction";
    
    AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
    
    //进行POST请求
    [managers POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"请求成功，服务器返回的信息%@",responseObject);
        self.dic = [responseObject objectForKey:@"report"];
        self.detailView.name.text = [self.dic objectForKey:@"cname"];
        self.detailView.sex.text = [self.dic objectForKey:@"csex"];
        self.detailView.age.text = [self.dic objectForKey:@"cage"];
        self.detailView.Room.text = [self.dic objectForKey:@"csqks"];
        self.detailView.where.text = [self.dic objectForKey:@"cbz"];
        self.detailView.date.text = [self.dic objectForKey:@"dshsj"];
        //                self.detailView.number.text = [responseObject objectForKey:@"hospitalid"];
        self.detailView.Pnumber.text = [self.dic objectForKey:@"caccno"];
        self.seen = [self.dic objectForKey:@"cbgsj_hl7"];
        self.conlusm = [self.dic objectForKey:@"cbgzd"];
        self.Url = [self.dic objectForKey:@"pacs_args"];
        
        [self.actv stopAnimating];
        
    } failure:^(NSURLSessionDataTask *task, NSError * error) {
        NSLog(@"请求失败,服务器返回的信息%@",error);
    }];
    

}
- (void)createview
{
    self.detailView = [[RPreportDetailView alloc]initWithFrame:self.view.frame];
    self.detailView.delegate = self;
    [self.view addSubview:_detailView];

}
#pragma mark 实现协议方法
- (void)changeviewtoDoctorcommmend

{
    SickerAppliersadviseViewController *doctoradvise = [[SickerAppliersadviseViewController alloc]init];
    doctoradvise.patientID = self.consult_id;
    doctoradvise.temp = self.seen;
    doctoradvise.temp2 = self.conlusm;
    doctoradvise.diag = self.diag;
    NSLog(@"%@", self.diag);
    [self.navigationController pushViewController:doctoradvise animated:YES];
   
    
}
- (void)changeviewtoDoctorseen
{
    SickerAppliersadviseViewController *doctoradvise = [[SickerAppliersadviseViewController alloc]init];
    doctoradvise.patientID = self.consult_id;
    doctoradvise.temp = self.seen;
    doctoradvise.temp2 = self.conlusm;
     doctoradvise.diag = self.diag;
    [self.navigationController pushViewController:doctoradvise animated:YES];
  
}
- (void)changetotuxiang
{
//    if ([[UserInfoManager manager].hospitalCodeName isEqualToString:@"0571_XSZYY"]) {
        ReadpaperdetailViewController *paper = [[ReadpaperdetailViewController alloc]init];
        paper.url = self.Url;
        
        [self.navigationController pushViewController:paper animated:YES];
//    }
//    if ([[UserInfoManager manager].hospitalCodeName isEqualToString:@"0532_QLQD"]) {
        //        ReadpaperdetailViewController *paper = [[ReadpaperdetailViewController alloc]init];
        //        paper.url = self.Url;
        //
        //        [self.navigationController pushViewController:paper animated:YES];
//    }
}
- (void)changetobingli
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"敬请期待" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *right = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    UIAlertAction *left= [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [alert addAction:right];
    [alert addAction:left];
    [self hideHud];
    [self presentViewController:alert animated:YES completion:^{
        
        
    }];
}
- (void)changtoshoucang
{
//    [self shoucangfangfa];
    
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
