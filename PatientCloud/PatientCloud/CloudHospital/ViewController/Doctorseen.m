//
//  Doctorseen.m
//  Cloudhospital
//
//  Created by yuhao on 16/5/10.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "Doctorseen.h"
@interface Doctorseen ()<UITextViewDelegate>

@end

@implementation Doctorseen
//-(void)setTemp:(NSString *)temp
//{
//    if (_temp != temp) {
//        _temp = temp;
//    }
//}
//- (void)setTemp2:(NSString *)temp2
//{
//    if (_temp2 != temp2) {
//        _temp2 = temp2;
//    }
//}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   [self createview];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"上传" style:UIBarButtonItemStylePlain target:self action:@selector(RIghtAct)];
    
    
    // Do any additional setup after loading the view.
}
- (void)RIghtAct
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"UKey://.Cloudhospital"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"UKey://.Cloudhospital"]];
    }
    
}
- (void)createview
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.seen = [[UILabel alloc]initWithFrame:CGRectMake(10/ WIDTHSIXP * WIDGHT, 70/HEIGHTSIXP *HEIGHT, 45/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.seen.text = @" 所见:";
    //    self.seen.backgroundColor = [UIColor orangeColor];
    self.seen.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.view addSubview:self.seen];
    
    self.Doctorsee = [[UITextView alloc]initWithFrame:CGRectMake(30/ WIDTHSIXP * WIDGHT, 110/HEIGHTSIXP *HEIGHT, 320/ WIDTHSIXP * WIDGHT, 200/HEIGHTSIXP *HEIGHT)];
    self.Doctorsee.editable = YES;
    self.Doctorsee.text = [NSString stringWithFormat:@"%@",self.temp];;
    //    self.Doctorsee.backgroundColor = [UIColor orangeColor];
    self.Doctorsee.delegate = self;
    self.Doctorsee.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    self.Doctorsee.layer.borderColor = [[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0] CGColor];
    self.Doctorsee.layer.borderWidth =1/ WIDTHSIXP * WIDGHT;
    //     self.Doctorsee.layer.cornerRadius =5.0;
    [self.view addSubview:self.Doctorsee];
    
    self.commond = [[UILabel alloc]initWithFrame:CGRectMake(10/ WIDTHSIXP * WIDGHT, 330/HEIGHTSIXP *HEIGHT, 45/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.commond.text = @"结论:";
    //    self.commond.backgroundColor = [UIColor orangeColor];
    self.commond.font = [UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.view addSubview:self.commond];
    
    
    self.DoctorCommond = [[UITextView alloc]initWithFrame:CGRectMake(30/ WIDTHSIXP * WIDGHT, 380/HEIGHTSIXP *HEIGHT, 320/ WIDTHSIXP * WIDGHT,200/HEIGHTSIXP *HEIGHT )];
    
    self.DoctorCommond.text =[NSString stringWithFormat:@"%@",self.temp2];
    //    self.DoctorCommond.backgroundColor = [UIColor orangeColor];
    self.DoctorCommond.delegate = self;
    self.DoctorCommond.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    self.DoctorCommond.layer.borderColor = [[UIColor colorWithRed:0.702 green:0.702 blue:0.702 alpha:1.0] CGColor];
    self.DoctorCommond.layer.borderWidth =1/ WIDTHSIXP * WIDGHT;
    //     self.Doctorsee.layer.cornerRadius =5.0;
    [self.view addSubview:self.DoctorCommond];
//       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
//    self.advise = [[UILabel alloc]initWithFrame:CGRectMake(10/ WIDTHSIXP * WIDGHT, 370/HEIGHTSIXP *HEIGHT, 45/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
//    self.advise.text = @"我的意见";
//    self.advise.font = [UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
//    [self.view addSubview:self.advise];
//    
//    self.DoctorAdvise = [[UITextView alloc]initWithFrame:CGRectMake(30/ WIDTHSIXP * WIDGHT, 420/HEIGHTSIXP *HEIGHT, 320/ WIDTHSIXP * WIDGHT,80/HEIGHTSIXP *HEIGHT )];
//    self.DoctorAdvise.delegate = self;
//    self.DoctorAdvise.font = [UIFont systemFontOfSize:15 /HEIGHTSIXP *HEIGHT];
//    self.DoctorAdvise.layer.borderColor = [[UIColor colorWithRed:0.702 green:0.702 blue:0.702 alpha:1.0] CGColor];
//    self.DoctorAdvise.layer.borderWidth = 1/WIDTHSIXP *WIDGHT;
//    [self.view addSubview:self.DoctorAdvise];
}
#pragma mark - 监听
- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    
    // 取出键盘最终的frame
    
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 取出键盘弹出需要花费的时间
    
    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 修改transform
    
    [UIView animateWithDuration:duration animations:^{
        self.DoctorCommond.frame=CGRectMake(10/ WIDTHSIXP * WIDGHT, 70/HEIGHTSIXP *HEIGHT , 320/ WIDTHSIXP * WIDGHT,  ([UIScreen mainScreen].bounds.size.height - rect.size.height )/HEIGHTSIXP *HEIGHT);
        
        
    }];
    
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (textView == self.DoctorCommond) {
        [UIView animateWithDuration:0.1 animations:^{
             self.DoctorCommond.frame=CGRectMake(10/ WIDTHSIXP * WIDGHT, 70 , 345/ WIDTHSIXP * WIDGHT,  ([UIScreen mainScreen].bounds.size.height - 320)/HEIGHTSIXP *HEIGHT );
            
            
        }];
    }
    

}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView == self.Doctorsee) {
        [textView flashScrollIndicators];   // 闪动滚动条
        
        static CGFloat maxHeight = 200.0f;
        CGRect frame = textView.frame;
        CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
        CGSize size = [textView sizeThatFits:constraintSize];
        if (size.height >= maxHeight)
        {
            size.height = maxHeight;
            textView.scrollEnabled = YES;   // 允许滚动
        }
        else
        {
            textView.scrollEnabled = NO;    // 不允许滚动，当textview的大小足以容纳它的text的时候，需要设置scrollEnabed为NO，否则会出现光标乱滚动的情况
        }

    }
    if (textView == self.DoctorCommond) {
        [textView flashScrollIndicators];   // 闪动滚动条
        
        static CGFloat maxHeight = 200.0f;
        CGRect frame = textView.frame;
        CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
        CGSize size = [textView sizeThatFits:constraintSize];
        if (size.height >= maxHeight)
        {
            size.height = maxHeight;
            textView.scrollEnabled = YES;   // 允许滚动
        }
        else
        {
            textView.scrollEnabled = NO;    // 不允许滚动，当textview的大小足以容纳它的text的时候，需要设置scrollEnabed为NO，否则会出现光标乱滚动的情况
        }
        [UIView animateWithDuration:0.1 animations:^{
      self.DoctorCommond.frame =CGRectMake(30/ WIDTHSIXP * WIDGHT, 380/HEIGHTSIXP *HEIGHT, 320/ WIDTHSIXP * WIDGHT,200/HEIGHTSIXP *HEIGHT );
            
            
        }];

        
    }


}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //    [self.text1 resignFirstResponder];
    //    [self.text2 resignFirstResponder];
    //    [self.text3 resignFirstResponder];
    [super touchesBegan:touches withEvent:event];
    
    [self.Doctorsee resignFirstResponder];
   [self.DoctorCommond resignFirstResponder];
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
