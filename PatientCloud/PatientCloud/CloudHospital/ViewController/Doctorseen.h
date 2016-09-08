//
//  Doctorseen.h
//  Cloudhospital
//
//  Created by yuhao on 16/5/10.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "YPBaseViewController.h"
@class Doctorseenview;
@interface Doctorseen : YPBaseViewController
@property (nonatomic, copy)NSString *temp;
@property (nonatomic, copy)NSString *temp2;
@property (nonatomic, retain)UILabel *seen;
@property (nonatomic, retain)UILabel *commond;
@property (nonatomic, retain)UITextView *Doctorsee;
@property (nonatomic, retain)UITextView *DoctorCommond;
@property (nonatomic, retain)Doctorseenview *view1;
@property (nonatomic, retain)UILabel *advise;
@property (nonatomic, retain)UITextView *DoctorAdvise;
@end
