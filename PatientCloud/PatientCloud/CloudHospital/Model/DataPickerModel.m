//
//  DataPickerModel.m
//  Cloudhospital
//
//  Created by yuhao on 16/4/15.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "DataPickerModel.h"

@implementation DataPickerModel
- (id)initWithDate:(NSDate *)date
{
    self = [super init];
    if (self) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyyMMddHHmm"];
        NSString *dateString = [formatter stringFromDate:date];
        
        self.year     = [dateString substringWithRange:NSMakeRange(0, 4)];
        self.month    = [dateString substringWithRange:NSMakeRange(4, 2)];
        self.day      = [dateString substringWithRange:NSMakeRange(6, 2)];
        self.hour     = [dateString substringWithRange:NSMakeRange(8, 2)];
        self.minute   = [dateString substringWithRange:NSMakeRange(10, 2)];
    }
    return self;
}
@end
