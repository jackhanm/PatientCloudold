//
//  CloudMyImageCell.m
//  PatientCloud
//
//  Created by yuhao on 16/8/19.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "CloudMyImageCell.h"

@implementation CloudMyImageCell


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
    self.backgroundColor = [UIColor colorWithRed:0.9686 green:0.9765 blue:1.0 alpha:1.0];
    self.backgroundColor = [UIColor whiteColor];
    self.imageback = [[UIImageView alloc]init];
    self.imageback.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    [self addSubview:self.imageback];
    
    self.labeltitie = [[UILabel alloc]init];
//    self.labeltitie.backgroundColor = [UIColor orangeColor];
    self.labeltitie.text = @"姓名";
    [self.imageback addSubview:self.labeltitie];
    
    self.title = [[UILabel alloc]init];
//    self.title.backgroundColor = [UIColor orangeColor];
    self.title.text = @"性别";
    [self.imageback addSubview:self.title];
    
    self.labeltime = [[UILabel alloc]init];
//    self.labeltime.backgroundColor = [UIColor orangeColor];
    self.labeltime.text = @"年龄" ;
    [self.imageback addSubview:self.labeltime];
    
    self.time = [[UILabel alloc]init];
//    self.time.backgroundColor = [UIColor orangeColor];
    self.time.text = @"部位";
    [self.imageback addSubview:self.time];
    
    self.labelperson = [[UILabel alloc]init];
//    self.labelperson.backgroundColor = [UIColor orangeColor];
    self.labelperson.text = @"报告时间" ;
    [self.imageback addSubview:self.labelperson];
    
    self.imagetime = [[UIImageView alloc]init];
//    self.imagetime.backgroundColor = [UIColor orangeColor];
    self.imagetime.image = [UIImage imageNamed:@"shizhong"];
    [self.imageback addSubview:self.imagetime];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageback.frame = CGRectMake(5/ WIDTHSIXP * WIDGHT, 5 / HEIGHTSIXP * HEIGHT, 360 / WIDTHSIXP * WIDGHT, 115 / HEIGHTSIXP * HEIGHT);
    self.labeltitie.textColor = [UIColor colorWithRed:0.4207 green:0.8295 blue:1.0 alpha:1.0];
    self.labeltitie.frame = CGRectMake(15/ WIDTHSIXP * WIDGHT, 10/ HEIGHTSIXP * HEIGHT, 80/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    self.title.frame = CGRectMake(150/ WIDTHSIXP * WIDGHT, 10/ HEIGHTSIXP * HEIGHT, 40/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    self.labeltime.frame = CGRectMake(220/ WIDTHSIXP * WIDGHT, 10/ HEIGHTSIXP * HEIGHT, 50/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    self.time.frame = CGRectMake(15/ WIDTHSIXP * WIDGHT, 45/ HEIGHTSIXP * HEIGHT, 300/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    self.imagetime.frame = CGRectMake(15/ WIDTHSIXP * WIDGHT, 80/ HEIGHTSIXP * HEIGHT, 30/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    
    self.labelperson.frame = CGRectMake(60/ WIDTHSIXP * WIDGHT, 80/ HEIGHTSIXP * HEIGHT, 150/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
