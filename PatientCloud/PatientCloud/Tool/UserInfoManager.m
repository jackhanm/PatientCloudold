//
//  UserInfoManager.m
//  Cloudhospital
//
//  Created by yuhao on 16/3/31.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "UserInfoManager.h"

@implementation UserInfoManager
+(UserInfoManager *)manager
{
    
    static UserInfoManager *manager = nil;
    if (nil == manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[UserInfoManager alloc]init];
        });
    }
    
    return manager;
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _isLogin = NO;
        _isOpenIm = NO;
        _istownDoctor = NO;
        
    }
    return self;
}

- (NSString *)userName
{
    
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"user_realname"];
}
- (NSString *)user_id
{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"user_id"];
}
- (NSString *)user_identifyid
{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"user_identifyid"];
}

-(NSString *)phoneID
{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"user_phone"];
}
- (NSString *)avaterUrl
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"picture_path"];
}
-(NSString *)user_hospital
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"user_hospital"];
}
- (NSString *)user_address
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"user_address"];
}
- (BOOL)user_gender
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return [dic[@"user_gender"]boolValue];
}

- (NSString *)sign
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"user_signature"];
}
- (NSString *)user_name
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"user_name"];
}
- (NSString *)usid
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"usid"];
}

- (NSString *)picture_path
{
    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
    return dic[@"picture_path"];
}
//- (NSString *)mid
//{
//    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
//    return dic[@"mid"];
//}

//- (NSString *)password
//{
//    NSDictionary * dic = [[NSUserDefaults standardUserDefaults]objectForKey:wUserInfo];
//    return dic[@"password"];
//}
- (UIImage *)avater
{
    NSData * data = [[NSUserDefaults standardUserDefaults]objectForKey:@"avater"];
    
  return [UIImage imageWithData:data];
    
}

- (void)saveImgDataWithImg:(UIImage *)img
{
    NSData *imageData = UIImageJPEGRepresentation(img, 1);
    [[NSUserDefaults standardUserDefaults]setObject:imageData forKey:@"avater"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
-(UIAlertController *)Promptview:(NSString *)str
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:str preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *right = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    UIAlertAction *left= [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [alert addAction:right];
    [alert addAction:left];
    return alert;
    

}
@end
