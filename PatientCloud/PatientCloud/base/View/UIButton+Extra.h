//
//  UIButton+Extra.h
//  Cloudhospital
//
//  Created by yuhao on 16/4/12.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItemModel.h"
@interface UIButton (Extra)
/**
 *  下拉菜单按钮的工厂方法
 *
 *  @param menuItemModel 创建下拉菜单按钮的Model
 *  @param buttonFrame   创建下拉菜单按钮的尺寸
 *
 *  @return
 */
+ (UIButton *)creartButtonWith:(MenuItemModel *)menuItemModel withFrame:(CGRect)buttonFrame;
@end
