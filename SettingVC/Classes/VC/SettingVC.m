//
//  SettingVC.m
//  SettingVC
//
//  Created by zhongxiaoming on 5/24/22.
//

#import "SettingVC.h"
#import "CTMediator.h"
#import "CustomViewA.h"
#import "Masonry.h"

@interface SettingVC ()

@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
}

- (void)methodA {
//    call CommonUtil method
}

- (void)methodA:(NSDictionary *)params {
    NSLog(@"methodA with data:%@", params);
    [self addCustomView];
}

- (void)addCustomView {
    CustomViewA *view = [[CustomViewA alloc] initWithFrame:CGRectMake(100, 10, 300, 100)];
    // 数据回调。另外可以借助RAC的对象监听进行数据同步。
    view.modelInfoChangeCallback = ^(CustomViewAModel * _Nonnull modelInfo) {
        //        self.titleLabel.text = modelInfo.title;
    };
    
    
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.view.mas_centerY);
    }];
    
    CustomViewAModel *model = [CustomViewAModel new];
    model.title = @"我是一个标题";
    view.model = model;
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
