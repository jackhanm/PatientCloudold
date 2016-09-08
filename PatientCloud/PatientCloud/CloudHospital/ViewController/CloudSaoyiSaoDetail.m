//
//  CloudSaoyiSaoDetail.m
//  Cloudhospital
//
//  Created by yuhao on 16/6/12.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "CloudSaoyiSaoDetail.h"
#import "RPreportDetailView.h"
#import "Doctorseen.h"
#import "JkDataShare.h"
#import "ReadpaperdetailViewController.h"
#import "AFNetworking.h"
#import "JKdataBasehandle.h"
#import "ReadpersonListModel.h"
#import "UserInfoManager.h"
@interface CloudSaoyiSaoDetail ()<RPreportDetailViewdelegate>
@property (nonatomic, retain)RPreportDetailView *detailView;
@property  (nonatomic,copy)NSString *Url;
@property  (nonatomic, copy)NSString *seen;
@property  (nonatomic, copy)NSString  *conlusm;
@property  (nonatomic, assign)BOOL temp;
@property  (nonatomic, retain)NSMutableDictionary *dic;
@end

@implementation CloudSaoyiSaoDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"扫描结果";
    self.view.backgroundColor = [UIColor whiteColor];
//
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"图片上传"] style:UIBarButtonItemStylePlain target:self action:@selector(rightAct)];
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
- (void)rightAct
{
    [[JKdataBasehandle shareDatabase] openDB];
    NSMutableArray *arr = [[JKdataBasehandle shareDatabase] selectAllUser];
    for (ReadpersonListModel *user in arr) {
        if ([[self.dic objectForKey:@"cname"] isEqualToString:user.cname]) {
            self.temp = 1;
        }
    }
    if (1 == self.temp ) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示框" message:@"已经保存过了" preferredStyle:  UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [self dismissViewControllerAnimated:YES completion:^{
                
                
            }];
            
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            
        }]];
        [self presentViewController:alert animated:YES completion:^{
            
            
        }];
        
    }
    
    if (0  == self.temp) {
        [[JKdataBasehandle shareDatabase] createTable];
        ReadpersonListModel *model = [[ReadpersonListModel alloc]init];
        model.cname = [self.dic objectForKey:@"cname"];
        model.csex = [self.dic objectForKey:@"csex"];
        model.cage = [self.dic objectForKey:@"cage"];
        model.cbz = [self.dic objectForKey:@"cbz"];
        model.cblkh = [self.dic objectForKey:@"cblkh"];
        model.exam_id = [self.dic objectForKey:@"exam_id"];
        model.jcsj = [self.dic objectForKey:@"jcsj"];
        model.pacs_args = [self.dic objectForKey:@"pacs_args"];
        model.caccno = [NSString stringWithFormat: @"%@", [self.dic objectForKey:@"caccno"]];
        model.cbgzd =[self.dic objectForKey:@"cbgzd"];
        model.cbgsj_hl7 =[self.dic objectForKey:@"cbgsj_hl7"];
        model.dshsj = [self.dic objectForKey:@"dshsj"];
        model.hospitalCodename = [JkDataShare shareDatabase].hospitalCodename;
      
        
        [[JKdataBasehandle shareDatabase] insertDataWithReadpersonListModel:model];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示框" message:@"保存成功" preferredStyle:  UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:^{
                
                
            }];
            
            
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            
        }]];
        [self presentViewController:alert animated:YES completion:^{
            
            
        }];
        
        
        
    }
    NSLog(@"%@",NSHomeDirectory());
    
}

- (void)getdata
{
    NSDictionary *parameters = @{@"cyqbm":[JkDataShare shareDatabase].hospitalCodename,
                               @"caccno":self.strmag
                               };
    
    NSString *urlString = @"http://wx.yunjiaopian.net/app/index.php/home/Index/doctorScanAction";
    
    AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
    
    //进行POST请求
    [managers POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"请求成功，服务器返回的信息%@",responseObject);
        NSMutableDictionary *dic = [responseObject objectForKey:@"report"];
           self.dic = [responseObject objectForKey:@"report"];
        self.detailView.name.text = [dic objectForKey:@"cname"];
        self.detailView.sex.text = [dic objectForKey:@"csex"];
        self.detailView.age.text = [dic objectForKey:@"cage"];
        self.detailView.Room.text = [dic objectForKey:@"csqks"];
        self.detailView.where.text = [dic objectForKey:@"cbz"];
        self.detailView.date.text = [dic objectForKey:@"dshsj"];
        //                self.detailView.number.text = [responseObject objectForKey:@"hospitalid"];
        self.detailView.Pnumber.text = [dic objectForKey:@"caccno"];
        self.seen = [dic objectForKey:@"cbgsj_hl7"];
        self.conlusm = [dic objectForKey:@"cbgzd"];
        self.Url = [dic objectForKey:@"pacs_args"];
        
        
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
    
    Doctorseen *doctor = [[Doctorseen alloc]init];
    doctor.temp = self.seen;
    doctor.temp2 = self.conlusm;
    [self.navigationController pushViewController:doctor animated:YES];
    
}
- (void)changeviewtoDoctorseen
{
    
    Doctorseen *doctor = [[Doctorseen alloc]init];
    doctor.temp = self.seen;
    doctor.temp2 = self.conlusm;
    [self.navigationController pushViewController:doctor animated:YES];
}
- (void)changetotuxiang
{
    if (self.Url.length == 0) {
        [self showHint:@"图像数据为空"];
        
    } else {
        ReadpaperdetailViewController *paper = [[ReadpaperdetailViewController alloc]init];
        paper.url = self.Url;
        
        [self.navigationController pushViewController:paper animated:YES];
    }
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
    [[JKdataBasehandle shareDatabase] openDB];
    NSMutableArray *arr = [[JKdataBasehandle shareDatabase] selectAllUser];
    for (ReadpersonListModel *user in arr) {
        if ([[self.dic objectForKey:@"cname"] isEqualToString:user.cname]) {
            self.temp = 1;
        }
    }
    if (1 == self.temp ) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示框" message:@"已经保存过了" preferredStyle:  UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            
        }]];
        [self presentViewController:alert animated:YES completion:^{
            
            
        }];
        
    }
    
    if (0  == self.temp) {
        [[JKdataBasehandle shareDatabase] createTable];
        ReadpersonListModel *model = [[ReadpersonListModel alloc]init];
        model.cname = [self.dic objectForKey:@"cname"];
        model.csex = [self.dic objectForKey:@"csex"];
        model.cage = [self.dic objectForKey:@"cage"];
        model.cbz = [self.dic objectForKey:@"cbz"];
        model.cblkh = [self.dic objectForKey:@"cblkh"];
        model.exam_id = [self.dic objectForKey:@"exam_id"];
        model.jcsj = [self.dic objectForKey:@"jcsj"];
        model.pacs_args = [self.dic objectForKey:@"pacs_args"];
        model.hospitalCodename = [JkDataShare shareDatabase].hospitalCodename;
        model.cbgzd =[self.dic objectForKey:@"cbgzd"];
        model.cbgsj_hl7 =[self.dic objectForKey:@"cbgsj_hl7"];
        model.dshsj = [self.dic objectForKey:@"dshsj"];
        
        [[JKdataBasehandle shareDatabase] insertDataWithReadpersonListModel:model];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示框" message:@"保存成功" preferredStyle:  UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            
        }]];
        [self presentViewController:alert animated:YES completion:^{
            
            
        }];
        
        
        
    }
    NSLog(@"%@",NSHomeDirectory());

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
