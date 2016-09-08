//
//  JKdataBasehandle.h
//  Cloudhospital
//
//  Created by yuhao on 16/5/4.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ReadpersonListModel;
@class ThirdLoginModel;
@interface JKdataBasehandle : NSObject
@property (nonatomic, assign)BOOL STATUS;
+(instancetype)shareDatabase;
- (void)openDB;
- (void)closeDB;
- (void)createTable;
- (void)deleteTable;
- (void)insertDataWithReadpersonListModel:(ReadpersonListModel *)readpersonlistModel;
- (void)deleteDataWithReadpersonListModel:(NSString *)pacs_args;
- (void)deleteDataWithReadpersonListModelusername:(NSString *)username;
- (void)upDataWithNumber:(NSInteger)num ReadpersonListModel:(ReadpersonListModel *)ReadpersonListModel;
- (NSMutableArray *)selectAllUser;
- (NSMutableArray *)selectBytitleOfUser:(NSString *)cname;
//- (NSMutableArray *)selectBytitleOfUser:(NSString *)caccno;

- (void)createThirdLoginfoTable;
- (void)deleteThirdLogininfoTable;
- (void)insertdataWithThirdloginModel:(ThirdLoginModel *)thirdloginmodel;
- (void)deleteDataWithThirdloginModel:(NSString *)ThirdLoginuserid;
- (void)upDataWithThirdloginModelwithsuerid:(NSString *)userid ThirdloginModel:(ThirdLoginModel *)thirdloginmodel phonenum:(NSString *)phonenum;
- (NSMutableArray *)selectAllThirdLoginUser;
- (NSMutableArray *)selectByUseridOfuser:(NSString *)userid;


@end
