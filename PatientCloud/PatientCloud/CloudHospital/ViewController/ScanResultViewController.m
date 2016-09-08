//
//  ScanResultViewController.m
//  LBXScanDemo
//
//  Created by lbxia on 15/11/17.
//  Copyright © 2015年 lbxia. All rights reserved.
//

#import "ScanResultViewController.h"
#import "CloudSaoyiSaoDetail.h"
#import "ReadpaperdetailViewController.h"
@interface ScanResultViewController ()

//@property (weak, nonatomic) IBOutlet UIImageView *scanImg;
//@property (weak, nonatomic) IBOutlet UILabel *labelScanText;
//@property (weak, nonatomic) IBOutlet UILabel *labelScanCodeType;

@property (nonatomic, retain)UIImageView *scanImg;
@property (nonatomic, retain)UILabel *labelScanText;
@property (nonatomic, retain)UILabel *labelScanCodeType;
@end

@implementation ScanResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createview];
    
    // Do any additional setup after loading the view from its nib.
//    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
//        
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
}

- (void)createview
{
    self.scanImg = [[UIImageView alloc]initWithFrame:CGRectMake(40/WIDTHSIXP * WIDGHT , 84/ HEIGHTSIXP * HEIGHT, 280/WIDTHSIXP * WIDGHT, 300/ HEIGHTSIXP * HEIGHT)];
    if (_imgScan) {
        self.scanImg.backgroundColor = [UIColor grayColor];
    }
    self.scanImg.image = _imgScan;
    [self.view addSubview:self.scanImg];
    self.labelScanCodeType = [[UILabel alloc]initWithFrame:CGRectMake(60/WIDTHSIXP * WIDGHT, 414/ HEIGHTSIXP * HEIGHT, 260/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT)];
    if ([_strCodeType isEqualToString:@"org.iso.Code128"]) {
        self.labelScanCodeType.text = @"码的类型 ： 条形码";
    }
    if ([_strCodeType isEqualToString:@"org.iso.QRCode"]) {
        self.labelScanCodeType.text = @"码的类型 ： 二维码";
    }
//     self.labelScanCodeType.text =  [NSString stringWithFormat:@"码的类型:%@",_strCodeType];
    [self.view addSubview:self.labelScanCodeType];
    self.labelScanText = [[UILabel alloc]initWithFrame:CGRectMake(60/WIDTHSIXP * WIDGHT, 464/ HEIGHTSIXP * HEIGHT, 260/WIDTHSIXP * WIDGHT, 60/ HEIGHTSIXP * HEIGHT)];
    self.labelScanText.backgroundColor = [UIColor colorWithRed:0.299 green:0.9765 blue:0.4531 alpha:1.0];
    self.labelScanText.text = @"打开链接";
    self.labelScanText.textAlignment = NSTextAlignmentCenter;
    self.labelScanText.layer.borderWidth = 1.0;
    self.labelScanText.userInteractionEnabled = YES;
    self.labelScanText.layer.borderColor = [[UIColor colorWithRed:0.2505 green:1.0 blue:0.3478 alpha:1.0] CGColor];
    [self.view addSubview:self.labelScanText];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openlianjie)];
    [self.labelScanText addGestureRecognizer:tap];
    
}
- (void)openlianjie
{
    if ([_strCodeType isEqualToString:@"org.iso.Code128"]) {
        CloudSaoyiSaoDetail  *Detail = [[CloudSaoyiSaoDetail alloc]init];
        Detail.strmag =_strScan;
        [self.navigationController pushViewController:Detail animated:YES];
    }else {
        ReadpaperdetailViewController *WEBview = [[ReadpaperdetailViewController alloc]init];
        WEBview.url = _strScan;
        [self.navigationController pushViewController:WEBview animated:YES];
        NSLog(@"%@", _strScan);
        //                  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:msg]];
    }
    

}


@end
