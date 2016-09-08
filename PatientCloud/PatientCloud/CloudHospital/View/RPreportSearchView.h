//
//  RPreportSearchView.h
//  Cloudhospital
//
//  Created by yuhao on 16/4/14.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "YPBaseView.h"
@class RPreportSearchView;
typedef enum{
    
    UUDateStyle_YearMonthDayHourMinute = 0,
    UUDateStyle_YearMonthDay,
    UUDateStyle_MonthDayHourMinute,
    UUDateStyle_HourMinute
    
}DateStyle;
typedef void (^FinishBlock)(NSString * year,
                            NSString * month,
                            NSString * day,
                            NSString * hour,
                            NSString * minute,
                            NSString * weekDay);


//  说明，DatePicker的Size最小是320x216的。

@protocol RPreportSearchViewDelegate <NSObject>

-(void)Datepicker:(RPreportSearchView *)datepocker year:(NSString *)year month:(NSString *)month day:(NSString *)day hour:(NSString *)hour minute: (NSString *)minute weekDay:(NSString *)weekDay;


@end
@interface RPreportSearchView : YPBaseView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,assign) id<RPreportSearchViewDelegate>delegate;

@property (nonatomic, assign) DateStyle datePickerStyle;

@property (nonatomic, retain) NSDate *ScrollToDate;//滚到指定日期
@property (nonatomic, retain) NSDate *maxLimitDate;//限制最大时间（没有设置默认2049）
@property (nonatomic, retain) NSDate *minLimitDate;//限制最小时间（没有设置默认1970）


- (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
- (id)initWithframe:(CGRect)frame Delegate:(id<RPreportSearchViewDelegate>)delegate PickerStyle:(DateStyle)uuDateStyle;
- (id)initWithframe:(CGRect)frame PickerStyle:(DateStyle)uuDateStyle didSelected:(FinishBlock)finishBlock;



@end
