//
//  RPreportDetailView.m
//  Cloudhospital
//
//  Created by yuhao on 16/4/12.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "RPreportDetailView.h"

@interface RPreportDetailView ()<UIScrollViewDelegate, UITextViewDelegate>

@end


@implementation RPreportDetailView
//+ (CGFloat)heightWithstr:(NSString *)str
//{
//    
//    CGRect frame = [str boundingRectWithSize:CGSizeMake(310/ WIDTHSIXP * WIDGHT, 1000/HEIGHTSIXP *HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:18.0] forKey:NSFontAttributeName] context:nil];
//    return frame.size.height;
//    
//}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creteview];
    }
    return self;
}
- (void)creteview
{
    self.backgroundColor = [UIColor colorWithWhite:0.800 alpha:1.000];
    
    self.backview = [[UIView alloc]init];
    self.backview.backgroundColor = [UIColor whiteColor];
    self.backview.layer.borderWidth = 1.0;
    self.backview.layer.cornerRadius = 2;
    self.backview.layer.borderColor = [[UIColor colorWithWhite:0.502 alpha:1.000] CGColor];
   [self addSubview:self.backview];
    
    
//   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    self.labelname = [[UILabel alloc]initWithFrame:CGRectMake(30/ WIDTHSIXP * WIDGHT, 10/HEIGHTSIXP *HEIGHT, 40/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.labelname.text = @"姓名";
//    self.labelname.backgroundColor = [UIColor orangeColor];
    self.labelname.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.labelname];
    
    self.name = [[UILabel alloc]initWithFrame:CGRectMake(70/ WIDTHSIXP * WIDGHT, 10/HEIGHTSIXP *HEIGHT, 120/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.name.text = @"沙拉波万吨";
//    self.name.backgroundColor = [UIColor orangeColor];
    self.name.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.name];
    
    self.labelsex = [[UILabel alloc]initWithFrame:CGRectMake(190/ WIDTHSIXP * WIDGHT, 10/HEIGHTSIXP *HEIGHT, 60/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.labelsex.text = @"性别";
//    self.labelsex.backgroundColor = [UIColor orangeColor];
    self.labelsex.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.labelsex];
    
    self.sex = [[UILabel alloc]initWithFrame:CGRectMake(250/ WIDTHSIXP * WIDGHT, 10/HEIGHTSIXP *HEIGHT, 100/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.sex.text = @"女";
//    self.sex.backgroundColor = [UIColor orangeColor];
    self.sex.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.sex];
    
    self.blacklinefour = [[UIView alloc]initWithFrame:CGRectMake(10/ WIDTHSIXP * WIDGHT, 50/HEIGHTSIXP *HEIGHT, 355/ WIDTHSIXP * WIDGHT, 1/HEIGHTSIXP *HEIGHT)];
    self.blacklinefour.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    [self.backview addSubview:self.blacklinefour];
    
    self.labelage = [[UILabel alloc]initWithFrame:CGRectMake(30/ WIDTHSIXP * WIDGHT, 50/HEIGHTSIXP *HEIGHT, 40/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.labelage.text = @"年龄";
//    self.labelage.backgroundColor = [UIColor orangeColor];
    self.labelage.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.labelage];
    
    
    self.age = [[UILabel alloc]initWithFrame:CGRectMake(70/ WIDTHSIXP * WIDGHT, 50/HEIGHTSIXP *HEIGHT, 120/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.age.text = @"102";
//    self.age.backgroundColor = [UIColor orangeColor];
    self.age.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.age];
    
    
    self.labelRoom = [[UILabel alloc]initWithFrame:CGRectMake(190/ WIDTHSIXP * WIDGHT, 50/HEIGHTSIXP *HEIGHT, 40/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.labelRoom.text = @"科室";
//    self.labelRoom.backgroundColor = [UIColor orangeColor];
    self.labelRoom.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.labelRoom];
    
    
    self.Room = [[UILabel alloc]initWithFrame:CGRectMake(230/ WIDTHSIXP * WIDGHT ,50/HEIGHTSIXP *HEIGHT, 160/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.Room.text = @"神经内科";
//    self.Room.backgroundColor = [UIColor orangeColor];
    self.Room.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.Room];
    
    
    self.Badnumber = [[UILabel alloc]initWithFrame:CGRectMake(30/ WIDTHSIXP * WIDGHT, 90/HEIGHTSIXP *HEIGHT, 40/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.Badnumber.text = @"床号";
//    self.Badnumber.backgroundColor = [UIColor orangeColor];
    self.Badnumber.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.Badnumber];
    
    self. number = [[UILabel alloc]initWithFrame:CGRectMake(70/ WIDTHSIXP * WIDGHT, 90/HEIGHTSIXP *HEIGHT, 120/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.number.text = @"102";
//    self.number.backgroundColor = [UIColor orangeColor];
    self.number.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.number];
    
    
    self.PersonNumber = [[UILabel alloc]initWithFrame:CGRectMake(190/ WIDTHSIXP * WIDGHT, 90/HEIGHTSIXP *HEIGHT, 60/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.PersonNumber.text = @"病人号";
//    self.PersonNumber.backgroundColor = [UIColor orangeColor];
    self.PersonNumber.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.PersonNumber];
    
    self.Pnumber = [[UILabel alloc]initWithFrame:CGRectMake(250/ WIDTHSIXP * WIDGHT, 90/HEIGHTSIXP *HEIGHT, 120/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.Pnumber.text = @"01457998";
//    self.Pnumber.backgroundColor = [UIColor orangeColor];
    self.Pnumber.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.Pnumber];
    
    self.CheckWhere = [[UILabel alloc]initWithFrame:CGRectMake(30/ WIDTHSIXP * WIDGHT, 150/HEIGHTSIXP *HEIGHT,80/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.CheckWhere.text = @" 检查项目";
//    self.CheckWhere.backgroundColor = [UIColor orangeColor];
    self.CheckWhere.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.CheckWhere];
    
    self.where = [[UILabel alloc]initWithFrame:CGRectMake(110/ WIDTHSIXP * WIDGHT, 150/HEIGHTSIXP *HEIGHT, 265/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.where.text = @" MR (颅脑 ＋ DW1)";
//    self.where.backgroundColor = [UIColor orangeColor];
    self.where.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.where];
    
    self.ReportDate = [[UILabel alloc]initWithFrame:CGRectMake(30/ WIDTHSIXP * WIDGHT, 190/HEIGHTSIXP *HEIGHT, 80/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.ReportDate.text = @" 报告日期";
//    self.ReportDate.backgroundColor = [UIColor orangeColor];
    self.ReportDate.font = [ UIFont systemFontOfSize:15/HEIGHTSIXP *HEIGHT];
    [self.backview addSubview:self.ReportDate];
    
    
    self.date = [[UILabel alloc]initWithFrame:CGRectMake(110/ WIDTHSIXP * WIDGHT, 190/HEIGHTSIXP *HEIGHT, 265/ WIDTHSIXP * WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    self.date.text = @" 2015 － 12 － 01     10 ： 18 ： 44";
//    self.date.backgroundColor = [UIColor orangeColor];
    self.date.font = [ UIFont systemFontOfSize:15];
    [self.backview addSubview:self.date];
    
    
    
    self.litterbackview = [[UIView alloc]init];
    self.litterbackview.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.litterbackview];
    
    self.blackline = [[UIView alloc]init];
    self.blackline.backgroundColor = [UIColor colorWithWhite:0.702 alpha:1.000];
    [self.litterbackview addSubview:self.blackline];
    
    
    self.blacklinetwo = [[UIView alloc]init];
    self.blacklinetwo.backgroundColor = [UIColor colorWithWhite:0.702 alpha:1.000];
    [self.litterbackview addSubview:self.blacklinetwo];

    
    self.blacklinethree = [[UIView alloc]init];
    self.blacklinethree.backgroundColor = [UIColor colorWithWhite:0.702 alpha:1.000];
    [self.litterbackview addSubview:self.blacklinethree];

    self.litterbackviewtwo = [[UIView alloc]init];
    self.litterbackviewtwo.backgroundColor = [UIColor whiteColor];
    self.litterbackviewtwo.layer.borderColor = [[UIColor colorWithWhite:0.702 alpha:1.000]CGColor] ;
    self.litterbackviewtwo.layer.borderWidth = 0.5;
    [self addSubview:self.litterbackviewtwo];
    
    self.imageviewone = [[UIImageView alloc]init];
    self.imageviewone.image = [UIImage imageNamed:@"xingxing"];
//    self.imageviewone.backgroundColor = [UIColor orangeColor];
    [self.litterbackview addSubview:self.imageviewone];
    
    self.imageviewtwo = [[UIImageView alloc]init];
    self.imageviewtwo.image = [UIImage imageNamed:@"right"];
//    self.imageviewtwo.backgroundColor = [UIColor orangeColor];
    [self.litterbackview addSubview:self.imageviewtwo];
    
    self.imageviewthree = [[UIImageView alloc]init];
    self.imageviewthree.image = [UIImage imageNamed:@"xingxing"];

    [self.litterbackview addSubview:self.imageviewthree];
    
    self.imageviewfour = [[UIImageView alloc]init];
       self.imageviewfour .image = [UIImage imageNamed:@"right"];
    [self.litterbackview addSubview:self.imageviewfour];
    
    
    
//    self.imageviewfive = [[UIImageView alloc]init];
//    self.imageviewfive.backgroundColor = [UIColor orangeColor];
//    [self.litterbackviewtwo addSubview:self.imageviewfive];
//    
//    self.imageviewsix = [[UIImageView alloc]init];
//    self.imageviewsix.backgroundColor = [UIColor orangeColor];
//    [self.litterbackviewtwo addSubview:self.imageviewsix];

    
    self.seen = [[UILabel alloc]init];
    self.seen.text = @"所见:";
    self.seen.userInteractionEnabled = YES;
//    self.seen.backgroundColor = [UIColor orangeColor];
  self.seen.font = [UIFont fontWithName:@"STHeitiTC-Light" size:20/HEIGHTSIXP *HEIGHT];
    [self.litterbackview addSubview:self.seen];
    
    
    UITapGestureRecognizer *tapfirst = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapActfirst)];
    [self.seen addGestureRecognizer:tapfirst];
    

    

    
    self.commond = [[UILabel alloc]init];
    self.commond.text = @"结论:";
    
    self.commond.userInteractionEnabled = YES;
//    self.commond.backgroundColor = [UIColor orangeColor];
    self.commond.font = [UIFont fontWithName:@"STHeitiTC-Light" size:20/HEIGHTSIXP *HEIGHT];
    [self.litterbackview addSubview:self.commond];
    
    UITapGestureRecognizer *tapsencond = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapActsencond)];
    [self.commond addGestureRecognizer:tapsencond];

    
    self.buttonimage = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonimage addTarget:self action:@selector(tuxiang) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonimage setTitle:@"图像" forState:UIControlStateNormal];
    [self.buttonimage setBackgroundColor:[UIColor whiteColor]];
    [self.buttonimage setTitleColor: [UIColor colorWithRed:0.098 green:0.098 blue:0.098 alpha:1.0] forState:UIControlStateNormal];
    [self.buttonimage setTitleShadowColor:[UIColor colorWithRed:0.615 green:1.000 blue:0.971 alpha:1.000] forState:UIControlStateNormal];
    self.buttonimage.backgroundColor = [UIColor colorWithWhite:0.542 alpha:1.000];
    self.buttonimage.backgroundColor = [UIColor clearColor];
    self.buttonimage.layer.borderWidth = 1;
    self.buttonimage.layer.borderColor = [[UIColor colorWithRed:0.0667 green:0.0784 blue:0.1412 alpha:1.0]CGColor];
    self.buttonimage.layer.cornerRadius = 5 / HEIGHTSIXP * HEIGHT;
     [self.litterbackviewtwo addSubview:self.buttonimage];
    
    self.buttonbingli = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonbingli addTarget:self action:@selector(bingli) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonbingli setTitle:@"病历" forState:UIControlStateNormal];
    [self.buttonbingli setBackgroundColor:[UIColor whiteColor]];
    self.buttonbingli.backgroundColor = [UIColor blueColor];
    [self.buttonbingli setTitleColor: [UIColor colorWithRed:0.098 green:0.098 blue:0.098 alpha:1.0] forState:UIControlStateNormal];
    [self.buttonbingli setTitleShadowColor:[UIColor colorWithRed:0.615 green:1.000 blue:0.971 alpha:1.000] forState:UIControlStateNormal];
    self.buttonbingli.backgroundColor = [UIColor colorWithWhite:0.542 alpha:1.000];
    self.buttonbingli.backgroundColor = [UIColor clearColor];
    self.buttonbingli.layer.borderWidth = 1;
    self.buttonbingli.layer.borderColor = [[UIColor colorWithRed:0.0667 green:0.0784 blue:0.1412 alpha:1.0]CGColor];
    self.buttonbingli.layer.cornerRadius = 5 / HEIGHTSIXP * HEIGHT;
    [self.litterbackviewtwo addSubview:self.buttonbingli];
    
    self.buttonliuyan = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buttonliuyan addTarget:self action:@selector(shoucang) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonliuyan setTitle:@"收藏" forState:UIControlStateNormal];
    [self.buttonliuyan setBackgroundColor:[UIColor whiteColor]];
    self.buttonliuyan.backgroundColor = [UIColor blueColor];
    [self.buttonliuyan setTitleColor: [UIColor colorWithRed:0.098 green:0.098 blue:0.098 alpha:1.0] forState:UIControlStateNormal];
    [self.buttonliuyan setTitleShadowColor:[UIColor colorWithRed:0.615 green:1.000 blue:0.971 alpha:1.000] forState:UIControlStateNormal];
    self.buttonliuyan.backgroundColor = [UIColor colorWithWhite:0.542 alpha:1.000];
    self.buttonliuyan.backgroundColor = [UIColor clearColor];
    self.buttonliuyan.layer.borderWidth = 1;
    self.buttonliuyan.layer.borderColor = [[UIColor colorWithRed:0.0667 green:0.0784 blue:0.1412 alpha:1.0]CGColor];
    self.buttonliuyan.layer.cornerRadius = 5 / HEIGHTSIXP * HEIGHT;
    [self.litterbackviewtwo addSubview:self.buttonliuyan];
    


}
- (void)bingli
{
    [self.delegate changetobingli];
}
- (void)tuxiang
{
    [self.delegate changetotuxiang];
}
- (void)shoucang
{
    [self.delegate changtoshoucang];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backview.frame = CGRectMake(5/ WIDTHSIXP * WIDGHT, 70/ HEIGHTSIXP * HEIGHT, 365/ WIDTHSIXP * WIDGHT, 270/ HEIGHTSIXP * HEIGHT);
    self.litterbackview.frame = CGRectMake(0/ WIDTHSIXP * WIDGHT, 364/ HEIGHTSIXP * HEIGHT, 375/ WIDTHSIXP * WIDGHT, 100/ HEIGHTSIXP * HEIGHT);
    self.blackline.frame = CGRectMake(0/ WIDTHSIXP * WIDGHT, 0/ HEIGHTSIXP * HEIGHT, 375/ WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT);
    self.blacklinetwo.frame =CGRectMake(30/ WIDTHSIXP * WIDGHT, 50/ HEIGHTSIXP * HEIGHT, 345/ WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT);
    self.blacklinethree.frame = CGRectMake(0/ WIDTHSIXP * WIDGHT, 99/ HEIGHTSIXP * HEIGHT, 375/ WIDTHSIXP * WIDGHT, 1/ HEIGHTSIXP * HEIGHT);
    self.litterbackviewtwo.frame = CGRectMake(5/ WIDTHSIXP * WIDGHT, 520/ HEIGHTSIXP * HEIGHT, 365/ WIDTHSIXP * WIDGHT, 55/ HEIGHTSIXP * HEIGHT);
    
    self.imageviewone.frame = CGRectMake(10/ WIDTHSIXP * WIDGHT, 15/ HEIGHTSIXP * HEIGHT, 30/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    self.imageviewtwo.frame = CGRectMake(340/ WIDTHSIXP * WIDGHT, 15/ HEIGHTSIXP * HEIGHT, 30/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    self.seen.frame = CGRectMake(50/ WIDTHSIXP * WIDGHT,  15/ HEIGHTSIXP * HEIGHT, 320/ WIDTHSIXP * WIDGHT , 30/ HEIGHTSIXP * HEIGHT);

    
    
    self.imageviewthree.frame = CGRectMake(10/ WIDTHSIXP * WIDGHT, 65/ HEIGHTSIXP * HEIGHT, 30/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    self.imageviewfour.frame = CGRectMake(340/ WIDTHSIXP * WIDGHT, 65/ HEIGHTSIXP * HEIGHT, 30/ WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    self.commond.frame = CGRectMake(50/ WIDTHSIXP * WIDGHT,  65/ HEIGHTSIXP * HEIGHT, 320/ WIDTHSIXP * WIDGHT , 30/ HEIGHTSIXP * HEIGHT);
   
     [self.buttonimage setFrame:CGRectMake(20/ WIDTHSIXP * WIDGHT, 10 / HEIGHTSIXP * HEIGHT, 80 / WIDTHSIXP * WIDGHT, 40 / HEIGHTSIXP * HEIGHT)];
     [self.buttonbingli setFrame:CGRectMake(140/ WIDTHSIXP * WIDGHT, 10 / HEIGHTSIXP * HEIGHT, 80 / WIDTHSIXP * WIDGHT, 40 / HEIGHTSIXP * HEIGHT)];
    [self.buttonliuyan setFrame:CGRectMake(260/ WIDTHSIXP * WIDGHT, 10 / HEIGHTSIXP * HEIGHT, 80 / WIDTHSIXP * WIDGHT, 40 / HEIGHTSIXP * HEIGHT)];

//    self.imageviewfive.frame = CGRectMake(10, 15, 30, 30);
//    self.imageviewsix.frame = CGRectMake(340, 20, 20, 20);
    
}

- (void)tapActfirst
{

    [self.delegate changeviewtoDoctorseen];
}
- (void)tapActsencond
{

    [self.delegate changeviewtoDoctorcommmend];
}
#pragma mark - 监听
//- (void)keyboardWillChangeFrame:(NSNotification *)note
//{
//    
//    // 取出键盘最终的frame
//    
////    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    
//    // 取出键盘弹出需要花费的时间
//    
//    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    // 修改transform
//    
//    [UIView animateWithDuration:duration animations:^{
//        self.Doctorsee.frame=CGRectMake(0/ WIDTHSIXP * WIDGHT, 0/ WIDTHSIXP * WIDGHT, 375/ WIDTHSIXP * WIDGHT, 400/ WIDTHSIXP * WIDGHT);
//        
//        
//    }];
//    
//}
//- (void)textViewDidEndEditing:(UITextView *)textView
//{
//    if (textView == self.Doctorsee) {
//        [textView flashScrollIndicators];   // 闪动滚动条
//        
//        static CGFloat maxHeight = 200.0f;
//        CGRect frame = textView.frame;
//        CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
//        CGSize size = [textView sizeThatFits:constraintSize];
//        if (size.height >= maxHeight)
//        {
//            size.height = maxHeight;
//            textView.scrollEnabled = YES;   // 允许滚动
//        }
//        else
//        {
//            textView.scrollEnabled = NO;    // 不允许滚动，当textview的大小足以容纳它的text的时候，需要设置scrollEnabed为NO，否则会出现光标乱滚动的情况
//        }
//        self.Doctorsee.frame = CGRectMake(50/ WIDTHSIXP * WIDGHT, 290/ WIDTHSIXP * WIDGHT, 270/ WIDTHSIXP * WIDGHT, size.height/ WIDTHSIXP * WIDGHT);
//        self.commond.frame =  CGRectMake(30/ WIDTHSIXP * WIDGHT, self.Doctorsee.frame.size.height + 300/ WIDTHSIXP * WIDGHT, 45/ WIDTHSIXP * WIDGHT, 40/ WIDTHSIXP * WIDGHT);
//        self.DoctorCommond.frame = CGRectMake(50/ WIDTHSIXP * WIDGHT, self.Doctorsee.frame.size.height + 350/ WIDTHSIXP * WIDGHT, 270/ WIDTHSIXP * WIDGHT, 100/ WIDTHSIXP * WIDGHT);
//
//    }
//    if (textView == self.DoctorCommond) {
//        [textView flashScrollIndicators];   // 闪动滚动条
//        
//        static CGFloat maxHeight = 200.0f;
//        CGRect frame = textView.frame;
//        CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
//        CGSize size = [textView sizeThatFits:constraintSize];
//        if (size.height >= maxHeight)
//        {
//            size.height = maxHeight;
//            textView.scrollEnabled = YES;   // 允许滚动
//        }
//        else
//        {
//            textView.scrollEnabled = NO;    // 不允许滚动，当textview的大小足以容纳它的text的时候，需要设置scrollEnabed为NO，否则会出现光标乱滚动的情况
//        }
//        self.DoctorCommond.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height);
//    }
//    
//  }
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
//{
//    //    NSLog(@" scrollViewDidScroll");
////    NSLog(@"ContentOffset  x is  %f,yis %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
//}
//-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
//{
//    if ([text isEqualToString:@"\n"]) {
//        [textView resignFirstResponder];
//        return NO;
//    }
//    return YES;
//}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    //    [self.text1 resignFirstResponder];
//    //    [self.text2 resignFirstResponder];
//    //    [self.text3 resignFirstResponder];
//    [super touchesBegan:touches withEvent:event];
//    
//    [self.Doctorsee resignFirstResponder];
//    [self.DoctorCommond resignFirstResponder];
//}
@end
