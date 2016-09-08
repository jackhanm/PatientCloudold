//
//  MyQRViewController.m
//  LBXScanDemo
//
//  Created by lbxia on 15/10/21.
//  Copyright © 2015年 lbxia. All rights reserved.
//

#import "MyQRViewController.h"
#import "LBXScanWrapper.h"
#import "UIImageView+CornerRadius.h"

@interface MyQRViewController ()

//二维码
@property (nonatomic, strong) UIView *qrView;
@property (nonatomic, strong) UIImageView* qrImgView;

//条形码
@property (nonatomic, strong) UIView *tView;
@property (nonatomic, strong) UIImageView *tImgView;


@end

@implementation MyQRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Checkmark"] style:UIBarButtonItemStylePlain target:self action:@selector(RightAct)];
     // Do any additional setup after loading the view.
//    
//    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
//        
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }

    
    self.view.backgroundColor = [UIColor whiteColor];
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake( (CGRectGetWidth(self.view.frame)-CGRectGetWidth(self.view.frame)*5/6)/2, 100, CGRectGetWidth(self.view.frame)*5/6, CGRectGetWidth(self.view.frame)*5/6)];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(40, 180, 300, 300)];
        [self.view addSubview:view];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.shadowOffset = CGSizeMake(0, 2);
        view.layer.shadowRadius = 2;
        view.layer.shadowColor = [UIColor blackColor].CGColor;
        view.layer.shadowOpacity = 0.5;
    
    
        self.qrImgView = [[UIImageView alloc]init];
        _qrImgView.bounds = CGRectMake(0, 0, CGRectGetWidth(view.frame)-12, CGRectGetWidth(view.frame)-12);
        _qrImgView.center = CGPointMake(CGRectGetWidth(view.frame)/2, CGRectGetHeight(view.frame)/2);
        [view addSubview:_qrImgView];
        self.qrView = view;
    _qrView.hidden = NO;
    _tView.hidden = YES;
    if (self.codestr.length > 0) {
        _qrImgView.image = [LBXScanWrapper createQRWithString:self.codestr size:_qrImgView.bounds.size];
    } else {
    _qrImgView.image = [LBXScanWrapper createQRWithString:@"https://itunes.apple.com/app/id1116874386" size:_qrImgView.bounds.size];
    }
    CGSize logoSize=CGSizeMake(80, 80);
    UIImageView* imageView = [self roundCornerWithImage:[UIImage imageNamed:@"1024.png"] size:logoSize];
    [LBXScanWrapper addImageViewLogo:_qrImgView centerLogoImageView:imageView logoSize:logoSize];
}

#pragma mark 保存二维码
- (void)RightAct
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, 0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);

}


- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *message = @"";
    if (!error) {
        message = @"成功保存到相册";
        [self showHint:@"成功保存到相册"];
        }else
    {
        message = [error description];
    }
    NSLog(@"message is %@",message);
    [self showHint: message];
}
- (UIImageView*)roundCornerWithImage:(UIImage*)logoImg size:(CGSize)size
{
    //logo圆角
    UIImageView *backImage = [[UIImageView alloc] initWithCornerRadiusAdvance:6.0f rectCornerType:UIRectCornerAllCorners];
    backImage.frame = CGRectMake(0, 0, size.width, size.height);
    backImage.backgroundColor = [UIColor whiteColor];
    
    UIImageView *logImage = [[UIImageView alloc] initWithCornerRadiusAdvance:6.0f rectCornerType:UIRectCornerAllCorners];
    logImage.image =logoImg;
    CGFloat diff  =2;
    logImage.frame = CGRectMake(diff, diff, size.width - 2 * diff, size.height - 2 * diff);
    
    [backImage addSubview:logImage];
    
    
    return backImage;
}




@end
