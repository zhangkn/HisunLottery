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
    //设置导航条主题
    [self setttingAppearance];
    

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

- (void) setttingAppearance{
    /*
     @protocol UIAppearance <NSObject>  协议的代理方法+ (instancetype)appearance;

     @interface UIView : UIResponder < UIAppearance>
     */
    UINavigationBar *navigationBar =[UINavigationBar appearance];//获取所有导航条外观
    /**
     导航栏背景的出图规格
     iOS6导航栏背景的出图规格
     非retina：320x44 px
     retina：640x88 px
     iOS7导航栏背景的出图规格
     retina：640x128 px
     */
    if (IOS7) {//2016-04-25 15:38:43.112 HisunLottery[4141:217528] 9.2
        
        [navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];

    }else{
        [navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];

    }
}

#pragma mark - HLTabBarDelegate
- (void) tabBar:(HLTabBar *)tabBar didSelectIndex:(int)index{
    [self setSelectedIndex:index];
}


@end
