//
//  ViewController.m
//  HisunLottery
//
//  Created by devzkn on 4/24/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#if 0
/** 此方法生效的前提是statusBar交给VC管理 
 <key>UIViewControllerBasedStatusBarAppearance</key>
	<false/>
 
 此时可以通过AppDelegate 管理状态栏
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
#endif

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
