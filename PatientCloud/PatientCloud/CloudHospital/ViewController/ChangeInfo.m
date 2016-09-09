//
//  ChangeInfo.m
//  PatientCloud
//
//  Created by yuhao on 16/8/4.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "ChangeInfo.h"
#import "ChangeinfoCell.h"
#import "UserInfoManager.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "ThirdLoginModel.h"
#import "JKdataBasehandle.h"
#import "JkDataShare.h"
@interface ChangeInfo ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate , ChangeinfoCelldelegate>
@property (nonatomic, retain)UITableView *tableview;
@property (nonatomic, retain)UIImageView *imageview;




@end

@implementation ChangeInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"个人信息";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(RightAct)];
    
    [self createview];
    // Do any additional setup after loading the view.
}
- (void)RightAct
{
      NSDictionary *parameters = @{@"userid" : [UserInfoManager manager].user_id, //
                                 @"user_realname" : @"胡毛毛"  ,
                                 @"user_address" : @"hassngz",
                                 @"picture_path": @"http://q.qlogo.cn/qqapp/1105564851/9D29F77CBD9364D782165689B7117A3B/100",
//                                 @"user_identifyid": @""
                                 };
    
    NSString *urlString = @"http://wx.yunjiaopian.net/app/index.php/home/index/PatientModify";
    //
    AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
    managers.responseSerializer = [AFHTTPResponseSerializer serializer];
    [managers.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", @"application/javascript",@"application/x-javascript",@"image/jpeg", nil]];
    //进行POST请求
    [managers POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"请求成功，服务器返回的信息%@",responseObject );
        NSString *result  =[[ NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"请求成功，服务器返回的信息%@",result );
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //        NSLog(@"%@",dic);
        
    } failure:^(NSURLSessionDataTask *task, NSError * error) {
        NSLog(@"请求失败,服务器返回的信息%@",error);
    }];
//
}
- (void)createview
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375/WIDTHSIXP * WIDGHT, 0)];
    [self.view addSubview:view];
    self.tableview =  [[UITableView alloc]initWithFrame:CGRectMake(0, 64/HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, (667 - 64 )/HEIGHTSIXP * HEIGHT) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableview.separatorInset = UIEdgeInsetsMake(0, 40, 0, 0);

    self.tableview.showsVerticalScrollIndicator = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableview.tableHeaderView.frame = CGRectMake(0, 0, 0, 170 / HEIGHTSIXP * HEIGHT);
    UIView *headview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 170/HEIGHTSIXP *HEIGHT)];
    
    self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(130/WIDTHSIXP * WIDGHT , 30 / HEIGHTSIXP * HEIGHT, 100 / WIDTHSIXP * WIDGHT , 100 / HEIGHTSIXP * HEIGHT)];
    self.imageview.userInteractionEnabled  = YES;
    self.imageview.backgroundColor = [UIColor whiteColor];
    self.imageview.layer.cornerRadius = 50/ HEIGHTSIXP * HEIGHT;
    self.imageview.layer.masksToBounds = YES;
    
    
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:[UserInfoManager manager].picture_path] placeholderImage:[UIImage imageNamed:@""]  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image) {
                        [[UserInfoManager manager]saveImgDataWithImg:image];
                    }

    }];
    
    [headview addSubview:self.imageview];
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAct)];
    [self.imageview addGestureRecognizer:tap];
    self.tableview.tableHeaderView = headview;
   
    
    
    [self.view addSubview:self.tableview ];

}
- (void)tapAct
{
    UIActionSheet *alertsheet = [[UIActionSheet alloc]initWithTitle:@"选择一个图像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照" , @"从手机相册获取", nil];
    
    [alertsheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
        switch (buttonIndex) {
        case 0:
            [self cameraBtnClick];
            break;
            
        case 1:
            [self photoClick];
            break;
            
        default:
            break;
    }
}
#pragma mark 头像
- (void)cameraBtnClick
{
    NSLog(@"拍照");
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }

}
- (void)photoClick
{
    NSLog(@"相册");
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:^{
        
    }];

}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
   
    //    //        //先把图片转成NSData
//    UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
//    UIImage * smallImage = [self imageWithImageSimple:image scaledToSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.width)];
//    //        //关闭相册界面
//    [picker dismissViewControllerAnimated:YES completion:^{
//        
//        [self showHudInView:self.view hint:@"正在上传图片"];
//        
//        
//        
//        NSData *imageData = UIImageJPEGRepresentation(smallImage,0.5);//压缩比例
//        
//        NSURL *url = [NSURL URLWithString:@"http://120.26.204.222:8881/ycwebservice/text.php"];
//        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//        /**************************post新增********************/
//        //先设置为Post模式
//        request.HTTPMethod = @"POST";
//        
//        //再添加Body
//        request.HTTPBody = imageData;
//        /**************************post新增********************/
//        NSURLSession *senssion = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] ];
//        
//        
//        NSURLSessionDataTask * PostT =  [senssion dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//            
//            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//            //                NSString *result = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
//            
//            NSLog(@"%@", [dic objectForKey:@"path"]);
//            
//            self.imageview.image = smallImage;
//            
////            [[UserInfoManager manager]saveImgDataWithImg:smallImage];
//            
//            
//            [self hideHud];
//            
//            
//            
//        }];
//        
//        [PostT resume];
//        
//        
//    }];
    
}
//压缩图片方法
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"1");
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellstr = @"cellstr";
    ChangeinfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
    if (cell == nil) {
        cell = [[ChangeinfoCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellstr];
        cell.textfield.tag =  indexPath.row;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    cell.delegate = self;
    if (0 == indexPath.row) {
        cell.textfield.text = [UserInfoManager manager].user_name;
    }
    
    if (1 == indexPath.row) {
        cell.textfield.text = [UserInfoManager manager].userName;
     
        
    }
    if (2 == indexPath.row ) {
        if ([JkDataShare shareDatabase].isTHirdLoginInfo) {
             ThirdLoginModel *model = [[[JKdataBasehandle shareDatabase]selectByUseridOfuser:[UserInfoManager manager].usid] objectAtIndex:0];
            cell.textfield.text = model.phonenum;
            
        } else {
            cell.textfield.text = [UserInfoManager manager].phoneID;
        }
        
    }
    if ( 3== indexPath.row) {
        cell.textfield.text = [UserInfoManager manager].user_identifyid;
        
    }
    if (4 == indexPath.row) {
        cell.textfield.text = [UserInfoManager manager].user_address;
    }
    NSArray *titles = @[@"昵称", @"真实姓名", @"手机号", @"身份证号", @"详细地址"];
    cell.labeltitile.text = titles[indexPath.row];
    return cell;
    
}

#pragma mark 实现协议方法
- (void)textfieldEdit:(NSInteger)tag
{
    if ( 2 == tag) {
        [UIView animateWithDuration:0.5 animations:^{
            self.tableview.frame = CGRectMake(0,  0/HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, (667 - 64 )/HEIGHTSIXP * HEIGHT);
            
            
        }];
    }
    if ( 3 == tag) {
        [UIView animateWithDuration:0.5 animations:^{
            self.tableview.frame = CGRectMake(0,  -70/HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, (667 - 64 )/HEIGHTSIXP * HEIGHT);
            
            
        }];
    }
    if ( 3 == tag) {
        [UIView animateWithDuration:0.5 animations:^{
            self.tableview.frame = CGRectMake(0,  -140/HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, (667 - 64 )/HEIGHTSIXP * HEIGHT);
            
            
        }];
    }


}

- (void)textfieldEditEnd:(NSInteger)tag
{
    [UIView animateWithDuration:0.5 animations:^{
        self.tableview.frame = CGRectMake(0, 64/HEIGHTSIXP * HEIGHT, 375/WIDTHSIXP * WIDGHT, (667 - 64 )/HEIGHTSIXP * HEIGHT);
        
        
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
