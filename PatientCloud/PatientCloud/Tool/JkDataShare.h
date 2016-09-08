//
//  JkDataShare.h
//  PatientCloud
//
//  Created by yuhao on 16/7/29.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JkDataShare : NSObject

+(instancetype)shareDatabase;

/**
 *  是否已登录
 */
@property(nonatomic,assign)BOOL isLogin;

/**
 *  是否是三方登录
 */
@property (nonatomic , assign)BOOL isThirdLogin;
@property  (nonatomic ,assign)BOOL isTHirdLoginInfo;

@property (nonatomic, copy)NSString *hospitalCodename;

/**
 *  用户ID
 */
@property (nonatomic, copy)NSString *userID;
@end
