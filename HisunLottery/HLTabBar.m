//
//  HLTabBar.m
//  HisunLottery
//
//  Created by devzkn on 4/25/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLTabBar.h"

@interface HLTabBar ()

@end

@implementation HLTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];//继承父类属性
    if (self) {
        //设置自己的属性
        [self addBtn];
        
    }
    return self;
}

- (void)addBtn{
    NSString *imageName;
    NSString *selectedImageName;

    for (int i =0; i<5; i++) {
        //
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置背景图片
        imageName = [NSString stringWithFormat:@"TabBar%d",i+1];
        selectedImageName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];//--需要手动管理的状态：UIControlStateSelected&UIControlStateDisabled
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
    //执行block
    if (self.block) {
        self.block(self.selectedBtn.tag);
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





@end
