//
//  DataPickerModel.h
//  Cloudhospital
//
//  Created by yuhao on 16/4/15.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "YPBaseModel.h"

@interface DataPickerModel : YPBaseModel
@property (nonatomic, retain) NSString *year;
@property (nonatomic, retain) NSString *month;
@property (nonatomic, retain) NSString *day;
@property (nonatomic, retain) NSString *hour;
@property (nonatomic, retain) NSString *minute;

- (id)initWithDate:(NSDate *)date;
@end
