//
//  UIButton+Extra.m
//  Cloudhospital
//
//  Created by yuhao on 16/4/12.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "UIButton+Extra.h"

@implementation UIButton (Extra)
/**
 *  下拉菜单按钮的工厂方法
 *
 *  @param menuItemModel 创建下拉菜单按钮的Model
 *  @param buttonFrame   创建下拉菜单按钮的尺寸
 *
 *  @return
 */
// UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
+ (UIButton *)creartButtonWith:(MenuItemModel *)menuItemModel withFrame:(CGRect)buttonFrame
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = buttonFrame;
    //    [button setBackgroundColor:[UIColor redColor]];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    
    [button setImage:[UIImage imageNamed:menuItemModel.normalImageName]
            forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:menuItemModel.highLightedImageName]
            forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:menuItemModel.selectedImageName]
            forState:UIControlStateSelected];
    [button setImageEdgeInsets:UIEdgeInsetsMake(10/ WIDTHSIXP * WIDGHT, 19/HEIGHTSIXP * HEIGHT, 20/ WIDTHSIXP * WIDGHT, 19/ WIDTHSIXP * WIDGHT)];
    //    button.imageView.backgroundColor = [UIColor greenColor];
    
    [button setTitle:menuItemModel.itemText forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor]
                 forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:10/HEIGHTSIXP * HEIGHT];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    //    CGRect titleLabelRect = button.titleLabel.frame;
    //    CGRect imageViewRect = button.imageView.frame;
    //    [button setTitleEdgeInsets:UIEdgeInsetsMake(25, (buttonFrame.size.width - titleLabelRect.size.width)/2 - imageViewRect.size.width, 5, -(titleLabelRect.size.width))];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(35/ WIDTHSIXP * WIDGHT, -(buttonFrame.size.width)-7/HEIGHTSIXP * HEIGHT, 5/ WIDTHSIXP * WIDGHT, 0/HEIGHTSIXP * HEIGHT)];
    //    button.titleLabel.backgroundColor = [UIColor blueColor];
    
    return button;
}
@end
