//
//  UserInfoManager.h
//  Cloudhospital
//
//  Created by yuhao on 16/3/31.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UserInfoManager : NSObject



+(UserInfoManager *)manager;
/**
 *  昵称
 */
-(NSString *)userName;

/**
 *  手机号
 */
- (NSString *)phoneID;


- (NSString *)user_id;
/**
 *    用户user_id
 */
-(NSString *)user_identifyid;
/**
 *    用户user_identifyid
 */


/**
 *    用户头像url
 */
-(NSString *)avaterUrl;
/**
 *  性别 默认是男
 */
-(BOOL)user_gender;

/**
 *  所属医院
 *
 *  @param NSString
 *
 *  @return
 */

-(NSString *)user_hospital;

/**
 *  地区
 */
- (NSString *)user_address;

/**
 *  个性签名
 */
- (NSString *)sign;

/**
 *  真正用于登录的id
 */
@property(nonatomic,copy)NSString  *mid;

/**
 *  密码
 */
@property(nonatomic,copy)NSString  *password;


/**
 *  是否已登录
 */
@property(nonatomic,assign)BOOL isLogin;

/**
 *  是否打开了会话环境
 */
@property(nonatomic,assign)BOOL isOpenIm;

/**
 *  缓存的头像
 */
- (UIImage *)avater;
/**
 *  保存img
 */
- (void)saveImgDataWithImg:(UIImage *)img;
/**8
 *  医院民称代码
 */
@property(nonatomic,copy)NSString  *hospitalCodeName;

/**
 *  医院名称名字数组
 */
@property(nonatomic, strong)NSArray *hospitalListName;
/**
 *  医院名称代码数组
 */
@property(nonatomic, strong)NSArray *hospitalListNameCode;
/**
 *  县级，乡镇中心医院医生
 */
@property (nonatomic, assign)BOOL istownDoctor;

/**
 *  提示框方法
 */
-(UIAlertController *)Promptview:(NSString *)str;

/**
 *  县级，乡镇中心医院的id
 */
@property (nonatomic, copy) NSString *hospitalid;

#pragma mark 第三方登录
- (NSString *)user_name;
- (NSString *)usid;
- (NSString *)picture_path;


@end
