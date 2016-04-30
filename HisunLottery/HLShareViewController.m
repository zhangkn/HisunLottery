//
//  HLShareViewController.m
//  HisunLottery
//
//  Created by devzkn on 4/30/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLShareViewController.h"
#import "HLSettingItemGroupModel.h"
#import "HLSettingArrowItemModel.h"
#import <MessageUI/MessageUI.h>

@interface HLShareViewController ()<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@end

@implementation HLShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addGroup0];
    
}

- (void)addGroup0{
    HLSettingItemGroupModel *group = [[HLSettingItemGroupModel alloc]init];
    HLSettingArrowItemModel *sinaItem = [HLSettingArrowItemModel itemModelWithTitle:@"新浪分享" icon:@"WeiboSina" destVCClass:nil];
    HLSettingArrowItemModel *smsItem = [HLSettingArrowItemModel itemModelWithTitle:@"短信分享" icon:@"SmsShare" destVCClass:nil];
    //短信分享
    [smsItem setOptionBlock:^{
        //方式一:不能指定短信内容，不能自动回到原应用
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms://188740548"]];
        //方式二 :MessageUI框架－－modal方法进行控制器间的切换
        MFMessageComposeViewController *vc= [[MFMessageComposeViewController alloc]init];
        // 设置短信内容
        vc.body = @"lydia,中心藏之， 何以忘之";
        // 设置收件人列表
        vc.recipients = @[@"1887405", @"487"];
        // 设置代理
        vc.messageComposeDelegate = self;
        // 显示控制器
        [self presentViewController:vc animated:YES completion:nil];
    
    }];
    HLSettingArrowItemModel *mailItem = [HLSettingArrowItemModel itemModelWithTitle:@"邮件分享" icon:@"MailShare" destVCClass:nil];
    group.items = @[sinaItem,smsItem,mailItem];
    [self.dataList addObject:group];
}



#pragma mark - MFMessageComposeViewControllerDelegate 监听didFinishWithResult,进行关闭短信界面
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    /**
     enum MessageComposeResult {
     MessageComposeResultCancelled,
     MessageComposeResultSent,
     MessageComposeResultFailed
     };
     */
    [controller dismissViewControllerAnimated:YES completion:^{
        switch (result) {
            case MessageComposeResultCancelled:
                NSLog(@"%@",@"发送取消");
                break;
            case MessageComposeResultFailed:
                NSLog(@"%@",@"发送失败");
                break;
            case MessageComposeResultSent:
                NSLog(@"%@",@"发送成功");
                break;
            }
    }];
}

@end
