//
//  ReadpaperTableViewCell.h
//  Cloudhospital
//
//  Created by yuhao on 16/4/5.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "YPBaseTableViewCell.h"

@protocol MenutableViewCellDataSource;
@protocol MenuTableViewCellDelegate;

@interface ReadpaperTableViewCell : YPBaseTableViewCell
@property (nonatomic, retain)UILabel *label1;
@property (nonatomic, retain)UILabel *label2;
@property (nonatomic, retain)UILabel *label3;
@property (nonatomic, retain)UILabel *label4;
@property (nonatomic, retain)UILabel *label5;
@property (nonatomic, retain)UILabel *label6;
@property  (nonatomic, retain)UIView *view1;

@property  (nonatomic, retain)UIView *view2;
//@property (nonatomic, retain)UIButton *button;
//是否已经打开
@property (nonatomic, assign) BOOL isOpenMenu;
//下拉菜单按钮
@property (nonatomic, retain)UIButton *moreBtn;

//下拉菜单视图
@property (nonatomic, retain) UIView *menuView;

//cell的位置标签
@property (strong, nonatomic) IBOutlet UILabel *indexPathLabel;

@property (strong, nonatomic) id <MenutableViewCellDataSource> dataSource;
@property (strong, nonatomic) id <MenuTableViewCellDelegate> delegate;

/**
 *  @author li_yong
 *
 *  自定义Cell中控件属性
 */
- (void)customCell;

/**
 *  构建下拉视图
 */
- (void)buildMenuView;
@end
@protocol MenutableViewCellDataSource <NSObject>

@required
- (NSMutableArray *)dataSourceForMenuItem;

@end
@protocol MenuTableViewCellDelegate <NSObject>

@optional
- (void)didOpenMenuAtCell:(ReadpaperTableViewCell *)menuCell withMoreButton:(UIButton *)moreButton;

- (void)menuTableViewCell:(ReadpaperTableViewCell *)menuTableViewCell didSeletedMentItemAtIndex:(NSInteger)menuItemIndex;

@end
