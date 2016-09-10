//
//  AppDelegate.h
//  PatientCloud
//
//  Created by yuhao on 16/4/20.
//  Copyright © 2016年 infinitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "LeftSlideViewController.h"
static NSString *appKey = @"b3bd95622e7c4d6f278a05ea";
static NSString *channel = @"Publish channel";
static BOOL isProduction = FALSE;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain)LeftSlideViewController *leftSlideVC;
@property (nonatomic, retain)UINavigationController *cloudhospitalnc;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

