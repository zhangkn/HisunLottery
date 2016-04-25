//
//  HLTabBarViewController.m
//  HisunLottery
//
//  Created by devzkn on 4/25/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLTabBarViewController.h"
#import "HLTabBar.h"

@interface HLTabBarViewController ()

@end

@implementation HLTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //移除系统tabbar
    [self.tabBar removeFromSuperview];
    HLTabBar *tabBar = [[HLTabBar alloc]initWithFrame:self.tabBar.frame];
    //定义block，通知导航控制器切换控制器
    [tabBar setBlock:^(int index){
        [self setSelectedIndex:index];//切换控制器        
    }];
//    [tabBar.block copy];
    [self.view addSubview:tabBar];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
