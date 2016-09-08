//
//  CloudGetinfoVC.m
//  PatientCloud
//
//  Created by yuhao on 16/6/2.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "CloudGetinfoVC.h"
#import "SubLBXScanViewController.h"
#import "JKAFNetTool.h"
#import <MJRefresh.h>
#import <MBProgressHUD.h>
#import "JkDataShare.h"
#define hospiatllistURL "http://wx.yunjiaopian.net//app/index.php/home/Index/hospitallistAction"
@interface CloudGetinfoVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSMutableArray *arrlist;
@property (nonatomic, strong)NSMutableArray *arrlist2;
@property  (nonatomic, strong)NSDictionary *hospitalDic;
@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)  UITableViewCell *cell;
@property  (nonatomic, retain) NSMutableArray *refreshArr;
@property  (nonatomic ,assign) NSInteger pagenum;
@end

@implementation CloudGetinfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.pagenum = 1;
    self.title = @"选择医院";
       self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(RightAct)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftAct)];
   
    [self getdata];
     [self createview];
   
    // Do any additional setup after loading the view.
}
- (void)getdata
{
    [JKAFNetTool getNetWithURL:@hospiatllistURL body:nil headFile:nil responseStyle:JKJSON success:^(NSURLSessionDataTask *task, id responseObject) {
        
        self.hospitalDic = [NSDictionary dictionaryWithDictionary:[responseObject objectForKey:@"items"]];
        self.arrlist = [NSMutableArray arrayWithArray:[[responseObject objectForKey:@"items"] allValues]];
      
        self.arrlist2 = [NSMutableArray arrayWithArray:[[responseObject objectForKey:@"items"] allKeys]];
                NSLog(@"%@", self.arrlist);
      
            [self.tableview reloadData];

        
        //        NSLog(@"%@", arrlist2);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
    }];

}
- (void)getRefresh
{
  
    
    NSString *str  = [NSString stringWithFormat:@"http://wx.yunjiaopian.net//app/index.php/home/Index/hospitallistAction/page/%ld",self.pagenum];
    
    [JKAFNetTool getNetWithURL:str  body:nil headFile:nil responseStyle:JKJSON success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@", responseObject);
     
        if ( ![[responseObject objectForKey:@"items"] isKindOfClass:[NSNull class]] ) {
            self.refreshArr = [NSMutableArray arrayWithArray:[[responseObject objectForKey:@"items"] allValues]];
            NSMutableArray *refreshArr2 = [NSMutableArray arrayWithArray:[[responseObject objectForKey:@"items"] allKeys]];
            NSLog(@"%@", self.refreshArr);
            self.pagenum ++;
            [self.arrlist addObjectsFromArray:self.refreshArr];
            [self.arrlist2 addObjectsFromArray:refreshArr2];
            [self.tableview reloadData];
        }
     
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
    }];
    
    
    
    
}
- (void)createview
{
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP *WIDGHT, 0/HEIGHTSIXP *HEIGHT, 375/ WIDTHSIXP * WIDGHT, 667/HEIGHTSIXP *HEIGHT) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self ;
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self getdata];
        [self.tableview.mj_header endRefreshing];
        
    }];
    self.tableview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self  getRefresh];
        [self.tableview.mj_footer endRefreshing];
    }];
    
    [self.view addSubview:self.tableview];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60/HEIGHTSIXP *HEIGHT;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrlist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellstr = @"cell";
   self.cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
    if (nil == self.cell) {
        self.cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellstr];
       
    }
    if (self.arrlist) {
        self.cell.textLabel.text = [self.arrlist objectAtIndex:indexPath.row];

    }
    
//    self.cell.accessoryType = UITableViewCellAccessoryCheckmark;
    return self.cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (0 == indexPath.section) {
        
        self.cell.accessoryType = UITableViewCellAccessoryNone;
        [self btnActionForUserSetting:self];
        
    }
    
    [JkDataShare shareDatabase].hospitalCodename = [self.arrlist2 objectAtIndex:indexPath.row];
    SubLBXScanViewController *saoma = [[SubLBXScanViewController alloc]init];
    [self.navigationController pushViewController:saoma animated:YES];
}
- (void)btnActionForUserSetting:(id) sender {
    
    NSIndexPath *indexPath = [self.tableview indexPathForSelectedRow];
    UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;

}
- (void)RightAct
{
    SubLBXScanViewController *saoma = [[SubLBXScanViewController alloc]init];
    [self.navigationController pushViewController:saoma animated:YES];
    
}
- (void)leftAct
{
    NSLog(@"1");
  [self dismissViewControllerAnimated:YES completion:^{
      
      
  }];
    [self.navigationController popViewControllerAnimated:YES];
    
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
