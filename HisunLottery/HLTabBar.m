//
//  HLTabBar.m
//  HisunLottery
//
//  Created by devzkn on 4/25/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLTabBar.h"
#import "HLTabBarModel.h"



@interface HLTabBar ()

@end

@implementation HLTabBar


- (instancetype)initWithFrame:(CGRect)frame model:(NSArray *)model{
    self = [super initWithFrame:frame];//继承父类属性
    if (self) {
        //设置自己的属性
        [self setModels:model];
    }
    return self;
}

- (void)addBtn:(NSArray *)models{
    
    for (int i =0; i<models.count; i++) {
        //
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        HLTabBarModel *model = models[i];
        //设置背景图片
        [btn setBackgroundImage:model.image  forState:UIControlStateNormal];
        [btn setBackgroundImage:model.selectedImage forState:UIControlStateSelected];//--需要手动管理的状态：UIControlStateSelected&UIControlStateDisabled
        [btn setTag:i];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        //默认选中第一个
        if (i == 0) {
            [self click:btn];
        }
    }
    
}

- (void) click:(UIButton *)btn{
    [self.selectedBtn setSelected:NO];
    [btn setSelected:YES];
    [self setSelectedBtn:btn];
//    //执行block
//    if (self.block) {
//        self.block(self.selectedBtn.tag);
//    }
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectIndex:)]) {
        //执行代理属性的协议方法
        [self .delegate tabBar:self didSelectIndex:self.selectedBtn.tag];
    }
 
}

#pragma mark - 设置btn的位置信息
- (void)layoutSubviews{
    UIButton *btn ;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.bounds.size.width*0.2;
    CGFloat btnH = self.bounds.size.height;
    for (int i =0; i<self.subviews.count; i++) {
        //设置位置信息
        btn = self.subviews[i];
        btnX = i*btnW;
        [btn setFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    }
}

#pragma  mark - 提供类方法创建View

+ (instancetype)tabBarWithModel:(NSArray *)models view:(UIView *)view{
    HLTabBar * tabBar = [[HLTabBar alloc] initWithFrame:view.frame model:models];
    return tabBar;
}

- (void)setModels:(NSArray *)models{
    _models = models;
    //创建按钮
    [self addBtn:models];

}
    




@end
