//
//  YPBaseButton.h
//  Cloudhospital
//
//  Created by yuhao on 16/3/28.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItemModel.h"
@interface YPBaseButton : UIButton
/**
 *  @author li_yong
 *
 *  构造方法
 *
 *  @param frame         rect
 *  @param menuItemModel 构造模型
 *
 *  @return
 */
- (id)initWithFrame:(CGRect)frame model:(MenuItemModel *)menuItemModel;
@end
