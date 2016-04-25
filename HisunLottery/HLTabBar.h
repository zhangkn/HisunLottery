//
//  HLTabBar.h
//  HisunLottery
//
//  Created by devzkn on 4/25/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import <UIKit/UIKit.h>

//block 的作用：保存一段代码，到恰当的时候调用,很多时候block是代理的一种优化方案

/*
 0.block的介绍
 Blocks可以作为函数参数或者函数的返回值，而其本身又可以带输入参数或返回值。它和传统的函数指针很类似，但是有区别：blocks是inline的，并且它对局部变量是只读的。
 1、定义
 <#returnType#>(^<#blockName#>)(<#parameterTypes#>) = ^(<#parameters#>) {
 <#statements#>
 
};
 2.声明
 typedef <#returnType#>(^<#name#>)(<#arguments#>);
 
 3、内存管理--block本身是像对象一样可以retain，和release
 1)block在创建的时候，它的内存是分配在栈(stack)上，而不是在堆(heap)上。
 他本身的作于域是属于创建时候的作用域，一旦在创建时候的作用域外面调用block将导致程序崩溃
 2)解决这个问题的方法就是在创建完block的时候需要调用copy的方法。copy会把block从栈上移动到堆上，那么就可以在其他地方使用这个block了
 4、循环引用
 *对于非ARC下, 为了防止循环引用, 我们使用__block来修饰在Block中使用的对象:
 *对于ARC下, 为了防止循环引用, 我们使用__weak来修饰在Block中使用的对象。原理就是:ARC中，Block中如果引用了__strong修饰符的自动变量，则相当于Block对该变量的引用计数+1。
    eg.:
  __block WebViewController *blockSelf = self; // 声明对象赋值self,使用__block修饰，目的是在block内部使用的时候不会造成控制器引用计数+1
 内存泄露例子：
 当在block内部使用成员变量的时候。那么block是会对内部的对象进行一次retain。也就是说，self会被retain一次。当self释放的时候，需要block释放后才会对self进行释放，但是block的释放又需要等self的dealloc中才会释放。如此一来变形成了循环引用，导致内存泄露。
 5、blocks 访问权限
 1)blocks可以访问局部变量a，但是不能修改。
 原因是在编译期间确定的，编译器编译的时候把a的值复制到block作为一个新变量（假设是a‘ = 10），此时a'和a是没有关系的。
 2)如果要修改就要加关键字：__block或者static
 6、block调用就像调用函数一样 
 //执行block
 if (self.block) {
 self.block(self.selectedBtn.tag);
 }
 7、block的定义
 //定义block，通知导航控制器切换控制器
 [tabBar setBlock:^(int index){
 [self setSelectedIndex:index];//切换控制器
 }];
 //    [tabBar.block copy];
 

 */

typedef void(^HLTabBarBlock)(int selectIndex);

/*
 通知导航控制器的方式二：代理
 */
@class HLTabBar;
@protocol HLTabBarDelegate <NSObject>
@optional
- (void)tabBar:(HLTabBar *)tabBar didSelectIndex:(int)index;
@end

@interface HLTabBar : UIView
@property (nonatomic,copy) HLTabBarBlock block;//--通知TabBar切换控制器
@property (nonatomic,weak) id<HLTabBarDelegate> delegate;

@property (nonatomic,weak) UIButton *selectedBtn;//记录选中的按钮


//自定义视图的现实的数据来源于模型，即使用模型装配自定义视图的显示内容
@property (nonatomic,strong) NSArray *models;//视图对应的模型，是视图提供给外界的接口
/**
 通过数据模型设置视图内容，可以让视图控制器不需要了解视图的细节
 view ,用于设置frame
 
 */
+ (instancetype) tabBarWithModel:(NSArray *) models view:(UIView *)view;



@end
