//
//  SickerAppliersAdvise.m
//  Cloudhospital
//
//  Created by yuhao on 16/7/4.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "SickerAppliersAdvise.h"
#import "AppliersAdvise.h"
@interface SickerAppliersAdvise ()<UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic, retain)UITableView *adviselist;
@property (nonatomic, retain)UITextField *testfiled;
@end

@implementation SickerAppliersAdvise

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createview];
    // Do any additional setup after loading the view.
}
- (void)createview
{
    self.adviselist = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.adviselist.delegate = self;
    self.adviselist.dataSource = self;
    [self.view addSubview:self.adviselist];
    
    
    self.testfiled = [[UITextField alloc]initWithFrame:CGRectMake(280/ WIDTHSIXP * WIDGHT, 500/ HEIGHTSIXP * HEIGHT, 60/ WIDTHSIXP * WIDGHT, 60/ HEIGHTSIXP * HEIGHT)];
    self.testfiled.backgroundColor = [UIColor whiteColor];
    self.testfiled.delegate = self;
    [self.view addSubview:self.testfiled];
    
    UIButton *writebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    writebutton.backgroundColor  = [UIColor purpleColor];
    [writebutton addTarget:self action:@selector(buttonAct) forControlEvents:UIControlEventTouchUpInside];
    writebutton.frame  = CGRectMake(280/ WIDTHSIXP * WIDGHT, 500 / HEIGHTSIXP * HEIGHT, 60/ WIDTHSIXP * WIDGHT, 60/ HEIGHTSIXP * HEIGHT);
    writebutton.layer.cornerRadius = 30;
    writebutton.layer.masksToBounds = YES;
    [self.view addSubview:writebutton];
    
    
    
}
- (void)buttonAct
{
    [self.testfiled becomeFirstResponder];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellstr = @"cell";
    AppliersAdvise *cell = [tableView dequeueReusableCellWithIdentifier:cellstr];
    if (nil == cell) {
        cell = [[AppliersAdvise alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellstr];
        
    }
    if (0 == indexPath.row) {
        cell.title.text = @" 所见";
    }
    if (1 == indexPath.row) {
        cell.title.text = @" 结论";
    }
    if (2 == indexPath.row) {
        cell.title.text = @" 刘医生意见";
    }
    if (3 == indexPath.row) {
        cell.title.text = @" 朱医生意见";
    }
    if (4 == indexPath.row) {
        cell.title.text = @" 马医生意见";
    }
    cell.detail.text = @"每个人的生命就像是一个沙漏，里面装的沙子的总量是相当的。但不同的是，有些人的沙漏颈部较细，有些人的沙漏颈部较粗。那些颈部较细的沙漏能抓住每一粒时间之沙，虽然沙子的总量一样，但相对却拥有更长的生命——摘自《暗时间》";
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  200;
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
