//
//  CustomViewA.m
//  LibA
//
//  Created by zhongxiaoming on 5/19/22.
//

#import "CustomViewA.h"
#import "Masonry.h"

@implementation CustomViewAModel
@end


@interface CustomViewA ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *topView;
@end

@implementation CustomViewA

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.orangeColor;
        [self initSubViews];
    }
    return self;
}


- (void)initSubViews {
    self.layer.cornerRadius = 20; // comment
    self.layer.masksToBounds = YES; // 1.0.3
    UIView *topView = UIView.new;
    topView.backgroundColor = UIColor.redColor;
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(30);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-100);
    }];
    self.topView = topView;
    UILabel *titleLabel = UILabel.new;
    titleLabel.textColor = UIColor.whiteColor;
    [topView addSubview:titleLabel];
    titleLabel.backgroundColor = UIColor.purpleColor;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
    }];
    self.titleLabel = titleLabel;
    
    #pragma mark test button
    UIButton *btn = UIButton.new;
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topView.mas_bottom);
        make.centerX.mas_equalTo(0);
    }];
    [btn setTitle:@"click me" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)setTitle:(NSString *)title {
    self.model.title = title;
    self.titleLabel.text = self.model.title;
    if (self.modelInfoChangeCallback) {
        self.modelInfoChangeCallback(self.model);
    }
}

- (void)btnClick {
    [self setTitle:[NSString stringWithFormat:@"string:%@", @(arc4random()%100)]];
    
    [self changeSelfContentHeight];
}

- (void)setModel:(CustomViewAModel *)model {
    _model = model;
    self.titleLabel.text = self.model.title;
}

- (void)changeSelfContentHeight {
    static BOOL expandBottom = NO;
    static int height = 100;
    if (!expandBottom) {
        // 展开
        [UIView animateWithDuration:0.25 animations:^{
            [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self.mas_bottom).offset(-(100+height));
            }];
            self.layer.cornerRadius = 20;
            [self.superview layoutIfNeeded];
        }];
    } else {
        [UIView animateWithDuration:0.25 animations:^{
            [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self.mas_bottom).offset(-100);
            }];
            self.layer.cornerRadius = 0;
            [self.superview layoutIfNeeded];
        }];
    }
    expandBottom = !expandBottom;
    self.model.showExpandBottom = expandBottom;
    if (self.modelInfoChangeCallback) {
        self.modelInfoChangeCallback(self.model);
    }
}




@end
