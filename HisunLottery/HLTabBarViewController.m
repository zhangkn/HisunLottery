//
//  HLTabBarViewController.m
//  HisunLottery
//
//  Created by devzkn on 4/25/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLTabBarViewController.h"
#import "HLTabBar.h"
#import "HLTabBarModel.h"

@interface HLTabBarViewController ()<HLTabBarDelegate>

@property (nonatomic,strong) NSArray *models;

@end

@implementation HLTabBarViewController



- (NSArray *)models{
    if (nil == _models) {
        NSMutableArray *tmp = [NSMutableArray array];
        NSString *imageName;
        NSString *selectedImageName;
        for (int i = 0; i<self.viewControllers.count; i++) {
            imageName = [NSString stringWithFormat:@"TabBar%d",i+1];
            selectedImageName = [NSString stringWithFormat:@"TabBar%dSel",i+1];
            //构造模型数组
            NSDictionary *dict =@{@"imageName":imageName,@"selectedImageName":selectedImageName};
            HLTabBarModel *model = [HLTabBarModel tabBarModelWithDictionary:dict];
            [tmp addObject:model];
        }
        _models =tmp;
    }
    return _models;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建自定义tabBar
    [self setttingTabBar];
//    self.edgesForExtendedLayout//@property(nonatomic,assign) UIRectEdge edgesForExtendedLayout NS_AVAILABLE_IOS(7_0); // Defaults to UIRectEdgeAll
    /*
     typedef NS_OPTIONS(NSUInteger, UIRectEdge) {
     UIRectEdgeNone   = 0,
     UIRectEdgeTop    = 1 << 0,
     UIRectEdgeLeft   = 1 << 1,
     UIRectEdgeBottom = 1 << 2,
     UIRectEdgeRight  = 1 << 3,
     UIRectEdgeAll    = UIRectEdgeTop | UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight
     } NS_ENUM_AVAILABLE_IOS(7_0);// | 并运算
     */


}
#pragma mark - 自定义TabBar
- (void) setttingTabBar{
    //移除系统tabbar
    //    [self.tabBar removeFromSuperview];//导致一些针对系统的self.tabBar操作失效     [self setHidesBottomBarWhenPushed:YES];
    //利用模型创建tabBarButton
    HLTabBar *tabBar = [HLTabBar tabBarWithModel:self.models view:self.tabBar];
    //1、 切换控制器方式一：
    //    //定义block，通知导航控制器切换控制器
    //    [tabBar setBlock:^(int index){
    //        [self setSelectedIndex:index];//切换控制器
    //    }];
    ////    [tabBar.block copy];
    //2.切换控制器方式二：
    [tabBar setDelegate:self];
}



#pragma mark - HLTabBarDelegate
- (void) tabBar:(HLTabBar *)tabBar didSelectIndex:(int)index{
    [self setSelectedIndex:index];
}


@end
