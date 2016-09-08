//
//  CloudMyImage.m
//  PatientCloud
//
//  Created by yuhao on 16/4/26.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "CloudMyImage.h"
#import "CloudMyImageCell.h"
#import "JKdataBasehandle.h"
#import "ReadpersonListModel.h"
#import "ReadpaperdetailViewController.h"

@interface CloudMyImage ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain)UITableView *tableview;
@property  (nonatomic, retain)NSMutableArray *arr;

@end
@implementation CloudMyImage
- (void)viewDidLoad
{
      [super viewDidLoad];
     self.view.frame = [[UIScreen mainScreen] bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的云胶片";
    [self createview];
    [self getdata];
}
- (void)getdata
{
    [[JKdataBasehandle shareDatabase] openDB];
    self.arr = [[JKdataBasehandle shareDatabase] selectAllUser];
    NSLog(@"%@", self.arr);
}
- (void)createview
{
    self.tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.showsVerticalScrollIndicator  = NO;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableview];
    
}
#pragma mark tableview协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130 /  HEIGHTSIXP  *HEIGHT;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Cellstr = @"cell";
    CloudMyImageCell * cell = [tableView dequeueReusableCellWithIdentifier:Cellstr];
    if (cell == nil ) {
        cell =[[CloudMyImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cellstr];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.labeltitie.text = [[self.arr objectAtIndex:indexPath.row] cname];
    cell.title.text = [[self.arr objectAtIndex:indexPath.row]csex];
    cell.labeltime.text = [[self.arr objectAtIndex:indexPath.row] cage];
    cell.time.text = [[self.arr objectAtIndex:indexPath.row] cbz];
    cell.time.textColor = [UIColor colorWithRed:0.7148 green:0.7113 blue:0.7182 alpha:1.0];
    cell.time.font = [UIFont fontWithName:@"CourierNewPS-ItalicMT" size:15.0/ HEIGHTSIXP * HEIGHT];
    cell.labelperson.text = [[self.arr objectAtIndex:indexPath.row] jcsj];
    cell.labelperson.font = [UIFont systemFontOfSize:15];
  
    return cell;
}

#pragma mrk 编辑删除
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableview setEditing:editing animated:animated];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewCellEditingStyleDelete;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.arr removeObjectAtIndex:indexPath.row];
    [self.tableview reloadData];
    
}
#pragma mark 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReadpaperdetailViewController *read = [[ReadpaperdetailViewController alloc]init];
    read.url = [[self.arr objectAtIndex:indexPath.row] pacs_args];
    [self.navigationController pushViewController:read animated:YES];

}

@end
