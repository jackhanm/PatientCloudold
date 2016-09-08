//
//  YPBaseModel.m
//  Cloudhospital
//
//  Created by yuhao on 16/3/28.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "YPBaseModel.h"

@implementation YPBaseModel
- (instancetype)initWithDic:(NSMutableDictionary *)dic
{
    self = [super init];
    if(self) {
        [self setValuesForKeysWithDictionary:dic];
        
        
    }
    return self;
}

+ (instancetype)baseModelWithDic:(NSMutableDictionary *)dic
{
    
    id obj = [[[self class] alloc] initWithDic:dic];
    return obj ;

}

+ (NSMutableArray *)baseModelWithArr:(NSMutableArray *)arr
{
    
    NSMutableArray *modelArr = [NSMutableArray array];
    for (NSMutableDictionary *dic in arr) {
//       @autoreleasepool {
        
            id model = [[self class] baseModelWithDic:dic];
            
            [modelArr addObject:model];
//       }
    }
    return modelArr;
    
}



/**
 *  kvc 容错
 *
 *  @param value value
 *  @param key   key
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.mId = value;
        
    }
    
}
@end
