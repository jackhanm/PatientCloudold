//
//  JKdataBasehandle.m
//  Cloudhospital
//
//  Created by yuhao on 16/5/4.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "JKdataBasehandle.h"
#import "ReadpersonListModel.h"
#import "ThirdLoginModel.h"
#import <sqlite3.h>
@implementation JKdataBasehandle
+(instancetype)shareDatabase
{
    static JKdataBasehandle *Database = nil;
    if (nil == Database) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Database = [[JKdataBasehandle alloc]init];
            
        });
    }
    return Database;
}
         static sqlite3 *DB1 = nil;
- (void)openDB
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *filePath = [path stringByAppendingPathComponent:@"dataBase.db"];
    int ret = sqlite3_open(filePath.UTF8String, &DB1);
    if (SQLITE_OK == ret) {
        NSLog(@"打开数据库成功");
    } else {
        NSLog(@"打开数据库失败");
    }
    
}
- (void)closeDB
{
    int ret = sqlite3_close(DB1);
    if (SQLITE_OK == ret) {
        NSLog(@"关闭数据库成功");
    } else {
        NSLog(@"关闭数据库失败");
    }
}
- (void)createTable
{

    
    NSString *sqlStr = @"CREATE TABLE IF NOT EXISTS ReadpersonListModel(number integer PRIMARY KEY AUTOINCREMENT,cage TEXT, cblkh TEXT, cbz TEXT, cname TEXT, csex TEXT, exam_id TEXT,jcsj TEXT, pacs_args TEXT,cbgzd TEXT, cbgsj_hl7 TEXT,dshsj TEXT, caccno TEXT , hospitalCodename TEXT, username TEXT)";
    int ret = sqlite3_exec(DB1, sqlStr.UTF8String, NULL, NULL, NULL);
    if (SQLITE_OK == ret) {
        NSLog(@"创建表单成功");
    } else {
        NSLog(@"创建表单失败");
    }
    
    
}
- (void)deleteTable
{
    NSString *sqlStr =  @"DROP TABLE ReadpersonListModel";
    
    int ret = sqlite3_exec(DB1, sqlStr.UTF8String, NULL, NULL, NULL);
    
    if (SQLITE_OK == ret) {
        NSLog(@"删除表单成功");
    } else {
        NSLog(@"删除表单失败");
    }
}
- (void)insertDataWithReadpersonListModel:(ReadpersonListModel *)readpersonlistModel;
{

    NSString *sqlStr = [NSString stringWithFormat:@"INSERT INTO ReadpersonListModel(cage, cblkh, cbz, cname, csex, exam_id, jcsj, pacs_args,cbgzd,cbgsj_hl7,dshsj,caccno,hospitalCodename, username) VALUES ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')", readpersonlistModel.cage, readpersonlistModel.cblkh, readpersonlistModel.cbz,readpersonlistModel.cname, readpersonlistModel.csex,readpersonlistModel.exam_id, readpersonlistModel.jcsj, readpersonlistModel.pacs_args,readpersonlistModel.cbgzd, readpersonlistModel.cbgsj_hl7, readpersonlistModel.dshsj, readpersonlistModel.caccno, readpersonlistModel.hospitalCodename, readpersonlistModel.username];
    
    int ret = sqlite3_exec(DB1, sqlStr.UTF8String, NULL, NULL, NULL);
    
    if (SQLITE_OK == ret) {
        NSLog(@"插入数据成功");
    } else {
        NSLog(@"插入数据失败");
    }
}
- (void)deleteDataWithReadpersonListModel:(NSString *)pacs_args
{
    NSString *sqlstr = [NSString stringWithFormat: @"DELETE FROM ReadpersonListModel WHERE pacs_args = '%@'", pacs_args];
    int ret = sqlite3_exec(DB1, sqlstr.UTF8String, NULL, NULL, NULL);
    
    if (SQLITE_OK == ret) {
        NSLog(@"删除数据成功");
    } else {
        NSLog(@"删除数据失败");
    }

}
- (void)deleteDataWithReadpersonListModelusername:(NSString *)username
{
    NSString *sqlstr = [NSString stringWithFormat: @"DELETE FROM ReadpersonListModel WHERE username = '%@'", username];
    int ret = sqlite3_exec(DB1, sqlstr.UTF8String, NULL, NULL, NULL);
    
    if (SQLITE_OK == ret) {
        NSLog(@"删除数据成功");
    } else {
        NSLog(@"删除数据失败");
    }
    
}
- (void)upDataWithNumber:(NSInteger)num ReadpersonListModel:(ReadpersonListModel *)ReadpersonListModel
{
    NSString *sqlstr = [NSString stringWithFormat: @"UPDATE ReadpersonListModel SET ReadpersonListModel.cname = '%@', ReadpersonListModel.pacs_args = '%@' WHERE number = '%ld'", ReadpersonListModel.cname, ReadpersonListModel.pacs_args, num];
    int ret = sqlite3_exec(DB1, sqlstr.UTF8String, NULL, NULL, NULL);
    
    if (SQLITE_OK == ret) {
        NSLog(@"修改数据成功");
    } else {
        NSLog(@"修改数据失败");
    }

}
- (NSMutableArray *)selectAllUser
{
    NSString *sqlstr = @"SELECT * FROM ReadpersonListModel";
    sqlite3_stmt *stmt = nil;
    int ret = sqlite3_prepare_v2(DB1, sqlstr.UTF8String, -1, &stmt, NULL);
    if (SQLITE_OK == ret) {
        
        
        NSMutableArray *arr = [NSMutableArray array];
        //判断是否还有有效数据
        while (SQLITE_ROW == sqlite3_step(stmt)) {
            
            //参数:列数
            const unsigned char *cage =  sqlite3_column_text(stmt, 1);
            const unsigned char *cblkh =  sqlite3_column_text(stmt, 2);
            const unsigned char *cbz =  sqlite3_column_text(stmt, 3);
            const unsigned char *cname =  sqlite3_column_text(stmt, 4);
            const unsigned char *csex =  sqlite3_column_text(stmt, 5);
            const unsigned char *exam_id =  sqlite3_column_text(stmt, 6);
            const unsigned char *jcsj =  sqlite3_column_text(stmt, 7);
            const unsigned char *pacs_args =  sqlite3_column_text(stmt, 8);
            const unsigned char *cbgzd =  sqlite3_column_text(stmt, 9);
            const unsigned char *cbgsj_hl7=  sqlite3_column_text(stmt, 10);
            const unsigned char *dshsj =  sqlite3_column_text(stmt, 11);
            const unsigned char *caccno =  sqlite3_column_text(stmt, 12);
            const unsigned char *hospitalCodename =  sqlite3_column_text(stmt, 13);
            const unsigned char *username =  sqlite3_column_text(stmt, 14);
            
            ReadpersonListModel *readpersonListModel = [[ReadpersonListModel alloc]init];
            //            stu.name = name;
            readpersonListModel.cage = [NSString stringWithUTF8String:(const char *)cage];
            readpersonListModel.cblkh = [NSString stringWithUTF8String:(const char *)cblkh];
            readpersonListModel.cbz = [NSString stringWithUTF8String:(const char *)cbz];
            readpersonListModel.cname = [NSString stringWithUTF8String:(const char *)cname];
            readpersonListModel.csex = [NSString stringWithUTF8String:(const char *)csex];
            readpersonListModel.exam_id = [NSString stringWithUTF8String:(const char *)exam_id];
            readpersonListModel.jcsj = [NSString stringWithUTF8String:(const char *)jcsj];
            readpersonListModel.pacs_args = [NSString stringWithUTF8String:(const char *)pacs_args];
            readpersonListModel.cbgzd = [NSString stringWithUTF8String:(const char *)cbgzd];
            readpersonListModel.cbgsj_hl7 = [NSString stringWithUTF8String:(const char *)cbgsj_hl7];
            readpersonListModel.dshsj = [NSString stringWithUTF8String:(const char *)dshsj];
            readpersonListModel.caccno = [NSString stringWithUTF8String:(const char *)caccno];
             readpersonListModel.hospitalCodename = [NSString stringWithUTF8String:(const char *)hospitalCodename];
           
            
             [arr addObject:readpersonListModel];
         
            
            
        }
        return arr;
    } else {
        NSLog(@"获取数据失败");
        return nil;
    }
}
- (NSMutableArray *)selectBytitleOfUser:(NSString *)cname
{
       NSString *sqlstr = [NSString stringWithFormat:  @"SELECT * FROM ReadpersonListModel WHERE  cname LIKE '%%%@%%'", cname];
    sqlite3_stmt *stmt = nil;
    int ret = sqlite3_prepare_v2(DB1, sqlstr.UTF8String, -1, &stmt, NULL);
    if (SQLITE_OK == ret) {
        
        
        NSMutableArray *arr = [NSMutableArray array];
        //判断是否还有有效数据
        while (SQLITE_ROW == sqlite3_step(stmt)) {
            
            //参数:列数
            const unsigned char *cage =  sqlite3_column_text(stmt, 1);
            const unsigned char *cblkh =  sqlite3_column_text(stmt, 2);
            const unsigned char *cbz =  sqlite3_column_text(stmt, 3);
            const unsigned char *cname =  sqlite3_column_text(stmt, 4);
            const unsigned char *csex =  sqlite3_column_text(stmt, 5);
            const unsigned char *exam_id =  sqlite3_column_text(stmt, 6);
            const unsigned char *jcsj =  sqlite3_column_text(stmt, 7);
            const unsigned char *pacs_args =  sqlite3_column_text(stmt, 8);
            const unsigned char *cbgzd =  sqlite3_column_text(stmt, 9);
            const unsigned char *cbgsj_hl7=  sqlite3_column_text(stmt, 10);
            const unsigned char *dshsj =  sqlite3_column_text(stmt, 11);
            const unsigned char *caccno =  sqlite3_column_text(stmt, 12);
            const unsigned char *hospitalCodename =  sqlite3_column_text(stmt, 13);
            
            ReadpersonListModel *readpersonListModel = [[ReadpersonListModel alloc]init];
            //            stu.name = name;
            readpersonListModel.cage = [NSString stringWithUTF8String:(const char *)cage];
            readpersonListModel.cblkh = [NSString stringWithUTF8String:(const char *)cblkh];
            readpersonListModel.cbz = [NSString stringWithUTF8String:(const char *)cbz];
            readpersonListModel.cname = [NSString stringWithUTF8String:(const char *)cname];
            readpersonListModel.csex = [NSString stringWithUTF8String:(const char *)csex];
            readpersonListModel.exam_id = [NSString stringWithUTF8String:(const char *)exam_id];
            readpersonListModel.jcsj = [NSString stringWithUTF8String:(const char *)jcsj];
            readpersonListModel.pacs_args = [NSString stringWithUTF8String:(const char *)pacs_args];
            readpersonListModel.cbgzd = [NSString stringWithUTF8String:(const char *)cbgzd];
            readpersonListModel.cbgsj_hl7 = [NSString stringWithUTF8String:(const char *)cbgsj_hl7];
            readpersonListModel.dshsj = [NSString stringWithUTF8String:(const char *)dshsj];
            readpersonListModel.caccno = [NSString stringWithUTF8String:(const char *)caccno];
            readpersonListModel.hospitalCodename = [NSString stringWithUTF8String:(const char *)hospitalCodename];
           
            [arr addObject:readpersonListModel];
            
            
            
        }
        return arr;
    } else {
        NSLog(@"获取数据失败");
        return nil;
    }

}
/***********************************************************第三方登录表单 *******************************************************/

- (void)createThirdLoginfoTable
{
      NSString *sqlStr = @"CREATE TABLE IF NOT EXISTS ThirdLoginModel(number integer PRIMARY KEY AUTOINCREMENT,thirdusername TEXT, usid TEXT, tocken TEXT, iconUrl TEXT, figureurl_qq_2 TEXT, phonenum TEXT,unionId TEXT, thirdPlatformUserProfile TEXT,thirdplatformResponse TEXT, message TEXT)";
    int ret = sqlite3_exec(DB1, sqlStr.UTF8String, NULL, NULL, NULL);
    if (SQLITE_OK == ret) {
        NSLog(@"创建表单成功");
    } else {
        NSLog(@"创建表单失败");
    }

}
- (void)deleteThirdLogininfoTable
{
    NSString *sqlStr =  @"DROP TABLE ThirdLoginModel";
    
    int ret = sqlite3_exec(DB1, sqlStr.UTF8String, NULL, NULL, NULL);
    
    if (SQLITE_OK == ret) {
        NSLog(@"删除表单成功");
    } else {
        NSLog(@"删除表单失败");
    }

    
}
- (void)insertdataWithThirdloginModel:(ThirdLoginModel *)ThirdLoginModel
{

    NSString *sqlStr = [NSString stringWithFormat:@"INSERT INTO ThirdLoginModel(thirdusername, usid, tocken, iconUrl, figureurl_qq_2, phonenum, unionId, thirdPlatformUserProfile,thirdplatformResponse,message) VALUES ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')", ThirdLoginModel.thirdusername, ThirdLoginModel.usid, ThirdLoginModel.tocken,ThirdLoginModel.iconUrl, ThirdLoginModel.figureurl_qq_2,ThirdLoginModel.phonenum, ThirdLoginModel.unionId, ThirdLoginModel.thirdPlatformUserProfile,ThirdLoginModel.thirdplatformResponse, ThirdLoginModel.message ];
    
    int ret = sqlite3_exec(DB1, sqlStr.UTF8String, NULL, NULL, NULL);
    
    if (SQLITE_OK == ret) {
        NSLog(@"插入数据成功");
    } else {
        NSLog(@"插入数据失败");
    }


}
- (void)deleteDataWithThirdloginModel:(NSString *)ThirdLoginuserid
{
    NSString *sqlstr = [NSString stringWithFormat: @"DELETE FROM ThirdLoginModel WHERE usid = '%@'", ThirdLoginuserid];
    int ret = sqlite3_exec(DB1, sqlstr.UTF8String, NULL, NULL, NULL);
    
    if (SQLITE_OK == ret) {
        NSLog(@"删除数据成功");
    } else {
        NSLog(@"删除数据失败");
    }
    
}
- (void)upDataWithThirdloginModelwithsuerid:(NSString *)userid ThirdloginModel:(ThirdLoginModel *)thirdloginmodel phonenum:(NSString *)phonenum
{
    NSString *sqlstr = [NSString stringWithFormat: @"UPDATE ThirdLoginModel SET  thirdloginmodel.phonenum= '%@' WHERE usid = '%@'",phonenum, userid];
    int ret = sqlite3_exec(DB1, sqlstr.UTF8String, NULL, NULL, NULL);
    
    if (SQLITE_OK == ret) {
        NSLog(@"修改数据成功");
    } else {
        NSLog(@"修改数据失败");
    }

}
- (NSMutableArray *)selectAllThirdLoginUser
{
    
    NSString *sqlstr = @"SELECT * FROM ThirdLoginModel";
    sqlite3_stmt *stmt = nil;
    int ret = sqlite3_prepare_v2(DB1, sqlstr.UTF8String, -1, &stmt, NULL);
    if (SQLITE_OK == ret) {
        
        
        NSMutableArray *arr = [NSMutableArray array];
        //判断是否还有有效数据
        while (SQLITE_ROW == sqlite3_step(stmt)) {
            
            //参数:列数
            const unsigned char *thirdusername =  sqlite3_column_text(stmt, 1);
            const unsigned char *usid =  sqlite3_column_text(stmt, 2);
            const unsigned char *tocken =  sqlite3_column_text(stmt, 3);
            const unsigned char *iconUrl =  sqlite3_column_text(stmt, 4);
            const unsigned char *figureurl_qq_2 =  sqlite3_column_text(stmt, 5);
            const unsigned char *phonenum =  sqlite3_column_text(stmt, 6);
            const unsigned char *unionId =  sqlite3_column_text(stmt, 7);
            const unsigned char *thirdPlatformUserProfile =  sqlite3_column_text(stmt, 8);
            const unsigned char *thirdplatformResponse =  sqlite3_column_text(stmt, 9);
            const unsigned char *message=  sqlite3_column_text(stmt, 10);
          
            ThirdLoginModel *readpersonListModel = [[ThirdLoginModel alloc]init];
            //            stu.name = name;
            readpersonListModel.thirdusername = [NSString stringWithUTF8String:(const char *)thirdusername];
            readpersonListModel.usid = [NSString stringWithUTF8String:(const char *)usid];
            readpersonListModel.tocken = [NSString stringWithUTF8String:(const char *)tocken];
            readpersonListModel.iconUrl = [NSString stringWithUTF8String:(const char *)iconUrl];
            readpersonListModel.figureurl_qq_2 = [NSString stringWithUTF8String:(const char *)figureurl_qq_2];
            readpersonListModel.phonenum = [NSString stringWithUTF8String:(const char *)phonenum];
            readpersonListModel.unionId = [NSString stringWithUTF8String:(const char *)unionId];
            readpersonListModel.thirdPlatformUserProfile = [NSString stringWithUTF8String:(const char *)thirdPlatformUserProfile];
            readpersonListModel.thirdplatformResponse = [NSString stringWithUTF8String:(const char *)thirdplatformResponse];
            readpersonListModel.message = [NSString stringWithUTF8String:(const char *)message];
             [arr addObject:readpersonListModel];
            
            
            
        }
        return arr;
    } else {
        NSLog(@"获取数据失败");
        return nil;
    }

}
- (NSMutableArray *)selectByUseridOfuser:(NSString *)userid
{
  
    
    NSString *sqlstr = [NSString stringWithFormat:  @"SELECT * FROM ThirdLoginModel WHERE  usid LIKE '%%%@%%'", userid];
    sqlite3_stmt *stmt = nil;
    int ret = sqlite3_prepare_v2(DB1, sqlstr.UTF8String, -1, &stmt, NULL);
    if (SQLITE_OK == ret) {
        
        
        NSMutableArray *arr = [NSMutableArray array];
        //判断是否还有有效数据
        while (SQLITE_ROW == sqlite3_step(stmt)) {
            
            //参数:列数
            const unsigned char *thirdusername =  sqlite3_column_text(stmt, 1);
            const unsigned char *usid =  sqlite3_column_text(stmt, 2);
            const unsigned char *tocken =  sqlite3_column_text(stmt, 3);
            const unsigned char *iconUrl =  sqlite3_column_text(stmt, 4);
            const unsigned char *figureurl_qq_2 =  sqlite3_column_text(stmt, 5);
            const unsigned char *phonenum =  sqlite3_column_text(stmt, 6);
            const unsigned char *unionId =  sqlite3_column_text(stmt, 7);
            const unsigned char *thirdPlatformUserProfile =  sqlite3_column_text(stmt, 8);
            const unsigned char *thirdplatformResponse =  sqlite3_column_text(stmt, 9);
            const unsigned char *message=  sqlite3_column_text(stmt, 10);
                      ThirdLoginModel *readpersonListModel = [[ThirdLoginModel alloc]init];
            //            stu.name = name;
            readpersonListModel.thirdusername = [NSString stringWithUTF8String:(const char *)thirdusername];
            readpersonListModel.usid = [NSString stringWithUTF8String:(const char *)usid];
            readpersonListModel.tocken = [NSString stringWithUTF8String:(const char *)tocken];
            readpersonListModel.iconUrl = [NSString stringWithUTF8String:(const char *)iconUrl];
            readpersonListModel.figureurl_qq_2 = [NSString stringWithUTF8String:(const char *)figureurl_qq_2];
            readpersonListModel.phonenum = [NSString stringWithUTF8String:(const char *)phonenum];
            readpersonListModel.unionId = [NSString stringWithUTF8String:(const char *)unionId];
            readpersonListModel.thirdPlatformUserProfile = [NSString stringWithUTF8String:(const char *)thirdPlatformUserProfile];
            readpersonListModel.thirdplatformResponse = [NSString stringWithUTF8String:(const char *)thirdplatformResponse];
            readpersonListModel.message = [NSString stringWithUTF8String:(const char *)message];
                   [arr addObject:readpersonListModel];
            
        }
        return arr;
    } else {
        NSLog(@"获取数据失败");
        return nil;
    }
    


}


@end
