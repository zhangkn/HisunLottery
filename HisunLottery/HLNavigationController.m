//
//  HLNavigationController.m
//  HisunLottery
//
//  Created by devzkn on 4/25/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLNavigationController.h"

@interface HLNavigationController ()

@end

@implementation HLNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 重写pushViewController: animated:
/**
 1）自定义导航控制器的价值
 重写push方法就可以拦截所有压入栈中的子控制器，统一做一些处理
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    [viewController setHidesBottomBarWhenPushed:YES];
    [super pushViewController:viewController animated:animated];
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
