//
//  HLLoginViewController.m
//  HisunLottery
//
//  Created by devzkn on 4/26/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLLoginViewController.h"
#import "UIImage+ResizableImage.h"
#import "HLSettingTableViewController.h"

@interface HLLoginViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation HLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.loginButton setBackgroundImage:[UIImage resizableImageWithName:@"RedButton"] forState:UIControlStateNormal];
    [self.loginButton setBackgroundImage:[UIImage resizableImageWithName:@"RedButtonPressed"] forState:UIControlStateHighlighted];

}


/*
#pragma mark - 设置界面的跳转
*/
- (IBAction)setting:(UIBarButtonItem *)sender {
    HLSettingTableViewController *settingVC = [[HLSettingTableViewController alloc]init];
    [self.navigationController pushViewController:settingVC animated:YES];
    
}





@end
