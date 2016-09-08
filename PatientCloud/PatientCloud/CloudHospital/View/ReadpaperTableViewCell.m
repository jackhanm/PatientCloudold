//
//  ReadpaperTableViewCell.m
//  Cloudhospital
//
//  Created by yuhao on 16/4/5.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "ReadpaperTableViewCell.h"
#import "YPBaseButton.h"
#import "UIButton+Extra.h"


#define MENU_ITEM_SPACE     5
#define MENU_ITEM_WHIDE     ([[UIScreen mainScreen] bounds].size.width - 6*5)/5
#define MENU_ITEM_HEIGHT    50

#define MAX_ITEM_COUNT      5

@interface ReadpaperTableViewCell ()
//下拉菜单数据源
@property (nonatomic, strong) NSMutableArray *menuItemDataSourceArray;

//是否已经绘制了下拉菜单
@property (nonatomic, assign) BOOL isAlreadyDrawMenu;

@end

@implementation ReadpaperTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customCell];
    }
    return self;
}

- (void)customCell
{
    
    //最重要的一句代码！没有的话单元格直接全部显示下拉菜单了！两句随便选一句
    self.layer.masksToBounds = YES;
    //    self.clipsToBounds = YES;
    //设置cell自身属性(必须设置，不然收起下拉菜单动画可能有问题)
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    
    self.label1 = [[UILabel alloc]init];
    //    self.label1.backgroundColor = [UIColor redColor];
    self.label1.frame = CGRectMake(10/ WIDTHSIXP * WIDGHT, 10/HEIGHTSIXP *HEIGHT, 70/ WIDTHSIXP * WIDGHT, 70/HEIGHTSIXP *HEIGHT);
    self.label1.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:18/HEIGHTSIXP *HEIGHT];
//    self.label1.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label1];
    
    self.label2 = [[UILabel alloc]init];
    //    self.label1.backgroundColor = [UIColor redColor];
    self.label2.frame = CGRectMake(10/ WIDTHSIXP * WIDGHT, 15/HEIGHTSIXP *HEIGHT, 210/ WIDTHSIXP * WIDGHT, 60/HEIGHTSIXP *HEIGHT);
 self.label2.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:18/HEIGHTSIXP *HEIGHT];
//    self.label2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label2];
    
    self.label3 = [[UILabel alloc]init];
    //    self.label1.backgroundColor = [UIColor redColor];
    self.label3.frame = CGRectMake(150/ WIDTHSIXP * WIDGHT, 10/HEIGHTSIXP *HEIGHT, 40/ WIDTHSIXP * WIDGHT, 60/HEIGHTSIXP *HEIGHT);
  self.label3.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:18/HEIGHTSIXP *HEIGHT];
//    self.label3.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label3];
    
    
    self.label4= [[UILabel alloc]init];
    //    self.label1.backgroundColor = [UIColor redColor];
    self.label4.frame = CGRectMake(10/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT, 100/ WIDTHSIXP * WIDGHT, 60/HEIGHTSIXP *HEIGHT);
   self.label4.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:12/HEIGHTSIXP *HEIGHT];

//    self.label4.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label4];
    
    
    self.label5= [[UILabel alloc]init];
    //    self.label1.backgroundColor = [UIColor redColor];
    self.label5.frame = CGRectMake(220/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT, 220/ WIDTHSIXP * WIDGHT,30 /HEIGHTSIXP *HEIGHT);
   self.label5.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:15/HEIGHTSIXP *HEIGHT];
  
   
//    self.label5.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label5];
    
    self.label6= [[UILabel alloc]init];
    //    self.label1.backgroundColor = [UIColor redColor];
    self.label6.frame = CGRectMake(220/ WIDTHSIXP * WIDGHT, 20/HEIGHTSIXP *HEIGHT, 100/ WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT);
//  self.label6.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:8/HEIGHTSIXP *HEIGHT];
    self.label6.font = [UIFont systemFontOfSize:12];
    self.label6.numberOfLines = 0;
 //    self.label6.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label6];
    
    self.view1 = [[UIView alloc]init];
    self.view1.frame = CGRectMake(0/ WIDTHSIXP * WIDGHT, 70/HEIGHTSIXP *HEIGHT, 375/ WIDTHSIXP * WIDGHT, 60/HEIGHTSIXP *HEIGHT);
    self.view1.backgroundColor = [UIColor blackColor ];
    [self addSubview:self.view1];
    
    self.view2 = [[UIView alloc]init];
    self.view2.frame = CGRectMake(0/ WIDTHSIXP * WIDGHT, 69/HEIGHTSIXP *HEIGHT, 375/ WIDTHSIXP * WIDGHT, 0/HEIGHTSIXP *HEIGHT);
    self.view2.backgroundColor = [UIColor blackColor ];
    [self addSubview:self.view2];

    
    self.moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.moreBtn setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateSelected];
      [self.moreBtn setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateNormal];
    self.moreBtn.frame = CGRectMake(320/ WIDTHSIXP * WIDGHT, 15/HEIGHTSIXP *HEIGHT, 60/ WIDTHSIXP * WIDGHT, 60/HEIGHTSIXP *HEIGHT);
    [self.moreBtn addTarget:self action:@selector(moreClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.moreBtn];
    
}
- (void)buildMenuView
{
    //避免多次绘制下拉菜单
    if (self.isAlreadyDrawMenu)
    {
        return;
    }
    
    //构建菜单
    self.menuItemDataSourceArray = [NSMutableArray arrayWithCapacity:0];
    if ([self.dataSource respondsToSelector:@selector(dataSourceForMenuItem)])
    {
        self.menuItemDataSourceArray = [self.dataSource dataSourceForMenuItem];
        
      
  
       __weak ReadpaperTableViewCell *weakSelf = self;

       [self.menuItemDataSourceArray  enumerateObjectsUsingBlock:^(MenuItemModel *menuItemModel, NSUInteger idx, BOOL * _Nonnull stop) {
           
           
        
           if (idx >= MAX_ITEM_COUNT) {
               //下拉菜单的item超过最大数(MAX_ITEM_COUNT:5)的时候就不绘制,可以自定义下拉菜单个数
               return ;
           }
           
            CGRect menuItemRect = CGRectMake(MENU_ITEM_SPACE + (MENU_ITEM_SPACE + MENU_ITEM_WHIDE) * idx, 0, MENU_ITEM_WHIDE, MENU_ITEM_HEIGHT);
           YPBaseButton *menuItemButton = [[YPBaseButton alloc] initWithFrame:menuItemRect model:menuItemModel];
                       menuItemButton.tag = idx;
                       [menuItemButton addTarget:self
                                          action:@selector(menuItemClick:)
                                forControlEvents:UIControlEventTouchUpInside];
                       [weakSelf.view1 addSubview:menuItemButton];
//                     menuItemButton.backgroundColor = [UIColor orangeColor];
                   }];
        
        

        
    }
    
    self.isAlreadyDrawMenu = YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    //设置单元格菜单是否被打开，其实可以直接使用isSelected代替。
    self.isOpenMenu = selected;
}
/**
 *  下拉菜单按钮
 *
 *  @param sender 下拉菜单按钮
 */
- (void)moreClick:(UIButton *)sender

{
    NSLog(@"1");
    if ([self.delegate respondsToSelector:@selector(didOpenMenuAtCell:withMoreButton:)])
    {
        [self.delegate didOpenMenuAtCell:self withMoreButton:sender];
    }

}
/**
 *  下拉菜单item点击事件
 *
 *  @param sender 下拉菜单item
 */
- (void)menuItemClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(menuTableViewCell:didSeletedMentItemAtIndex:)])
    {
        [self.delegate menuTableViewCell:self didSeletedMentItemAtIndex:sender.tag];
    }
}

@end
