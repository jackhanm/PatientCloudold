//
//  AboutUS.m
//  PatientCloud
//
//  Created by yuhao on 16/8/4.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "AboutUS.h"
#import "UMSocial.h"

@interface AboutUS ()<UMSocialUIDelegate>

@end

@implementation AboutUS

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"关于我们" ;
    [self createview];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@" 分享" style:UIBarButtonItemStylePlain target:self action:@selector(buttonAct)];
    
    // Do any additional setup after loading the view.
}
- (void)buttonAct
{
    [UMSocialData defaultData].extConfig.title = @"来自云诊室的分享";
    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"57bc36d6e0f55a5c84002533"
                                      shareText:@"微云诊室(大众)，是一款专门为用户打造的，用于患者和医生之间进行病情咨询，探讨，自身疾病档案管理App工具。我们致力于打造一款行业内最高标准的医疗移动影像云，微云诊室，与你同行！https://itunes.apple.com/app/id1116874386"
                                     shareImage:[UIImage imageNamed:@"icon"]
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
                                       delegate:self];
}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

- (void)createview
{
    self.textview = [[UITextView alloc]initWithFrame:CGRectMake(10/WIDTHSIXP *WIDGHT, 100/HEIGHTSIXP *HEIGHT, 355/WIDTHSIXP *WIDGHT, 400/HEIGHTSIXP *HEIGHT)];;
    
    self.textview.backgroundColor = [UIColor clearColor];
    
    self.textview.textColor = [UIColor colorWithRed:0.251 green:0.194 blue:1.000 alpha:1.000];
//    self.textview.layer.borderWidth = 1;
    self.textview.editable = NO;
//    self.textview.layer.borderColor = [[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0]CGColor];
//    self.textview.layer.cornerRadius = 5/ HEIGHTSIXP * HEIGHT;
//    self.textview.layer.masksToBounds = YES;
    self.textview.font = [UIFont fontWithName:@"Zapfino" size:15.0/HEIGHTSIXP *HEIGHT];
    self.textview.text = @"微云诊室(大众)，是一款专门为用户打造的，用于患者和医生之间进行病情咨询，探讨，自身疾病档案管理App工具。我们致力于打造一款行业内最高标准的医疗移动影像云，微云诊室，与你同行！";
    [self.view addSubview:self.textview];
    
    
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
