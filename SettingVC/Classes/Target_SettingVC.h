//
//  Target_SettingVC.h
//  CTMediator
//
//  Created by zhongxiaoming on 5/24/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface  Target_SettingVC: NSObject

- (UIViewController *)Action_FetchSettingViewController:(NSDictionary *)params;
- (id)Action_nativePresentImage:(NSDictionary *)params;
- (id)Action_showAlert:(NSDictionary *)params;

// 容错
- (id)Action_nativeNoImage:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
