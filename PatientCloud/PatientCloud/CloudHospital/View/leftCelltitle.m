//
//  leftCelltitle.m
//  PatientCloud
//
//  Created by yuhao on 16/8/4.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "leftCelltitle.h"

@implementation leftCelltitle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self creatview];
    }
    return self;
}
- (void)creatview
{
    self.imageview = [[UIImageView alloc]init];
//    self.imageview.backgroundColor = [UIColor orangeColor];
    self.imageview.image = [UIImage imageNamed:@"66.fw"];
    self.imageview.userInteractionEnabled = YES;
    [self addSubview:self.imageview];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAct)];
    [self.imageview addGestureRecognizer:tap];
    
    self.labelwelcome = [[UILabel alloc]init];
//    self.labelwelcome.backgroundColor  = [UIColor orangeColor];
    self.labelwelcome.text = @" 欢 迎 您";
    self.labelwelcome.font = [UIFont fontWithName:@" CourierNewPSMT" size:18.0];
    [self addSubview:self.labelwelcome];
    
    self.labelname = [[UILabel alloc]init];
//    self.labelname.backgroundColor = [UIColor orangeColor];
    
    self.labelname.text = @" 用户";
    self.labelname.font = [UIFont fontWithName:@" CourierNewPSMT" size:12];
    self.labelname.textColor = [UIColor redColor];
    [self addSubview:self.labelname];
    

}
- (void)tapAct
{
    [self.delegate chagetoPhotoview];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageview.frame = CGRectMake(30/ WIDTHSIXP * WIDGHT, 30 / HEIGHTSIXP * HEIGHT, 60/ WIDTHSIXP * WIDGHT, 60/ HEIGHTSIXP * HEIGHT);
//    self.imageview.layer.cornerRadius = 30;
    self.imageview.layer.masksToBounds = YES;
    self.labelwelcome.frame = CGRectMake(100/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT, 90/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    self.labelname.frame = CGRectMake(100/ WIDTHSIXP * WIDGHT, 60/ HEIGHTSIXP * HEIGHT, 90/ WIDTHSIXP * WIDGHT, 20/ HEIGHTSIXP * HEIGHT);
}
@end
