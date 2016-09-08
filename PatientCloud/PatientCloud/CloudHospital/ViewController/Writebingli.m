//
//  Writebingli.m
//  PatientCloud
//
//  Created by yuhao on 16/4/27.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "Writebingli.h"
#import "JKAFNetTool.h"
#import "makebingliModel.h"
#import "ReadbingliDetail.h"
#import <MJRefresh.h>
#import "JkDataShare.h"
#import "SickerAppliersDetails.h"
#import "writebinglicell.h"
@interface Writebingli ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain)UITableView *tableview;
@property (nonatomic, retain)NSMutableArray *Arr;

@property (nonatomic, assign)NSInteger pagenum;
@property (nonatomic, assign)NSInteger bijiaonum;
@property (nonatomic, assign)NSInteger biaojinum;
@end

@implementation Writebingli
#pragma  显示最近的申请

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.9059 green:0.9059 blue:0.9059 alpha:1.0];
    [self createdata];
    [self  createview];
 
    // Do any additional setup after loading the view.
}
-(void)getdata
{
    [JKAFNetTool getNetWithURL:[NSString stringWithFormat:@"http://wx.yunjiaopian.net/app/index.php/Home/index/pscandiagnosis/userid/%@/cyqbm/0571_XSZYY",[JkDataShare shareDatabase].userID]  body:nil headFile:nil responseStyle:JKJSON success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([[responseObject objectForKey:@"totalcount"] isEqualToString:@"0"]) {
            NSLog(@"没有数据");
            
        } else {
                           if (self.pagenum > 0) {
                    self.pagenum--;
                } else {
                    return ;
                }
                NSString *str =[NSString stringWithFormat:@"http://wx.yunjiaopian.net/app/index.php/Home/index/pscandiagnosis/userid/%@/cyqbm/0571_XSZYY/page/%ld",[JkDataShare shareDatabase].userID, self.pagenum];
            NSLog(@"%@",str);
                [JKAFNetTool getNetWithURL:str body:nil headFile:nil responseStyle:JKJSON success:^(NSURLSessionDataTask *task, id responseObject) {
                    NSLog(@"%@", responseObject);
                    if ([[responseObject objectForKey:@"totalcount"] isEqualToString:@"0"]) {
                        NSLog(@"没有数据");
                        
                    } else {
                        [self showHint:@"刷新成功"];
                        NSMutableArray *arr = [responseObject objectForKey:@"items"];
                        NSMutableArray *brr = [NSMutableArray arrayWithArray:[makebingliModel baseModelWithArr:arr]];
                        if (brr.count > 0) {
                            [self.Arr addObjectsFromArray:brr];
                            [self.tableview reloadData];
                        }
                        NSLog(@"%ld",(unsigned long)self.Arr.count);
                    }
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    
                    
                }];
                
                }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
    }];
}
- (void)createview
{
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375/WIDTHSIXP *WIDGHT, 667/HEIGHTSIXP *HEIGHT)  style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;

       self.tableview.backgroundColor = [UIColor colorWithRed:0.956 green:0.9468 blue:0.9653 alpha:1.0];
     //上拉刷新
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getdata];

        [self.tableview.mj_header endRefreshing];
        
    }];
    // 下拉刷新
    self.tableview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [self MJrefreshdata];
        
        [self.tableview.mj_footer endRefreshing];
        
    }];
    

    
    [self.view addSubview:self.tableview ];
    
    
    
}
#pragma mark createdata
-(void)createdata
{
   

    self.Arr = [NSMutableArray array];
    [JKAFNetTool getNetWithURL:[NSString stringWithFormat:@"http://wx.yunjiaopian.net/app/index.php/Home/index/pscandiagnosis/userid/%@/cyqbm/0571_XSZYY",[JkDataShare shareDatabase].userID] body:nil headFile:nil responseStyle:JKJSON success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if ([[responseObject objectForKey:@"totalcount"] isEqualToString:@"0"]) {
            NSLog(@"没有数据");
            
        } else {
            NSLog(@"%@", [responseObject objectForKey:@"totalcount"]);
            self.pagenum = [[responseObject objectForKey:@"totalcount"] integerValue];
            self.biaojinum = [[responseObject objectForKey:@"totalcount"] integerValue];
            if (self.pagenum > 10 ) {
                self.pagenum = self.pagenum / 10 ;
                if (self.pagenum %10 == 0) {
                    self.pagenum = self.pagenum/10 - 1;
                }
            } else {
                self.pagenum = 0;
            }
            NSString *str =[NSString stringWithFormat:@"http://wx.yunjiaopian.net/app/index.php/Home/index/pscandiagnosis/userid/%@/cyqbm/0571_XSZYY/page/%ld",[JkDataShare shareDatabase].userID, self.pagenum];
            [JKAFNetTool getNetWithURL:str body:nil headFile:nil responseStyle:JKJSON success:^(NSURLSessionDataTask *task, id responseObject) {
                NSLog(@"%@", responseObject);
                NSMutableArray *arr = [responseObject objectForKey:@"items"];
                self.Arr = [makebingliModel baseModelWithArr:arr];
                if (self.Arr.count > 0) {
                    [self showHint:@"刷新成功"];
                    [self.tableview reloadData];
                }
                NSLog(@"%ld",(unsigned long)self.Arr.count);
                
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                
                
            }];
            //            NSLog(@"%ld", self.pagenum);
            //
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
    }];
    
    

    
//    self.Arr = [NSMutableArray array];
//    [JKAFNetTool getNetWithURL:@"http://wx.yunjiaopian.net/app/index.php/Home/index/pscandiagnosis/userid/668/cyqbm/0571_XSZYY " body:nil headFile:nil responseStyle:JKJSON success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"%@", responseObject);
//        NSMutableArray *arr = [responseObject objectForKey:@"items"];
//        self.Arr = [makebingliModel baseModelWithArr:arr];
//        if (self.Arr) {
//               [self.tableview reloadData];
//        }
//        NSLog(@"%ld",self.Arr.count);
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        
//    }];
    
}
#pragma mark tableview方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120/HEIGHTSIXP *HEIGHT;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
     return self.Arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellstr = @"cellstr";
    writebinglicell *cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
    if (cell == nil) {
        cell = [[writebinglicell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellstr];
        
       
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.label2.text = [[self.Arr objectAtIndex:indexPath.row]consult_divison];
    cell.label6.text = [[self.Arr objectAtIndex:indexPath.row]gmt_create];
    cell.label5.text = [[self.Arr objectAtIndex:indexPath.row] consult_region];
    NSLog(@"%ld",[NSString stringWithFormat:@"%@",[[self.Arr objectAtIndex:indexPath.row] consult_reading]].length);
    if ([NSString stringWithFormat:@"%@",[[self.Arr objectAtIndex:indexPath.row] consult_reading]].length == 6) {
          cell.stutue.text  = @"已申请";
    } else {
    cell.stutue.text = @"已回复";
    }
       return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SickerAppliersDetails *Details = [[SickerAppliersDetails alloc]init];
    Details.consult_id = [[self.Arr objectAtIndex:indexPath.row] consult_id]  ;
    NSLog(@"%@",Details.consult_id);
    Details.strmag = [[self.Arr objectAtIndex:indexPath.row] consult_hospitalid] ;
    Details.diag = [[self.Arr objectAtIndex:indexPath.row]consult_diag];
    NSLog(@"%@", Details.diag);
    [self.navigationController pushViewController:Details animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mrk 编辑删除
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableview setEditing:editing animated:animated];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewCellEditingStyleDelete;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"移除";
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.Arr removeObjectAtIndex:indexPath.row];
    [self.tableview reloadData];
    
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
