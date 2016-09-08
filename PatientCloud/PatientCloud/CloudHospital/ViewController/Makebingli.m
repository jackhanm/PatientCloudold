//
//  Makebingli.m
//  PatientCloud
//
//  Created by yuhao on 16/4/27.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "Makebingli.h"
#import "MakebingliView.h"
#import "makebingliDetail.h"

@interface Makebingli ()<UITextViewDelegate>
@property(nonatomic,strong)UILabel *label;
@property (nonatomic, retain)UITextView *textView ;

@end

@implementation Makebingli
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.toolbar.hidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.toolbar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    self.navigationItem.title = @"新建病历";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(RightAct)];
      self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(Rightleft)];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setToolbarHidden:NO animated:YES];
    [self.navigationController.toolbar setBarTintColor:[UIColor colorWithRed:1.000 green:0.502 blue:0.000 alpha:1.000]];
    [self.navigationController.toolbar setBackgroundColor:[UIColor orangeColor]];
    [self.navigationController.toolbar setBarStyle:UIBarStyleBlack];
     [self.navigationController.toolbar setBackgroundImage:[UIImage imageNamed:@"navigationBar.png"] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
     self.navigationController.toolbar.frame=CGRectMake(0, 0,375/WIDTHSIXP *WIDGHT, 44/HEIGHTSIXP *HEIGHT);
    UIBarButtonItem *btn4=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc]initWithTitle:@"打字" style:UIBarButtonItemStylePlain target:self action:@selector(SaveAct)];
    
     UIBarButtonItem *btn2 = [[UIBarButtonItem alloc]initWithTitle:@"语音" style:UIBarButtonItemStylePlain target:self action:@selector(ReportAct)];
      UIBarButtonItem *btn3 = [[UIBarButtonItem alloc]initWithTitle:@"图片" style:UIBarButtonItemStylePlain target:self action:@selector(ReportAct)];
      NSArray *arr1=[[NSArray alloc]initWithObjects:btn1,btn4,btn2, btn4, btn3, nil];
    self.toolbarItems=arr1;
    [self  createview];

    // Do any additional setup after loading the view.
}
- (void)createview
{
    self.textView = [[UITextView alloc] initWithFrame:self.view.frame];
    self.textView.delegate = self;
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 49/HEIGHTSIXP *HEIGHT, 375/WIDTHSIXP *WIDGHT, 100/HEIGHTSIXP *HEIGHT)];
    _label.text = @"   请详细描述你的病症和身体状况，我们会保护您的隐私";
    _label.font = [UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    _label.textColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.label];
}

#pragma mark rightBarButtonItem
- (void)RightAct
{
    if (9 > self.textView.text.length ) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您至少输入10位字数" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaule = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            
        }];
        [alert addAction:defaule];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:^{
            
            
        }];
    }
    if (self.textView.text.length) {
        makebingliDetail *detail = [[makebingliDetail alloc]init];
        detail.consult_memo = self.textView.text;
        [self.navigationController pushViewController:detail animated:YES];
    }

    
    
}
#pragma mark toolbar
- (void)SaveAct
{
    NSLog(@"1");
}
- (void)Rightleft
{
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];

}
- (void)ReportAct
{
    NSLog(@"1");
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}
#pragma mark textview协议
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@""]) {
        _label.text = @" ";
    }else{
        _label.text = @"";
    }
    return YES;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        if ([textView.text isEqualToString:@""] ||textView.text== nil) {
            _label.text = @"   请详细描述你的病症和身体状况，我们会保护您的隐私";
        }
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
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
    self.navigationController.toolbar.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height - rect.size.height - self.navigationController.toolbar.frame.size.height, 375/ WIDTHSIXP *WIDGHT,44/HEIGHTSIXP *HEIGHT);

        
    }];

}
#pragma mark uitextview协议
- (void)textViewDidEndEditing:(UITextView *)textView
{
    NSLog(@"%@",self.textView.text);
   self.navigationController.toolbar.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height  - self.navigationController.toolbar.frame.size.height, 375/ WIDTHSIXP *WIDGHT, 44/HEIGHTSIXP *HEIGHT);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
