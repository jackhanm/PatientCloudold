//
//  ChangeinfoCell.h
//  PatientCloud
//
//  Created by yuhao on 16/8/16.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol  ChangeinfoCelldelegate<NSObject>

- (void)textfieldEdit : (NSInteger) tag;
- (void)textfieldEditEnd:(NSInteger)tag;
@end


@interface ChangeinfoCell : UITableViewCell
@property (nonatomic,assign)id<ChangeinfoCelldelegate>delegate;

@property (nonatomic ,retain)UILabel *labeltitile;
@property (nonatomic, retain) UITextField *textfield;

@end
