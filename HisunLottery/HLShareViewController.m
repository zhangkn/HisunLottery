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

@interface HLShareViewController ()

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
    HLSettingArrowItemModel *mailItem = [HLSettingArrowItemModel itemModelWithTitle:@"邮件分享" icon:@"MailShare" destVCClass:nil];
    group.items = @[sinaItem,smsItem,mailItem];
    [self.dataList addObject:group];
}
    

@end
