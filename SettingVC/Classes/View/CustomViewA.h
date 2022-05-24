//
//  CustomViewA.h
//  LibA
//
//  Created by zhongxiaoming on 5/19/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomViewAModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL showExpandBottom;
@end


typedef void (^CustomViewAModelChangeCallBack)(CustomViewAModel *modelInfo);

@interface CustomViewA : UIView

@property (nonatomic, strong) CustomViewAModel *model;//设置model给CustomViewA对象

@property (nonatomic, copy) CustomViewAModelChangeCallBack modelInfoChangeCallback; // 支持model变化回调

@end

NS_ASSUME_NONNULL_END
