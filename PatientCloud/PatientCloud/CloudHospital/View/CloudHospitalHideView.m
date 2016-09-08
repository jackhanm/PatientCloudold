//
//  CloudHospitalHideView.m
//  PatientCloud
//
//  Created by yuhao on 16/7/8.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "CloudHospitalHideView.h"


@interface CloudHospitalHideView ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic ,retain)UITableView *tableview;
@end

@implementation CloudHospitalHideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self cretaview];
    }
    return self;
}
-(void)cretaview
{
    self.backgroundColor = [UIColor whiteColor];
    self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(30/ WIDTHSIXP * WIDGHT, 0/HEIGHTSIXP *HEIGHT, 200/ WIDTHSIXP * WIDGHT, self.frame.size.height - 0/HEIGHTSIXP *HEIGHT) style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource  = self;
    [self addSubview:self.tableview];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellstr = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellstr];
        
    }
    return cell;

}
@end
