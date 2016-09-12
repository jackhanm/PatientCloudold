//
//  CloudHospitalVC.m
//  PatientCloud
//
//  Created by yuhao on 16/4/25.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "CloudHospitalVC.h"
#import "AppDelegate.h"
#import "SDCycleScrollView.h"
#import "resouce.h"
#import "CloudHospitalFirstCell.h"
#import "CloudHospatilSecondCell.h"
#import "CloudMydoctor.h"
#import "cloudMybingli.h"
#import "CloudMyImage.h"
#import "CloudGetinfoVC.h"
#import "CloudHospitalHideView.h"
#import "JkDataShare.h"
#import "loginViewControlller.h"
#import "registVC.h"
#import "bangdingzhanghaoVC.h"
#import "JKdataBasehandle.h"
#import "UserInfoManager.h"
#import "ThirdLoginModel.h"
#import "AFNetworking.h"
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H [UIScreen mainScreen].bounds.size.height
#define MIN_CENTER_X SCREEN_W/6
#define MAX_CENTER_X SCREEN_W
@interface CloudHospitalVC ()<UISearchBarDelegate,UITableViewDataSource, UITableViewDelegate,SDCycleScrollViewDelegate,CloudHospitalFirstCelldelegate>
@property (nonatomic, retain)UISearchBar *searchbar;
@property (nonatomic, retain)UITableView *tableview;
@property (nonatomic, retain)SDCycleScrollView *cycSV2;
@property (nonatomic, retain)CloudHospitalHideView *hideview;
@end


@implementation CloudHospitalVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.searchbar.hidden = NO;
    
    if ([JkDataShare shareDatabase].isLogin) {
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [tempApp.leftSlideVC setPanEnabled: YES];
    } else {
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [tempApp.leftSlideVC setPanEnabled: NO];
    }
    if ([JkDataShare shareDatabase].isThirdLogin) {
        [[JKdataBasehandle shareDatabase] openDB];
       
     NSLog(@"aaaaaa%@", [[JKdataBasehandle shareDatabase]selectByUseridOfuser:[UserInfoManager manager].usid])   ;
        ThirdLoginModel *model = [[[JKdataBasehandle shareDatabase]selectByUseridOfuser:[UserInfoManager manager].usid] objectAtIndex:0];
        if ([[NSString stringWithFormat:@"%@", model.message] isEqualToString:@"(null)"]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示:只需10秒钟" message:@"您是否注册过微云诊室" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *right = [UIAlertAction actionWithTitle:@"没有，去注册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                registVC *regist = [[registVC alloc]init];
                regist.isThirdLogin = YES;
                [self.navigationController pushViewController:regist animated:YES];
                
            }];
            UIAlertAction *left= [UIAlertAction actionWithTitle:@"注册过了，绑定账号" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                bangdingzhanghaoVC *viewc = [[bangdingzhanghaoVC alloc]init];
                [self.navigationController pushViewController:viewc animated:YES];
                
            }];
            UIAlertAction *left2= [UIAlertAction actionWithTitle:@"取   消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alert addAction:right];
            [alert addAction:left];
            [alert addAction:left2];
            
            [self presentViewController:alert animated:YES completion:^{
                
                
            }];
            
            
            

        } else {
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
            

        }
           
    } else {
        [JkDataShare shareDatabase].isThirdLogin = NO;

    }
//
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.searchbar.hidden = YES;
}


-(void)viewDidLoad
{
      [super viewDidLoad];
    self.view.frame = [[UIScreen mainScreen] bounds];
    self.view.backgroundColor = [UIColor colorWithRed:0.902 green:0.902 blue:0.902 alpha:1.0];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"抽屉" style:UIBarButtonItemStylePlain target:self action:@selector(leftAct)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"yonghutouxiang"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAct)];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"扫一扫" style:UIBarButtonItemStylePlain target:self action:@selector(RightAct)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"saoyisao"] style:UIBarButtonItemStylePlain target:self action:@selector(RightAct)];
    self.searchbar = [[UISearchBar alloc]initWithFrame:CGRectMake(70/ WIDTHSIXP * WIDGHT, 5/HEIGHTSIXP *HEIGHT, 230/ WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
    self.searchbar.delegate =self;
    self.searchbar.placeholder = @"请输入要搜索的内容";
    self.searchbar.tintColor = [UIColor colorWithRed:0.1882 green:0.651 blue:0.9529 alpha:1.0];
  [self.navigationController.navigationBar addSubview:self.searchbar];
    
   [self  createview];
    
}
#pragma mark 创建视图方法
- (void)createview
{
    self.tableview = [[UITableView alloc]initWithFrame:self.view.frame  style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.showsHorizontalScrollIndicator = NO;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.backgroundColor = [UIColor colorWithRed:0.902 green:0.902 blue:0.902 alpha:1.0];

    
    self.cycSV2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0 / WIDTHSIXP * WIDGHT, 0 / HEIGHTSIXP * HEIGHT, 0 / WIDTHSIXP * WIDGHT, 170 / HEIGHTSIXP * HEIGHT) delegate:self placeholderImage:[UIImage imageNamed:@"占位.jpg"]];
    self.cycSV2.delegate = self;
    self.tableview.tableHeaderView = self.cycSV2;
    
    NSArray *arr1 = @[[UIImage imageNamed:@"2.jpg"], [UIImage imageNamed:@"3.jpg"], [UIImage imageNamed:@"4.png"], [UIImage imageNamed:@"8.jpg"], [UIImage imageNamed:@"16.jpg"]];
    
    self.cycSV2.localizationImagesGroup = arr1;
//    NSArray *titles = @[@"欢迎来到召唤师", @"发撒上发送", @"发烧发烧发烧发",@"啊倒因为果发生"];
//    self.cycSV2.titlesGroup = titles;
    self.cycSV2.autoScrollTimeInterval = 3.0;
 
    [self.view addSubview:self.tableview];
    
//    UIScreenEdgePanGestureRecognizer  *pan = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(TapAct:)];
//    [self.tableview addGestureRecognizer:pan];
//    [self initializeGestureRecognizer];
//    self.hideview = [[CloudHospitalHideView alloc]initWithFrame:CGRectMake(-200 , 80/HEIGHTSIXP *HEIGHT, 200
//                                                                           ,   HEIGHTSIXP)];
//    [self.view addSubview:self.hideview];
//    
//    UITapGestureRecognizer   *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(respondToOkBtn)];
//    [self.tableview addGestureRecognizer:tap];
}
#pragma mark - respondToOkBtn
- (void)respondToOkBtn
{
    //判断，如果滑动视图的中心点 > 最小距离的中心点
    if ( self.hideview.center.x > MIN_CENTER_X + CGRectGetWidth(self.view.bounds)/2) {
        [UIView animateWithDuration:0.4 animations:^{
            /**< 滑动视图的中心点 = 最小距离的中心点 */
             self.hideview.frame = CGRectMake(0, 0, WIDTHSIXP/ 3 *2,   HEIGHTSIXP);
        }];
    }
    else
    {
        /**< 反之则执行 滑动视图的中心点 = 最大距离的中心点  */
        [UIView animateWithDuration:0.4 animations:^{
            self.hideview.frame = CGRectMake(0, 0, WIDTHSIXP/ 3 *2,   HEIGHTSIXP);
        }];
    }
}

#pragma mark -添加拖动手势
- (void)initializeGestureRecognizer
{
    //创建拖动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(respondsToGestureRecognizer:)];
    //将手势添加到滑动视图上
    [self.view addGestureRecognizer:pan];
}
/**< 响应拖动手势  */
- (void)respondsToGestureRecognizer:(UIPanGestureRecognizer*)getsure
{
    //设置移动距离
    CGPoint translation = [getsure translationInView:self.hideview];
    //设置拖动中心
    CGPoint desCenter;
    desCenter.y = self.hideview.center.y;
    
    //设置x轴的变化位置
    CGFloat source_x = self.hideview.center.x;
    
    //如果移动距离的值 <= 0 时，则向左滑
    if (translation.x <= 0) {
        //MAX 两者之中取最大值
          desCenter.x = MIN(desCenter.x = source_x + translation.x,  CGRectGetWidth(self.view.bounds)/2);
    }
    else//向右滑
    {
      
          desCenter.x = MAX(desCenter.x = source_x + translation.x, CGRectGetWidth(self.view.bounds)/2);
    }
    //移动的中心点 赋值给 拖动视图的中心点
    self.hideview.center = desCenter;
    //拖动视图上的拖动手势设置移动的起始坐标为(0,0)
    [getsure setTranslation:CGPointMake(0, 0) inView:self.hideview];
    
}
- (void)TapAct:(UIScreenEdgePanGestureRecognizer *)sender
{
    NSLog(@"111");
    [UIView animateWithDuration:1.0 animations:^{
        self.hideview.frame = CGRectMake(0, 0, WIDTHSIXP/ 3 *2,   HEIGHTSIXP);
        
    }];
}
#pragma mark tableview方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.row) {
        return 230/HEIGHTSIXP *HEIGHT;
    }
    return 50/ HEIGHTSIXP * HEIGHT;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (0 == indexPath.row) {
        static NSString *cellstr = @"cell";
        CloudHospitalFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
        
        if (nil == cell) {
            cell = [[CloudHospitalFirstCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellstr];
            cell.selectionStyle =UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor colorWithRed:0.902 green:0.902 blue:0.902 alpha:1.0];
            cell.delegate = self;
        }
        return  cell;
    }
    static NSString *cellstr = @"cell";
    CloudHospatilSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
    
    if (nil == cell) {
        cell = [[CloudHospatilSecondCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellstr];
        
        cell.backgroundColor =[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0] ;
        cell.layer.borderColor = [[UIColor colorWithRed:0.702 green:0.702 blue:0.702 alpha:1.0] CGColor];
        cell.layer.borderWidth = 1.0;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    if (indexPath.row > 0) {
        NSArray *titles = @[@"相关病症疾病知识推送",@"相关病症疾病知识推送", @"医生医院信息"];
      NSArray *images = @[@"h1.jpg", @"xingxing",@"xingxing"];
        cell.textLabel.text = titles[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    }

    return  cell;
    
}
#pragma mark 左右button方法
- (void)leftAct
{

    if ([JkDataShare shareDatabase].isLogin) {
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        if (tempApp.leftSlideVC.closed) {
            NSLog(@"关的要打开%d", tempApp.leftSlideVC.closed);
            [tempApp.leftSlideVC openLeftView];
        } else {
            NSLog(@"开的要关闭%d",tempApp.leftSlideVC.closed);
            [tempApp.leftSlideVC closeLeftView];
        }
    } else {
            loginViewControlller *module = [[loginViewControlller alloc]init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:module];

        [self presentViewController:navi animated:YES completion:nil];     
    
//                    [self.navigationController pushViewController:module animated:YES];
        
        
    }

    
    
}
- (void)RightAct
{
    
    if ([JkDataShare shareDatabase].isLogin) {
        CloudGetinfoVC *getinfo = [[CloudGetinfoVC alloc]init];
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [tempApp.leftSlideVC setPanEnabled: NO];
        
        [self.navigationController pushViewController:getinfo animated:YES];
    } else {
        loginViewControlller *module = [[loginViewControlller alloc]init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:module];
        
        [self presentViewController:navi animated:YES completion:nil];
    }
   
}
#pragma mark  回首键盘
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
//    NSLog(@"1");
    return NO;
}
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
////    [self.searchbar resignFirstResponder];
//    [self.view endEditing:YES];
//}
#pragma mark 点击轮播图
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}
#pragma mark  协议跳转
-(void)changeTomydoctor
{
    if ([JkDataShare shareDatabase].isLogin ) {
        CloudMydoctor *mydoctor = [[CloudMydoctor alloc]init];
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [tempApp.leftSlideVC setPanEnabled: NO];

        [self.navigationController pushViewController:mydoctor animated:YES];

    }else {
        loginViewControlller *module = [[loginViewControlller alloc]init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:module];
        
        [self presentViewController:navi animated:YES completion:nil];
    }
   }
- (void)changeTomyBingli
{
    if ([JkDataShare shareDatabase].isLogin ) {
        cloudMybingli *report = [[cloudMybingli alloc]init];
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [tempApp.leftSlideVC setPanEnabled: NO];

        [self.navigationController pushViewController:report animated:YES];
        
    }else {
        loginViewControlller *module = [[loginViewControlller alloc]init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:module];
        
        [self presentViewController:navi animated:YES completion:nil];
    }


    
}
- (void)changeTomyImage
{
    if ([JkDataShare shareDatabase].isLogin) {
        CloudMyImage *Image = [[CloudMyImage alloc]init];
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
         [tempApp.leftSlideVC setPanEnabled: NO];
        [self.navigationController pushViewController:Image animated:YES];
        
    } else {
        
        loginViewControlller *module = [[loginViewControlller alloc]init];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:module];
        [self presentViewController:navi animated:YES completion:nil];
    }
    
    
 }
@end
