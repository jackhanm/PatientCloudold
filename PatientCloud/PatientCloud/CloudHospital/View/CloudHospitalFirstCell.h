//
//  CloudHospitalFirstCell.h
//  PatientCloud
//
//  Created by yuhao on 16/4/25.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "YPBaseTableViewCell.h"

@protocol CloudHospitalFirstCelldelegate <NSObject>

-  (void)changeTomydoctor;
-  (void)changeTomyBingli;
-  (void)changeTomyImage;

@end


@interface CloudHospitalFirstCell : YPBaseTableViewCell
@property (nonatomic, assign)id<CloudHospitalFirstCelldelegate>delegate;

@end
