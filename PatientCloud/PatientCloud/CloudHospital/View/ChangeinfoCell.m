//
//  ChangeinfoCell.m
//  PatientCloud
//
//  Created by yuhao on 16/8/16.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "ChangeinfoCell.h"

@interface ChangeinfoCell ()<UITextFieldDelegate>

@end


@implementation ChangeinfoCell


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
    self.labeltitile = [[UILabel alloc]init];
    [self addSubview:self.labeltitile];
    self.textfield = [[UITextField alloc]init];
    self.textfield.placeholder = @"未配置";
    self.textfield.returnKeyType = UIReturnKeyDone;
    self.textfield.delegate  =self;
    self.textfield.textAlignment = NSTextAlignmentRight;
//    self.textfield.backgroundColor = [UIColor greenColor];
    [self addSubview:self.textfield];
    
    
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.delegate textfieldEdit:self.textfield.tag];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
   [self.textfield resignFirstResponder];
    [self.delegate textfieldEditEnd:self.textfield.tag];
    return YES;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.labeltitile.frame = CGRectMake(20 /WIDTHSIXP * WIDGHT, 20 / HEIGHTSIXP * HEIGHT, 130 / WIDTHSIXP * WIDGHT, 30 /HEIGHTSIXP * HEIGHT);
    self.textfield.frame = CGRectMake(180 /WIDTHSIXP * WIDGHT, 20/ HEIGHTSIXP * HEIGHT, 150/WIDTHSIXP * WIDGHT, 30/ HEIGHTSIXP * HEIGHT);
    
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
