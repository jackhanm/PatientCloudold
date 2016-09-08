//
//  CloudHospitalFirstCell.m
//  PatientCloud
//
//  Created by yuhao on 16/4/25.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "CloudHospitalFirstCell.h"

@implementation CloudHospitalFirstCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createview];
    }
    return self;
}
- (void)createview
{
    self.backgroundColor = [UIColor colorWithRed:0.9255 green:0.9216 blue:0.9373 alpha:1.0];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5/WIDTHSIXP *WIDGHT, 10/HEIGHTSIXP *HEIGHT, [UIScreen mainScreen].bounds.size.width /2, 150/HEIGHTSIXP *HEIGHT)];
    view.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    view.layer.borderColor = [[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0] CGColor];
    view.layer.borderWidth = 1.0;
    [self addSubview:view];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(40/WIDTHSIXP *WIDGHT, 10/HEIGHTSIXP *HEIGHT, 100/WIDTHSIXP *WIDGHT, 100/HEIGHTSIXP *HEIGHT)];
//    image.backgroundColor = [UIColor orangeColor];
    image.layer.cornerRadius = 50;
    image.image = [UIImage imageNamed:@"女医生"];
    [view addSubview:image];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(55/WIDTHSIXP *WIDGHT, 110/HEIGHTSIXP *HEIGHT, 100/WIDTHSIXP *WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
//    label.backgroundColor = [UIColor colorWithRed:0.0 green:0.502 blue:1.0 alpha:1.0];
    label.text = @"我的医生";
    [view addSubview:label];
    
    
    
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(7/WIDTHSIXP *WIDGHT + [UIScreen mainScreen].bounds.size.width /2 , 10/HEIGHTSIXP *HEIGHT, [UIScreen mainScreen].bounds.size.width /2 - 10/WIDTHSIXP *WIDGHT, 70/HEIGHTSIXP *HEIGHT)];
    view1.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    view1.layer.borderColor = [[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0] CGColor];
    view1.userInteractionEnabled = YES;
    view1.layer.borderWidth = 1.0;
    [self addSubview:view1];
    
    
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(20/WIDTHSIXP *WIDGHT, 10/HEIGHTSIXP *HEIGHT, 50/WIDTHSIXP *WIDGHT, 50/HEIGHTSIXP *HEIGHT)];
//    image1.backgroundColor = [UIColor orangeColor];
//    image1.layer.cornerRadius = 25;
    image1.image = [UIImage imageNamed:@"baogao"];
    image1.layer.masksToBounds = YES;
    [view1 addSubview:image1];
    
    UILabel *label1= [[UILabel alloc]initWithFrame:CGRectMake(80/WIDTHSIXP *WIDGHT, 20/HEIGHTSIXP *HEIGHT, 90/WIDTHSIXP *WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
//    label1.backgroundColor = [UIColor colorWithRed:0.0 green:0.502 blue:1.0 alpha:1.0];
    label1.text = @"我的报告";
    [view1 addSubview:label1];

    
    
    
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(7/WIDTHSIXP *WIDGHT + [UIScreen mainScreen].bounds.size.width /2, 81/HEIGHTSIXP *HEIGHT, [UIScreen mainScreen].bounds.size.width /2 - 10/WIDTHSIXP *WIDGHT, 78/HEIGHTSIXP *HEIGHT)];
    view2.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    view2.layer.borderColor = [[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0] CGColor];
    view2.layer.borderWidth = 1.0;
    [self addSubview:view2];
    
    
    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(20/WIDTHSIXP *WIDGHT, 15/HEIGHTSIXP *HEIGHT, 50/WIDTHSIXP *WIDGHT, 50/HEIGHTSIXP *HEIGHT)];
//    image2.backgroundColor = [UIColor orangeColor];
    image2.image = [UIImage imageNamed:@"yuan1"];
//    image2.layer.cornerRadius = 25;
    image2.layer.masksToBounds = YES;
    [view2 addSubview:image2];
    
    UILabel *label2= [[UILabel alloc]initWithFrame:CGRectMake(80/WIDTHSIXP *WIDGHT, 25/HEIGHTSIXP *HEIGHT, 90/WIDTHSIXP *WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
//    label2.backgroundColor = [UIColor colorWithRed:0.0 green:0.502 blue:1.0 alpha:1.0];
    label2.text = @"云胶片";
    [view2 addSubview:label2];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapAct)];
    [view addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Tap1Act)];
    [view1 addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Tap2Act)];
    [view2 addGestureRecognizer:tap2];
    
}
- (void)TapAct
{
    NSLog(@"1");
    [self.delegate changeTomydoctor];
}
- (void)Tap1Act
{
    [self.delegate changeTomyBingli];
}
- (void)Tap2Act
{
    [self.delegate changeTomyImage];
}
@end
