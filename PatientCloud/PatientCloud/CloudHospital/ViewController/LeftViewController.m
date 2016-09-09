//
//  LeftViewController.m
//  医生版demo
//
//  Created by yuhao on 16/3/22.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "LeftViewController.h"
#import "CloudHospitalVC.h"
#import "AppDelegate.h"
#import "leftvcCellnormol.h"
#import "leftCelltitle.h"
#import "ChangePhoto.h"
#import "ChangeInfo.h"
#import "Changemima.h"
#import "Wenzhenjilu.h"
#import "yiwuguanjia.h"
#import "message.h"
#import "Guanzhu.h"
#import "settingup.h"
#import "AboutUS.h"
#import "closeApp.h"
#import "familyMember.h"
#import "AppDelegate.h"
#import "JkDataShare.h"
#import "UserInfoManager.h"
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, retain)UITableView *tableView;
@end

@implementation LeftViewController


- (void)viewDidLoad {
    [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
      
  [self createview];
    
    // Do any additional setup after loading the view.
}
-(void)createview
{
//    UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.view.frame];
//    imageV.image = [UIImage imageNamed:@"Stars.png"];
//    [self.view addSubview:imageV];
  
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0/ WIDTHSIXP * WIDGHT, (HEIGHT - 54/ HEIGHTSIXP * HEIGHT * 10) / 2.0f, WIDGHT, 54/HEIGHTSIXP * HEIGHT  * 10) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.backgroundView = nil;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        tableView.bounces = NO;
        tableView;
    });
    [self.view addSubview:self.tableView];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 120/ HEIGHTSIXP * HEIGHT;
    }
    return 50/ HEIGHTSIXP * HEIGHT;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 11;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        if (indexPath.row == 1) {
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        ChangeInfo *info = [[ChangeInfo alloc]init];
        [tempApp.leftSlideVC closeLeftView];
        [tempApp.cloudhospitalnc pushViewController:info animated:NO];

    }
    if (indexPath.row == 2) {
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        Changemima *info = [[Changemima alloc]init];
        [tempApp.leftSlideVC closeLeftView];
        [tempApp.cloudhospitalnc pushViewController:info animated:NO];

    }
//    if (indexPath.row == 3) {
//        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        familyMember *info = [[familyMember alloc]init];
//        [tempApp.leftSlideVC closeLeftView];
//        [tempApp.cloudhospitalnc pushViewController:info animated:NO];
//        
//    }
    if (indexPath.row == 4) {
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        Wenzhenjilu *info = [[Wenzhenjilu alloc]init];
        [tempApp.leftSlideVC closeLeftView];
        [tempApp.cloudhospitalnc pushViewController:info animated:NO];
        
    }
    if (indexPath.row == 5) {
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        yiwuguanjia *info = [[yiwuguanjia alloc]init];
        [tempApp.leftSlideVC closeLeftView];
        [tempApp.cloudhospitalnc pushViewController:info animated:NO];
        
    }
    if (indexPath.row == 6) {
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        message *info = [[message alloc]init];
        [tempApp.leftSlideVC closeLeftView];
        [tempApp.cloudhospitalnc pushViewController:info animated:NO];
        
    }
    if (indexPath.row == 7) {
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        Guanzhu *info = [[Guanzhu alloc]init];
        [tempApp.leftSlideVC closeLeftView];
        [tempApp.cloudhospitalnc pushViewController:info animated:NO];
        
    }
    if (indexPath.row == 8) {
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        settingup *info = [[settingup alloc]init];
        [tempApp.leftSlideVC closeLeftView];
        [tempApp.cloudhospitalnc pushViewController:info animated:NO];
        
    }
    if (indexPath.row == 9) {
        AppDelegate *tempApp = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        AboutUS *info = [[AboutUS alloc]init];
        [tempApp.leftSlideVC closeLeftView];
        [tempApp.cloudhospitalnc pushViewController:info animated:NO];
        
    }
    if (indexPath.row == 10) {
        
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"user"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"key"];
        exit(0);
        
    }


    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 0) {
        
  
    static NSString *cellstr = @"Cell1";
    
    leftCelltitle *cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
    
    if (cell == nil) {
        cell = [[leftCelltitle alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellstr];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21 / HEIGHTSIXP * HEIGHT];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
        
            cell.labelname.text  = [[UserInfoManager manager] user_name];
        cell.labelname.font = [UIFont systemFontOfSize:15.0/ HEIGHTSIXP * HEIGHT];
        
    //
    return cell;
        
    }
    if (indexPath.row > 0) {
        
    
    static NSString *cellIdentifier = @"Cell";
    
    leftvcCellnormol *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[leftvcCellnormol alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
//
//    if (indexPath.row > 1) {
       NSArray *titles = @[@"个 人 信 息", @"密 码 管 理", @"家 庭 成 员", @"问 诊 记 录", @"医 务 管 家", @"消    息",@"关    注",@"设    置", @"关    于",@"注    销"];
      NSArray *images = @[@"gerenxinxi", @"mimaguanli", @"jiatingchengyuan", @"wenzhenjilu", @"yiwuguanjia", @"xiaoxi",@"wodeguanzhu", @"shezhi", @"guanyu", @"zhuxiao"];
        cell.label.text = titles[indexPath.row - 1];
        cell.imageNormol.image = [UIImage imageNamed:images[indexPath.row - 1]];
        if (indexPath.row  == 11) {
            cell.label.textColor = [UIColor redColor];
        }
        
    return cell;
//
}
        return nil;
}

- (void)chagetoPhotoview{

    

//    ChangePhoto *photo = [[ChangePhoto alloc]init];
    
    
    
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
