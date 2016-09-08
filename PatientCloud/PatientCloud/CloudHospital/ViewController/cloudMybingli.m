//
//  cloudMybingli.m
//  PatientCloud
//
//  Created by yuhao on 16/4/26.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "cloudMybingli.h"
#import "Readbingli.h"
#import "Writebingli.h"
#import "Makebingli.h"
#import "CloudGetinfoVC.h"
@interface cloudMybingli ()
@property (nonatomic, retain)Readbingli *read;
@property (nonatomic, retain)Writebingli  *write;
@property (nonatomic, retain)UISegmentedControl  *segment;

@end

@implementation cloudMybingli

- (void)viewWillAppear:(BOOL)animated
{
    self.segment.hidden = NO;
}
- (void)viewWillDisappear:(BOOL)animated
{
    self.segment.hidden = YES;
}
- (void)viewDidLoad
{
      [super viewDidLoad];
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(ReadreportRightAct)];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.902 green:0.902 blue:0.902 alpha:1.0];
 
    
    self.read = [[Readbingli alloc]init];
    [self addChildViewController:self.read];
    [self.view addSubview:self.read.view];
    
    self.write = [[Writebingli alloc]init];
    [self addChildViewController:self.write];
    [self.view addSubview:self.write.view];
           
    [self.view bringSubviewToFront:self.read.view];
    
   
    self.segment = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"医院报告", @"新建报告",  nil]];
    self.segment.frame = CGRectMake(90/WIDTHSIXP * WIDGHT, 10/HEIGHTSIXP *HEIGHT, 200/WIDTHSIXP * WIDGHT, 30/HEIGHTSIXP *HEIGHT);
     self.segment.selectedSegmentIndex = 0;
    [ self.segment addTarget:self action:@selector(segmenAct:) forControlEvents:UIControlEventValueChanged];
    [self.navigationController.navigationBar addSubview: self.segment];
    
    
    
    
    
}
#pragma mark 左右button方法
- (void)RightAct
{
    Makebingli *makebingli = [[Makebingli alloc]init];
   UINavigationController *makebinglinc= [[UINavigationController alloc]initWithRootViewController:makebingli];
    [self presentViewController:makebinglinc animated:YES completion:^{
        
        
    }];
}
- (void)ReadreportRightAct
{
    CloudGetinfoVC *getinfo = [[CloudGetinfoVC alloc]init];
    UINavigationController *getinfonc = [[UINavigationController alloc]initWithRootViewController:getinfo];
    [self presentViewController:getinfonc animated:YES completion:^{
        
        
    }];
    
}
- (void)segmenAct:(UISegmentedControl *)sender
{
    if (0  == sender.selectedSegmentIndex) {
        NSLog(@"0");
        self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(ReadreportRightAct)];
        [self.view  bringSubviewToFront:self.read.view];
        
    }
    if (1 == sender.selectedSegmentIndex) {
        
      
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(RightAct)];
        [self.view bringSubviewToFront:self.write.view];
        
    }
    [self.view bringSubviewToFront:sender];
}
@end
