//
//  RPreportDetailView.h
//  Cloudhospital
//
//  Created by yuhao on 16/4/12.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import "YPBaseView.h"

@protocol RPreportDetailViewdelegate <NSObject>

- (void)changeviewtoDoctorseen;
- (void)changeviewtoDoctorcommmend;
- (void)changetotuxiang;
- (void)changetobingli;
- (void)changtoshoucang;
@end


@interface RPreportDetailView : YPBaseView
@property (nonatomic,assign)id<RPreportDetailViewdelegate>delegate;

@property (nonatomic,retain)UIView *backview;
@property (nonatomic, retain) UILabel *labelname;
@property (nonatomic, retain) UILabel *name;
@property (nonatomic, retain) UILabel *labelsex;
@property (nonatomic, retain) UILabel *sex;
@property (nonatomic, retain) UILabel *labelage;
@property (nonatomic, retain) UILabel *age;
@property (nonatomic, retain) UILabel *labelRoom;
@property (nonatomic, retain) UILabel *Room;
@property (nonatomic, retain) UILabel *Badnumber;
@property (nonatomic, retain) UILabel *number;
@property (nonatomic, retain) UILabel *PersonNumber;
@property (nonatomic, retain) UILabel *Pnumber;
@property (nonatomic, retain) UILabel *CheckWhere;
@property (nonatomic, retain) UILabel *where;
@property (nonatomic, retain) UILabel *ReportDate;
@property (nonatomic, retain) UILabel *date;
@property (nonatomic, retain) UILabel *seen;
@property (nonatomic, retain) UILabel *commond;
@property (nonatomic, retain) UITextView *Doctorsee;
@property (nonatomic, retain) UITextView *DoctorCommond;
@property (nonatomic, retain) UIView *litterbackview;
@property (nonatomic, retain) UIView *litterbackviewtwo;
@property (nonatomic, retain) UIView *blackline;
@property (nonatomic, retain) UIView *blacklinetwo;
@property (nonatomic, retain) UIView *blacklinethree;
@property (nonatomic, retain) UIView *blacklinefour;
@property (nonatomic, retain) UIView *blacklinefive;
@property (nonatomic, retain) UIView *blacklinesix;
@property (nonatomic, retain) UIImageView *imageviewone;
@property (nonatomic, retain) UIImageView *imageviewtwo;
@property (nonatomic, retain) UIImageView *imageviewthree;
@property (nonatomic, retain) UIImageView *imageviewfour;
@property (nonatomic, retain) UIButton *buttonimage;
@property (nonatomic, retain) UIButton *buttonbingli;
@property  (nonatomic, retain) UIButton *buttonliuyan;
+ (CGFloat)heightWithstr:(NSString *)str;
@end
