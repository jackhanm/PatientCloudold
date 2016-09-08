//
//  SickerAppliersadviseViewController.h
//  Cloudhospital
//
//  Created by yuhao on 16/7/5.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "YPBaseViewController.h"

@interface SickerAppliersadviseViewController : YPBaseViewController
@property (nonatomic, copy)NSString *temp;
@property (nonatomic, copy)NSString *temp2;
@property (nonatomic,copy)NSString  *diag;
@property (nonatomic, retain)UILabel *seen;
@property (nonatomic, retain)UILabel *commond;
@property (nonatomic, retain)UITextView *Doctorsee;
@property (nonatomic, retain)UITextView *DoctorCommond;
@property (nonatomic, retain)UILabel *advise;
@property (nonatomic, retain)UITextView *DoctorAdvise;
@property (nonatomic, copy)NSString *patientID;
@end
