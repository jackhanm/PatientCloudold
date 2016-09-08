//
//  JkDataShare.m
//  PatientCloud
//
//  Created by yuhao on 16/7/29.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "JkDataShare.h"

@implementation JkDataShare
+(instancetype)shareDatabase
{
    static JkDataShare *Database = nil;
    if (nil == Database) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Database = [[JkDataShare alloc]init];
        });
    }
    return Database;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _isLogin = NO;
        _isThirdLogin = NO;
        _isTHirdLoginInfo = NO;
    }
    return self;
}


@end
