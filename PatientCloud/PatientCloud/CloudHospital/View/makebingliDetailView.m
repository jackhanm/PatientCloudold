//
//  makebingliDetailView.m
//  PatientCloud
//
//  Created by yuhao on 16/4/27.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "makebingliDetailView.h"

@interface makebingliDetailView ()<UITextFieldDelegate>

@end

@implementation makebingliDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createview];
    }
    return self;
}
- (void)createview
{
    self.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP *WIDGHT, 70/HEIGHTSIXP *HEIGHT, 375/WIDTHSIXP *WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    view.backgroundColor = [UIColor whiteColor];
    [self addSubview:view];
    
    UILabel *labelname = [[UILabel alloc]initWithFrame:CGRectMake(10/WIDTHSIXP *WIDGHT, 5/HEIGHTSIXP *HEIGHT, 100/WIDTHSIXP *WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
    labelname.text = @"称呼";
    labelname.font = [UIFont systemFontOfSize:17/HEIGHTSIXP *HEIGHT];
    labelname.textAlignment = NSTextAlignmentLeft;
    [view addSubview:labelname];
    

  
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP *WIDGHT, 112/HEIGHTSIXP *HEIGHT, 375/WIDTHSIXP *WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    view1.backgroundColor = [UIColor whiteColor];
    [self addSubview:view1];
    
    UILabel *labelsex = [[UILabel alloc]initWithFrame:CGRectMake(10/WIDTHSIXP *WIDGHT, 5/HEIGHTSIXP *HEIGHT, 100/WIDTHSIXP *WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
    labelsex.text = @"性别";
    labelsex.font = [UIFont systemFontOfSize:17/HEIGHTSIXP *HEIGHT];
    labelsex.textAlignment = NSTextAlignmentLeft;
    [view1 addSubview:labelsex];
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0/WIDTHSIXP *WIDGHT, 154/HEIGHTSIXP *HEIGHT, 375/WIDTHSIXP *WIDGHT, 40/HEIGHTSIXP *HEIGHT)];
    view2.backgroundColor = [UIColor whiteColor];
    [self addSubview:view2];
    
    UILabel *labelData = [[UILabel alloc]initWithFrame:CGRectMake(10/WIDTHSIXP *WIDGHT, 5/HEIGHTSIXP *HEIGHT, 100/WIDTHSIXP *WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
    labelData.text = @"出生日期";
    labelData.font = [UIFont systemFontOfSize:17/HEIGHTSIXP *HEIGHT];
    labelData.textAlignment = NSTextAlignmentLeft;
    [view2 addSubview:labelData];
    

    
 
    
    
}
@end
