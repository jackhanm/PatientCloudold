//
//  Readbingli.m
//  PatientCloud
//
//  Created by yuhao on 16/4/26.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "Readbingli.h"
#import "ReadbingliDetail.h"
#import "ReadpaperTableViewCell.h"
#import "MenuItemModel.h"
#import "JKdataBasehandle.h"
#import "ThirdLoginModel.h"
#import "ReadpersonListModel.h"
#import <AFNetworking.h>
#import "JkDataShare.h"
#import "UserInfoManager.h"
#import "UMSocial.h"
#import "ChangeInfo.h"

typedef enum
{
    
    FavoriteOperation = 0,
    AlbumOperation,
    DownLoadOperation,
    SingerOperation,
    DeleteOperation
} OperationType;
@interface Readbingli ()<UITableViewDelegate, UITableViewDataSource,MenuTableViewCellDelegate,MenutableViewCellDataSource>
@property (nonatomic ,retain)UITableView *tableview;
@property (nonatomic,retain)ReadpaperTableViewCell *menuCell;
@property (nonatomic, retain)NSMutableArray *arr;
//下拉菜单数据源
@property (strong, nonatomic) NSMutableArray *menuItemDataSourceArray;



//已经打开下拉菜单的单元格
@property (strong, nonatomic) ReadpaperTableViewCell *openedMenuCell;
//已经打开下拉菜单的单元格的位置
@property (strong, nonatomic) NSIndexPath *openedMenuCellIndex;

@property (nonatomic , retain) UIView *backview ;
@end
@implementation Readbingli

- (void)viewWillAppear:(BOOL)animated
{
    [self getdata];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:1.0 alpha:1.0];
    [self createview];
    [self getdata];
//    [self createNoneview];
}
- (void)getdata
{
    self.arr = [NSMutableArray array];
    [[JKdataBasehandle shareDatabase] openDB];
//    NSMutableArray *brr= [[JKdataBasehandle shareDatabase] selectAllUser];
    self.arr = [[JKdataBasehandle shareDatabase] selectAllUser];
//    for (ReadpersonListModel *readlist in brr) {
//    
//        if ([readlist.username isEqualToString:[UserInfoManager manager].user_name]) {
//            [self.arr addObject:readlist];
//        }
//    }
//    if (self.arr.count < 1) {
//        [self createNoneView];
//    } else {
//        [self.tableview reloadData];
//    }
   
}
- (void)createNoneView
{
    if ([UserInfoManager manager].user_name) {
        [self writeInfo]; 
    } else {
        NSLog(@"本地暂无数据" );
    }
    
}
- (void)writeInfo
{
      
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"用户信息不够完善" message:@"无法确定是否有权限查看报告" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *right = [UIAlertAction actionWithTitle:@"去编辑用户信息" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            ChangeInfo *change = [[ChangeInfo alloc]init];
            
            
            
            
            
        }];
        UIAlertAction *left= [UIAlertAction actionWithTitle:@"不，等会编辑" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
        }];
        [alert addAction:right];
        [alert addAction:left];
    
        [self presentViewController:alert animated:YES completion:^{
            
            
        }];

}
-(void)createNoneview
{
   self.backview = [[UIView alloc]initWithFrame:self.view.bounds];
    self.backview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backview];
    
}
- (void)createview
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375/WIDTHSIXP * WIDGHT, 0)];
    [self.view addSubview:view];
    self.tableview =  [[UITableView alloc]initWithFrame:CGRectMake(0, 64/HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, 667/HEIGHTSIXP * HEIGHT) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableview ];
    
}
#pragma mark tableview方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((self.openedMenuCell != nil)&&
        (self.openedMenuCell.isOpenMenu = YES)&&
        (self.openedMenuCellIndex.row == indexPath.row))
    {
        return 130.0/HEIGHTSIXP *HEIGHT;
    }else
    {
        return 70.0/HEIGHTSIXP *HEIGHT;
    }

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellstr = @"cell";
    self.menuCell = [tableView dequeueReusableCellWithIdentifier:cellstr];
    if (nil == self.menuCell) {
        self.menuCell = [[ReadpaperTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellstr];
        self.menuCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (self.arr.count) {
        self.menuCell.label5.text = [[self.arr objectAtIndex:indexPath.row] cname];
        self.menuCell.label2.text = [[self.arr objectAtIndex:indexPath.row] cbz];

        
        self.menuCell.label6.text = [[self.arr objectAtIndex:indexPath.row]  jcsj];
        
    }

    
    
    self.menuCell.delegate = self;
    self.menuCell.dataSource = self;
    
    self.menuCell.moreBtn.tag =indexPath.row;
    
    
    
    //需要手动绘制下拉菜单视图，通过xib创建视图的时候cell的delegate和dataSource尚未确定
    [self buildDataSource];
    [self.menuCell buildMenuView];
    return self.menuCell;
    
}
- (void)buildDataSource
{
    //    构建单元格下拉列表数据源
    self.menuItemDataSourceArray = [NSMutableArray arrayWithCapacity:0];
    MenuItemModel *favItemModel = [[MenuItemModel alloc] initWithNormalImageName:@"Copy"
                                                        withHighLightedImageName:@"Copy"
                                                                    withItemText:@"Copy"];
    
    [self.menuItemDataSourceArray addObject:favItemModel];
    
    MenuItemModel *albItemModel = [[MenuItemModel alloc] initWithNormalImageName:@"Oncall"
                                                        withHighLightedImageName:@"Oncall"
                                                                    withItemText:@"Oncall"];
    [self.menuItemDataSourceArray addObject:albItemModel];
    
    MenuItemModel *dldItemModel = [[MenuItemModel alloc] initWithNormalImageName:@"Fly"
                                                        withHighLightedImageName:@"Fly"
                                                                    withItemText:@"Fly"];
    [self.menuItemDataSourceArray addObject:dldItemModel];
    
    MenuItemModel *artistItemModel = [[MenuItemModel alloc] initWithNormalImageName:@"Add"
                                                           withHighLightedImageName:@"Add"
                                                                       withItemText:@"Add"];
    [self.menuItemDataSourceArray addObject:artistItemModel];
    
    MenuItemModel *dltItemModel = [[MenuItemModel alloc] initWithNormalImageName:@"Delete"
                                                        withHighLightedImageName:@"Delete"
                                                                    withItemText:@"Delete"];
    [self.menuItemDataSourceArray addObject:dltItemModel];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReadbingliDetail *detail = [[ReadbingliDetail alloc]init];
    detail.idnex = indexPath.row;
    [self.navigationController pushViewController:detail animated:YES];
    
}
#pragma mark - MenutableViewCellDataSource

- (NSMutableArray *)dataSourceForMenuItem
{
    return self.menuItemDataSourceArray;
}

#pragma mark - MenuTableViewCellDelegate

- (void)didOpenMenuAtCell:(ReadpaperTableViewCell *)menuTableVieCell withMoreButton:(UIButton *)moreButton
{
    
    NSIndexPath *openedIndexPath = [NSIndexPath indexPathForRow:moreButton.tag inSection:0];
    
    if ((self.openedMenuCell != nil)&&
        (self.openedMenuCell.isOpenMenu = YES)&&
        (self.openedMenuCellIndex.row == openedIndexPath.row))
    {
        //如果点的是同一个cell关闭下拉菜单并且不刷新新的cell
        self.openedMenuCell = nil;
        [self.tableview reloadRowsAtIndexPaths:@[self.openedMenuCellIndex] withRowAnimation:UITableViewRowAnimationFade];
        self.openedMenuCellIndex = nil;
        return;
    }
    
    //刷新新的Cell
    self.openedMenuCell = menuTableVieCell;
    self.openedMenuCellIndex = openedIndexPath;
    [self.tableview reloadRowsAtIndexPaths:@[self.openedMenuCellIndex] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableview scrollToRowAtIndexPath:self.openedMenuCellIndex
                          atScrollPosition:UITableViewScrollPositionNone
                                  animated:YES];
    
}

- (void)menuTableViewCell:(ReadpaperTableViewCell *)menuTableViewCell didSeletedMentItemAtIndex:(NSInteger)menuItemIndex
{
    //首先关闭打开的下拉菜单
    if ((self.openedMenuCell != nil)&&
        (self.openedMenuCell.isOpenMenu = YES)&&
        (self.openedMenuCellIndex.row == menuTableViewCell.moreBtn.tag))
    {
        //如果点的是同一个cell关闭下拉菜单并且不刷新新的cell
        self.openedMenuCell = nil;
        [self.tableview reloadRowsAtIndexPaths:@[self.openedMenuCellIndex] withRowAnimation:UITableViewRowAnimationFade];
        self.openedMenuCellIndex = nil;
    }
    
    //根据点击的下拉菜单的item触发相应的事件
    switch (menuItemIndex)
    {
        case FavoriteOperation:
        {
            NSLog(@"copy");
            //            FavoriteViewController *favoriteVC = [[FavoriteViewController alloc] init];
            //            [self.navigationController pushViewController:favoriteVC animated:YES];
        }
            break;
        case AlbumOperation:
        {
            NSLog(@"oncall");
            //            AlbumViewController *albumVC = [[AlbumViewController alloc] init];
            //            [self.navigationController pushViewController:albumVC animated:YES];
        }
            break;
        case DownLoadOperation:
        {
            NSLog(@"fly");
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"发送给医生诊断" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *right = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                [self sendtoyisheng];
                
                
                 NSInteger deleteInteger = menuTableViewCell.moreBtn.tag;
                NSLog(@"%ld", deleteInteger);
                NSMutableArray *Arr = [[JKdataBasehandle shareDatabase]selectAllUser];
                  ReadpersonListModel *use = [Arr objectAtIndex:deleteInteger ];
                NSDate *  senddate=[NSDate date];
                
                NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
                [dateformatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
                NSString *  locationString=[dateformatter stringFromDate:senddate];
                NSLog(@"locationString:%@",locationString);
                NSLog(@"%@%@%@%@%@", use.caccno, use.cname, use.jcsj, use.hospitalCodename,use.cbz);
                
                
                NSDictionary *parameters = @{@"consult_code" : locationString, //诊断号
                                             @"CONSULT_PATIENTID" : @"668", //
                                             @"consult_region" : use.cname,   //
                                             @"consult_hospitalid" :use.caccno ,
                                             @"consult_divison" : use.cbz,
                                             @"consult_EXPERTID" : @"",
                                             @"CONSULT_TYPE" : @"已申请", //诊断类型
                                             @"CONSULT_MEMO" : [NSString stringWithFormat: @"%@%@%@", use.cblkh, use.cname, use.jcsj] ,//病人自诊
                                             @"consult_reading" : @"已申请",
                                             @"consult_symptoms" : use.jcsj,
                                             @"consult_purpose" : use.cblkh,
                                             @"CONSULT_USERID" : [JkDataShare shareDatabase].userID,
                                             @"consult_src" : @"", //附件URL
                                             @"cyqbm": use.hospitalCodename
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
                

                
            }];
            UIAlertAction *left= [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                
            }];
            [alert addAction:right];
            [alert addAction:left];
         
            [self presentViewController:alert animated:YES completion:^{
                
                
            }];

            
            //            DownLoadViewController *downLoadVC = [[DownLoadViewController alloc] init];
            //            [self.navigationController pushViewController:downLoadVC animated:YES];
        }
            break;
        case SingerOperation:
        {
            
            
            [UMSocialData defaultData].extConfig.title = @"来自云诊室的分享";
            [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
            [UMSocialSnsService presentSnsIconSheetView:self
                                                 appKey:@"57bc36d6e0f55a5c84002533"
                                              shareText:@"微云诊室(大众)，是一款专门为用户打造的，用于患者和医生之间进行病情咨询，探讨，自身疾病档案管理App工具。我们致力于打造一款行业内最高标准的医疗移动影像云，微云诊室，与你同行！https://itunes.apple.com/app/id1116874386"
                                             shareImage:[UIImage imageNamed:@"icon"]
                                        shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
                                               delegate:self];

            
            
            
            
            
            
            
            //            SingerViewController *singerVC = [[SingerViewController alloc] init];
            //            [self.navigationController pushViewController:singerVC animated:YES];
        }
            break;
        case DeleteOperation:
        {
            NSLog(@"delete");
                        NSInteger deleteInteger = menuTableViewCell.moreBtn.tag;
                        NSIndexPath *deletIndexPath = [NSIndexPath indexPathForRow:deleteInteger inSection:0];
                        //刷新数据源
                        [self.arr removeObjectAtIndex:deleteInteger];
            NSMutableArray *Arr = [[JKdataBasehandle shareDatabase]selectAllUser];
            ReadpersonListModel *use = [Arr objectAtIndex:deleteInteger];
            [[JKdataBasehandle shareDatabase]deleteDataWithReadpersonListModel:use.pacs_args];
                        //刷新列表
                        [self.tableview deleteRowsAtIndexPaths:@[deletIndexPath] withRowAnimation:UITableViewRowAnimationMiddle];
                        //如果不执行下面的代码cell的moreBtn的tag就没办法刷新。
                        [self.tableview reloadData];
        }
            break;
            
        default:
            break;
    }
}
- (void)sendtoyisheng
{
    
  }
#pragma mark  编辑删除
//- (void)setEditing:(BOOL)editing animated:(BOOL)animated
//{
//    [super setEditing:editing animated:animated];
//    [self.tableview setEditing:editing animated:animated];
//}
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    return UITableViewCellEditingStyleDelete;
//    
//}
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [[JKdataBasehandle shareDatabase]openDB];
//    NSMutableArray *Arr = [[JKdataBasehandle shareDatabase]selectAllUser];
//    ReadpersonListModel *use = [Arr objectAtIndex:indexPath.row];
//    [[JKdataBasehandle shareDatabase]deleteDataWithReadpersonListModel:use.pacs_args];
//    [self.arr removeObjectAtIndex:indexPath.row];
//    [self.tableview reloadData];
//    
//    
//}
@end
