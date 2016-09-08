//
//  leftvcCellnormol.m
//  PatientCloud
//
//  Created by yuhao on 16/7/11.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "leftvcCellnormol.h"

@implementation leftvcCellnormol

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
    self.imageNormol= [[UIImageView alloc]init];
//    self.imageNormol.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.imageNormol];
    self.label = [[UILabel alloc]init];
    self.label.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.label];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageNormol.frame = CGRectMake(30/WIDTHSIXP * WIDGHT, 10/HEIGHTSIXP * HEIGHT, 30/WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP * HEIGHT);
    self.label .frame = CGRectMake(80/WIDTHSIXP * WIDGHT, 10/HEIGHTSIXP * HEIGHT, 120/WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP * HEIGHT);
    
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
