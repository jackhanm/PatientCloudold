//
//  YPBaseButton.m
//  Cloudhospital
//
//  Created by yuhao on 16/3/28.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "YPBaseButton.h"

@implementation YPBaseButton

- (id)initWithFrame:(CGRect)frame model:(MenuItemModel *)menuItemModel
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self customViewWithModel:menuItemModel];
    }
    
    return self;
}

- (void)customViewWithModel:(MenuItemModel *)menuItemModel
{
    //图片
    UIImageView *buttonImageView = [[UIImageView alloc] init];
    buttonImageView.bounds = CGRectMake(0/ WIDTHSIXP * WIDGHT, 0 / HEIGHTSIXP * HEIGHT, 20, 20 / HEIGHTSIXP * HEIGHT);
    buttonImageView.center = CGPointMake(self.frame.size.width/2, 20 / HEIGHTSIXP * HEIGHT);
    buttonImageView.image = [UIImage imageNamed:menuItemModel.normalImageName];
    [self addSubview:buttonImageView];
    
    //文案
    UILabel *buttonLabel = [[UILabel alloc] init];
    buttonLabel.bounds = CGRectMake(0, 0, self.frame.size.width, 20 / HEIGHTSIXP * HEIGHT);
    buttonLabel.center = CGPointMake(self.frame.size.width/2, self.frame.size.height - buttonLabel.frame.size.height/2);
    buttonLabel.text = menuItemModel.itemText;
    buttonLabel.textAlignment = NSTextAlignmentCenter;
    buttonLabel.font = [UIFont systemFontOfSize:10 / HEIGHTSIXP * HEIGHT];
    buttonLabel.textColor = [UIColor colorWithRed:0.9658 green:0.972 blue:1.0 alpha:1.0];
    [self addSubview:buttonLabel];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
