//
//  Target_SettingVC.m
//  CTMediator
//
//  Created by zhongxiaoming on 5/24/22.
//

#import "Target_SettingVC.h"
#import "SettingVC.h"

@implementation Target_SettingVC

- (UIViewController *)Action_FetchSettingViewController:(NSDictionary *)params {
    SettingVC *vc = [SettingVC new];
    return vc;
}

@end
