//
//  HLAboutViewController.m
//  HisunLottery
//
//  Created by devzkn on 4/30/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLAboutViewController.h"
#import "HLSettingItemGroupModel.h"
#import "HLSettingArrowItemModel.h"
#import "HLAboutHeaderView.h"
@interface HLAboutViewController ()

@end

@implementation HLAboutViewController

- (void)viewDidLoad {
    NSLog(@"%s",__func__);

    [super viewDidLoad];
    [self addGroup0];
    //设置tableView的headerView
    [self.tableView setTableHeaderView:[HLAboutHeaderView tableViewHeaderView]];

}

- (void)addGroup0{
    HLSettingItemGroupModel *group = [[HLSettingItemGroupModel alloc]init];
    HLSettingArrowItemModel *scoreItem = [HLSettingArrowItemModel itemModelWithTitle:@"评分支持" icon:@"" destVCClass:nil];
    HLSettingArrowItemModel *telItem = [HLSettingArrowItemModel itemModelWithTitle:@"客服电话" icon:@"" destVCClass:nil];
    [telItem setSubTitle:@"0731-1887405487"];
    [group setItems:@[scoreItem,telItem]];
    [self.dataList addObject:group];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

@end
