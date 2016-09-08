//
//  MenuItemModel.h
//  Cloudhospital
//
//  Created by yuhao on 16/4/12.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "YPBaseModel.h"

@interface MenuItemModel : YPBaseModel
//正常状态下图片
@property (nonatomic, strong) NSString *normalImageName;
//高亮状态下图片
@property (nonatomic, strong) NSString *highLightedImageName;
//选中状态下图片
@property (nonatomic, strong) NSString *selectedImageName;
//菜单item的标题
@property (nonatomic, strong) NSString *itemText;

/**
 *  构造函数
 *
 *  @param normalImageName      正常状态下图片
 *  @param highLightedImageName 高亮状态下图片
 *  @param itemText             菜单item的标题
 *
 *  @return
 */
- (id)initWithNormalImageName:(NSString *)normalImageName
     withHighLightedImageName:(NSString *)highLightedImageName
                 withItemText:(NSString *)itemText;

/**
 *  构造函数
 *
 *  @param normalImageName      正常状态下图片
 *  @param highLightedImageName 高亮状态下图片
 *  @param selectedImageName    选中状态下图片
 *  @param itemText             菜单item的标题
 *
 *  @return
 */
- (id)initWithNormalImageName:(NSString *)normalImageName
     withHighLightedImageName:(NSString *)highLightedImageName
        withSelectedImageName:(NSString *)selectedImageName
                 withItemText:(NSString *)itemText;
@end
