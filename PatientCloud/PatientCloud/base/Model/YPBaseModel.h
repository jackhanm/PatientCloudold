//
//  YPBaseModel.h
//  Cloudhospital
//
//  Created by yuhao on 16/3/28.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YPBaseModel : NSObject
- (instancetype)initWithDic:(NSMutableDictionary *)dic;
+ (instancetype)baseModelWithDic:(NSMutableDictionary *)dic;
+ (NSMutableArray *)baseModelWithArr:(NSMutableArray *)arr;


@property (nonatomic,copy)NSString *mId;
@end
