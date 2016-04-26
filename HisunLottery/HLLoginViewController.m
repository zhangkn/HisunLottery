//
//  HLLoginViewController.m
//  HisunLottery
//
//  Created by devzkn on 4/26/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLLoginViewController.h"
#import "UIImage+ResizableImage.h"

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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
