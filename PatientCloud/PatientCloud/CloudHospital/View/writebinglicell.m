//
//  writebinglicell.m
//  PatientCloud
//
//  Created by yuhao on 16/8/12.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "writebinglicell.h"

@implementation writebinglicell




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createview];
    }
    return self;
}
- (void)createview
{
    self.backgroundColor = [UIColor colorWithRed:0.956 green:0.9468 blue:0.9653 alpha:1.0];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10/ WIDTHSIXP * WIDGHT, 10/ HEIGHTSIXP * HEIGHT, 355/ WIDTHSIXP * WIDGHT, 100/ HEIGHTSIXP* HEIGHT )];
    view.backgroundColor = [UIColor colorWithRed:0.9786 green:0.9738 blue:0.9833 alpha:1.0];
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
    [self addSubview:view];
    
    
    UIView *viewline = [[UIView alloc]initWithFrame:CGRectMake(2 / WIDTHSIXP * WIDGHT   , 2 / HEIGHTSIXP * HEIGHT, 2 / WIDTHSIXP * WIDGHT, 96 / HEIGHTSIXP * HEIGHT)];
    viewline.backgroundColor = [UIColor colorWithRed:0.2808 green:0.669 blue:1.0 alpha:1.0];
    [view addSubview:viewline];
    
    
    
    self.label2 = [[UILabel alloc]init];
    //    self.label1.backgroundColor = [UIColor redColor];
    self.label2.frame = CGRectMake(30/ WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT, 0/ WIDTHSIXP * WIDGHT, 60/HEIGHTSIXP *HEIGHT);
    self.label2.numberOfLines = 0;
    self.label2.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:15/HEIGHTSIXP *HEIGHT];
    //    self.label2.textAlignment = NSTextAlignmentCenter;
    [view addSubview:self.label2];
    
        
    
    self.label5= [[UILabel alloc]init];
    //    self.label1.backgroundColor = [UIColor redColor];
    self.label5.frame = CGRectMake(90/ WIDTHSIXP * WIDGHT, 5/HEIGHTSIXP *HEIGHT, 220/ WIDTHSIXP * WIDGHT,30 /HEIGHTSIXP *HEIGHT);
    self.label5.textColor =  [UIColor colorWithRed:0.3825 green:0.8856 blue:0.7074 alpha:1.0];
    self.label5.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:15/HEIGHTSIXP *HEIGHT];
    
    
    //    self.label5.textAlignment = NSTextAlignmentCenter;
    [view addSubview:self.label5];
    
    self.label6= [[UILabel alloc]init];
    //    self.label1.backgroundColor = [UIColor redColor];
    self.label6.frame = CGRectMake(90/ WIDTHSIXP * WIDGHT, 65/HEIGHTSIXP *HEIGHT, 200/ WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT);
    //  self.label6.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:8/HEIGHTSIXP *HEIGHT];
//    self.label6.font = [UIFont systemFontOfSize:12];
    self.label6.numberOfLines = 0;
    //    self.label6.textAlignment = NSTextAlignmentCenter;
    [view addSubview:self.label6];

    self.applytime = [[UILabel alloc]initWithFrame:CGRectMake(20/ WIDTHSIXP * WIDGHT, 65/HEIGHTSIXP *HEIGHT, 60/ WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
    self.applytime.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:15/HEIGHTSIXP *HEIGHT];
    self.applytime.text = @"申请时间";
    [view addSubview:self.applytime];
    
    self.applylabel = [[UILabel alloc]initWithFrame:CGRectMake(20/ WIDTHSIXP * WIDGHT, 5/HEIGHTSIXP *HEIGHT, 80/ WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
    self.applylabel.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:15/HEIGHTSIXP *HEIGHT];
    self.applylabel.text = @" 申请人";
    self.applylabel.textAlignment = NSTextAlignmentLeft;
    [view addSubview:self.applylabel];
    
    self.reportstatue = [[UILabel alloc]initWithFrame:CGRectMake(20/ WIDTHSIXP * WIDGHT, 35/HEIGHTSIXP *HEIGHT, 80/ WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
    self.reportstatue.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:15/HEIGHTSIXP *HEIGHT];
    self.reportstatue.text = @"申请状态";
    [view addSubview:self.reportstatue];
    
    self.stutue = [[UILabel alloc]initWithFrame:CGRectMake(90/ WIDTHSIXP * WIDGHT, 35/HEIGHTSIXP *HEIGHT, 80/ WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT)];
    self.stutue.textColor = [UIColor redColor];
    self.stutue.font = [UIFont fontWithName:@"HiraKakuProN-W3" size:15/HEIGHTSIXP *HEIGHT];
    [view addSubview:self.stutue];
    
    
}










- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
