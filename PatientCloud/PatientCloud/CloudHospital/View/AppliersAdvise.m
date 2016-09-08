//
//  AppliersAdvise.m
//  Cloudhospital
//
//  Created by yuhao on 16/7/4.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "AppliersAdvise.h"

@implementation AppliersAdvise

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creteview];
    }
    return self;
}
- (void)creteview
{
    self.title = [[UILabel alloc]init];
    self.title.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.title];
    self.detail = [[UILabel alloc]init];
    self.detail.numberOfLines = 0;
    self.detail.backgroundColor = [UIColor orangeColor ];
    [self addSubview:self.detail];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.title.frame   = CGRectMake(10/WIDTHSIXP *WIDGHT ,  10/ HEIGHTSIXP *HEIGHT, 100/WIDTHSIXP *WIDGHT, 30/ HEIGHTSIXP *HEIGHT);
    self.detail.frame = CGRectMake(10/WIDTHSIXP *WIDGHT, 40/ HEIGHTSIXP *HEIGHT, 330/WIDTHSIXP *WIDGHT, 160/ HEIGHTSIXP *HEIGHT);
}
@end
