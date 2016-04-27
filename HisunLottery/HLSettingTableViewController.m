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

@interface HLSettingTableViewController ()

@property (nonatomic,strong) NSMutableArray *dataList;


@end
@implementation HLSettingTableViewController


- (NSMutableArray *)dataList{
    if (nil == _dataList) {
        _dataList = [NSMutableArray array];
        NSArray *dictArray = @[@{@"title":@"消息推送和提醒",@"icon":@"MorePush"},@{@"title":@"摇一摇机选",@"icon":@"handShake"}];
        NSDictionary *dict0= @{@"footer":@"第一组footer",@"header":@"第一组的header",@"items":dictArray};
        NSArray *dictArray1 = @[@{@"title":@"检查新版本",@"icon":@"MoreUpdate"},@{@"title":@"帮助",@"icon":@"MoreHelp"}];
        NSDictionary *dict1= @{@"footer":@"第2组footer",@"header":@"第2组的header",@"items":dictArray1};
        HLSettingItemGroupModel *group0 = [HLSettingItemGroupModel groupModelsWithDictionary:dict0];
        HLSettingItemGroupModel *group1 = [HLSettingItemGroupModel groupModelsWithDictionary:dict1];
        
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
    NSString *idetifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifier];
        //设置一次性属性
    }
    HLSettingItemGroupModel *group = self.dataList[indexPath.section];
    HLSettingItemModel *itemModel = group.items[indexPath.row];
    [cell.textLabel setText:itemModel.title];
    [cell.imageView setImage: itemModel.iconImage];
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
