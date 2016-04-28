//
//  HLSettingTableViewController.m
//  HisunLottery
//
//  Created by devzkn on 4/26/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLSettingTableViewController.h"
#import "HLSettingItemGroupModel.h"
#import "HLSettingItemModel.h"
#import "HLSettingCell.h"
#import "HLSettingSwitchItemModel.h"
#import "HLSettingArrowItemModel.h"

@interface HLSettingTableViewController ()

@property (nonatomic,strong) NSMutableArray *dataList;


@end
@implementation HLSettingTableViewController


- (NSMutableArray *)dataList{
    if (nil == _dataList) {
        _dataList = [NSMutableArray array];
        //第1组模型构建
        NSDictionary *dictPush = @{@"title":@"消息推送和提醒",@"icon":@"MorePush"};
        NSDictionary *dictHandShake =  @{@"title":@"摇一摇机选",@"icon":@"handShake"};
        HLSettingItemGroupModel *group0 = [[HLSettingItemGroupModel alloc]init];
        HLSettingSwitchItemModel *pushItem = [HLSettingSwitchItemModel itemModelWithDictionary:dictPush];
        HLSettingSwitchItemModel *handShakeItem = [HLSettingSwitchItemModel itemModelWithDictionary:dictHandShake];
        group0.items = @[pushItem,handShakeItem];
        [group0 setHeader:@"第一组的header"];
        [group0 setFooter:@"第一组的footer"];
        //第二组模型构建
        NSDictionary *moreUpdateDict = @{@"title":@"检查新版本",@"icon":@"MoreUpdate"};
        NSDictionary *moreHelpDict =  @{@"title":@"帮助",@"icon":@"MoreHelp"};
        HLSettingItemGroupModel *group1 = [[HLSettingItemGroupModel alloc]init];
        
        HLSettingArrowItemModel *moreUpdateItem = [HLSettingArrowItemModel itemModelWithDictionary:moreUpdateDict];
        HLSettingArrowItemModel *moreHelpDictItem = [HLSettingArrowItemModel itemModelWithDictionary:moreHelpDict];
        group1.items = @[moreUpdateItem,moreHelpDictItem];
        [group1 setHeader:@"第2组的header"];
        [group1 setFooter:@"第2组的footer"];
        [_dataList addObject:group0];
        [_dataList addObject:group1];
    }
    return _dataList;
}



- (instancetype)init{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        //设置自己属性
    }
    return self;
    
}

- (NSString*) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    HLSettingItemGroupModel *group = self.dataList[section];
    return group.footer;

}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    HLSettingItemGroupModel *group = self.dataList[section];
    return group.header;

}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        HLSettingItemGroupModel *group = self.dataList[indexPath.section];
    HLSettingItemModel *itemModel = group.items[indexPath.row];
    HLSettingCell *cell =[HLSettingCell tableVieCellWithItemModel:itemModel tableView:tableView];
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    HLSettingItemGroupModel *group = self.dataList[section];
    return group.items.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataList.count;
}

@end
