//
//  leftCelltitle.h
//  PatientCloud
//
//  Created by yuhao on 16/8/4.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "YPBaseTableViewCell.h"

@protocol leftCelltitledelegate <NSObject>

- (void)chagetoPhotoview;

@end


@interface leftCelltitle : YPBaseTableViewCell
@property (nonatomic ,assign)id<leftCelltitledelegate>delegate;
@property (nonatomic ,retain)UIImageView *imageview;
@property (nonatomic,retain)UILabel *labelname;
@property (nonatomic ,retain)UILabel *labelwelcome;

@end
