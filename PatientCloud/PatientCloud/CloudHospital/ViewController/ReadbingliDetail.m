//
//  ReadbingliDetail.m
//  PatientCloud
//
//  Created by yuhao on 16/4/26.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "ReadbingliDetail.h"
#import "RPreportDetailView.h"
#import "Doctorseen.h"
#import "JKdataBasehandle.h"
#import "ReadpersonListModel.h"
#import "ReadpaperdetailViewController.h"
@interface ReadbingliDetail ()<RPreportDetailViewdelegate>
@property (nonatomic, retain)RPreportDetailView *detailView;
@property  (nonatomic,copy)NSString *Url;
@property  (nonatomic, copy)NSString *seen;
@property  (nonatomic, copy)NSString  *conlusm;
@end
@implementation ReadbingliDetail

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.9255 green:0.9216 blue:0.9373 alpha:1.0];

     [self getdata];
    
}

- (void)getdata
{
    [[JKdataBasehandle shareDatabase] openDB];
   NSMutableArray *arr = [[JKdataBasehandle shareDatabase] selectAllUser];
   
    ReadpersonListModel *model = [arr objectAtIndex:self.idnex];

    self.detailView = [[RPreportDetailView alloc]initWithFrame:self.view.frame];
    self.detailView.delegate = self;
  
    self.detailView.name.text = model.cname;
    self.detailView.sex.text = model.csex;
    self.detailView.age.text = model.cage;
    self.detailView.Room.text = model.hospitalCodename;
    self.detailView.where.text =   model.cbz;
    self.detailView.date.text = model.dshsj;
    self.detailView.Pnumber.text = model.caccno;
    self.seen  = model.cbgsj_hl7;
    self.conlusm = model.cbgzd;
    self.Url = model.pacs_args;
    [self.detailView.buttonliuyan setTitle:@"标签" forState:UIControlStateNormal];
    [self.detailView.buttonliuyan setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
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
    
}

@end
