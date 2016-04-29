//
//  HLScoreViewController.m
//  HisunLottery
//
//  Created by devzkn on 4/29/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLScoreViewController.h"
#import "HLSettingLabeltemModel.h"
#import "HLSettingSwitchItemModel.h"
#import "HLSettingItemGroupModel.h"

@interface HLScoreViewController ()

@end

@implementation HLScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加模型
    [self addGroup0];
    [self addGroup1];
    [self addGroup2];


}

- (void) addGroup0{
    HLSettingItemGroupModel *group = [[HLSettingItemGroupModel alloc]init];
    HLSettingSwitchItemModel *switchItemModel = [HLSettingSwitchItemModel itemModelWithTitle:@"提醒我关注比赛" icon:@""];
    [group setItems:@[switchItemModel]];
    [group setFooter:@"当我关注比赛比分发生变化时，通过小浮窗或者推送进行提醒"];
    [self.dataList addObject:group];
}

- (void) addGroup1{
    HLSettingItemGroupModel *group = [[HLSettingItemGroupModel alloc]init];
    HLSettingLabeltemModel *switchItemModel = [HLSettingLabeltemModel itemModelWithTitle:@"开始时间" icon:@""];
    [switchItemModel setText:@"00:00"];
    [group setItems:@[switchItemModel]];
    [group setHeader:@"只在以下时间接受比分直播"];
    [self.dataList addObject:group];
}
- (void) addGroup2{
    HLSettingItemGroupModel *group = [[HLSettingItemGroupModel alloc]init];
    HLSettingLabeltemModel *switchItemModel = [HLSettingLabeltemModel itemModelWithTitle:@"结束时间" icon:@""];
    [switchItemModel setText:@"00:00"];
    [group setItems:@[switchItemModel]];
    [self.dataList addObject:group];
}



@end
