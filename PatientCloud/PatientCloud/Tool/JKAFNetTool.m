

//
//  JKAFNetTool.m
//  JKqyApp
//
//  Created by dllo on 15/12/15.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "JKAFNetTool.h"
#import "AFNetworking.h"
@implementation JKAFNetTool

+ (void)getNetWithURL:(NSString *)url
                 body:(id)body
        headFile:(NSDictionary *)headFile
        responseStyle:(JKresponseStyle)responseStyle
              success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
              failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    
    //1, 创建网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  
    //2, 请求头的添加
    if (headFile) {
        for (NSString *key in headFile.allKeys) {
            [manager.requestSerializer setValue:headFile[key] forHTTPHeaderField:key];
            
            
                   }
    }
    //3, 返回数据的类型
    switch (responseStyle) {
        case JKJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case JKXMl:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case JkDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    
    
    
    //4. 响应返回数据类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/x-javascript",@"image/jpeg", nil]];
    //5. 转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //6. 发送请求
    
    
    
    [manager GET:url parameters:body success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSString *path = [NSString stringWithFormat:@"%ld.plist", [url hash]];
        // 存储的沙盒路径
        NSString *path_doc = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        // 归档
        [NSKeyedArchiver archiveRootObject:responseObject toFile:[path_doc stringByAppendingPathComponent:path]];
        

        
        if (responseObject) {
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        // 缓存的文件夹
        NSString *path = [NSString stringWithFormat:@"%ld.plist", [url hash]];
        NSString *path_doc = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        // 反归档
        id result = [NSKeyedUnarchiver unarchiveObjectWithFile:[path_doc stringByAppendingPathComponent:path]];
        
        if (result) {
            success(task, result);
            //            failure(task, error);
            //            NSLog(@"%@", error);
        } else {
            failure(task, error);
        }
    }];
}



+ (void)PostNetWithURL:(NSString *)url
                  body:(id)body
             bodyStyle:(JKrequestStyle)requestStyle
              headFile:(NSDictionary *)headFile
         responseStyle:(JKresponseStyle)responseStyle
               success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
              failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    //1, 创建网络管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    //2 .body的类型
    switch (requestStyle) {
        case JKrequestJSON:
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            break;
        case JKrequestString:
            [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString * _Nonnull(NSURLRequest * _Nonnull request, id  _Nonnull parameters, NSError * _Nullable * _Nullable error) {
                
                return parameters;
            }];
            break;

            
        default:
            break;
    }
    
    
    
    //3, 请求头的添加
    if (headFile) {
        for (NSString *key in headFile.allKeys) {
            [manager.requestSerializer setValue:headFile[key] forHTTPHeaderField:key];
              }
    }
    //4, 返回数据的类型
    switch (responseStyle) {
        case JKJSON:
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            break;
        case JKXMl:
            manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
            break;
        case JkDATA:
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            break;
        default:
            break;
    }
    
    
    
    //5. 响应返回数据类型
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/x-javascript",@"image/jpeg", nil]];
    //6. 转码
    url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    //7. 发送请求
    
//   [manager POST:url parameters:body progress:^(NSProgress * _Nonnull uploadProgress) {
//       
//       
//   } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//       
//       
//   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//       
//       
//   }];
    [manager POST:url parameters:body success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        if (responseObject) {
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        if (error) {
            failure (task,error);
            NSLog(@"%@",error);
        }
    }];
  
 }


// 上传图片
+(void)uploadImageName:(NSString *)name
{
    //1 创建会话管理者
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://120.26.204.222:8881/ycwebservice/text.php"]];
    UIImage *image = [UIImage imageNamed:name]; //图片名
    
    NSData *imageData = UIImageJPEGRepresentation(image,0.5);//压缩比例
    [[manage uploadTaskWithRequest:request fromData:imageData progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"1");
        NSLog(@"%lld",uploadProgress.completedUnitCount);
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",responseObject);
          NSLog(@"2");
    }] resume];
}



+(void)uploadImage
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFHTTPResponseSerializer *responseSer = [AFHTTPResponseSerializer serializer];
    responseSer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    manager.responseSerializer = responseSer;
    NSMutableURLRequest  *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://120.26.204.222:8881/ycwebservice/text.php" ]];
    UIImage *image = [UIImage imageNamed:@"1.jpg"]; //图片名
       NSData *imageData = UIImageJPEGRepresentation(image,0.5);//压缩比例
    [[manager uploadTaskWithRequest:request fromData:imageData progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
         NSString *returnString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"3-测试输出：%@",returnString);

        
    }] resume];
//    NSDictionary *dict = [NSDictionary dictionary];
//    [manager POST:@"http://120.26.204.222:8881/ycwebservice/text.php" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        UIImage *image = [UIImage imageNamed:@"1.jpg"]; //图片名
//        
//        NSData *imageData = UIImageJPEGRepresentation(image,0.5);//压缩比例
//           NSLog(@"字节数:%ld",[imageData length]);
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        
//                formatter.dateFormat = @"yyyyMMddHHmmss";
//        
//                NSString *str = [formatter stringFromDate:[NSDate date]];
//        
//                NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
//
//        [formData appendPartWithFormData:imageData name:@"1.jpg"];
//                [formData appendPartWithFileData:imageData name:@"path" fileName:@"1.png"  mimeType:@"image/jpeg"];
//        [formData appendPartWithFormData:[NSData dataWithData:imageData] name:@"1.jpg"];

        
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        NSLog(@"%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        NSLog(@"请求成功----%@",responseObject);
//        NSString *returnString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        
//        NSLog(@"3-测试输出：%@",returnString);
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//         NSLog(@"请求失败----%@",error);
//    }];

}
/*上传图片*/

//+ (void)HttpSendImage:(NSData *)data block:(void (^)(NSError *, NSString *))block {
//    
//    
//    
//    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
//    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/plain", nil];        // 参数
//    
//    NSDictionary *parameter = @{@"token":@"",@"uid"  :@""};    // 访问路径
//    
//    NSString *stringURL = [NSString stringWithFormat:@"http://120.26.204.222:8881/ycwebservice/image.php"];
//    
//     [manage POST:stringURL parameters:parameter constructingBodyWithBlock:^(id formData) {
//        
//        // 上传文件
//        
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        
//        formatter.dateFormat = @"yyyyMMddHHmmss";
//        
//        NSString *str = [formatter stringFromDate:[NSDate date]];
//        
//        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
//        
//        [formData appendPartWithFileData:data name:@"photos" fileName:fileName mimeType:@"image/png"];
//        
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        NSLog(@"上传成功");
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        NSLog(@"上传失败");
//        
//    }];
//    
//}















@end
