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
#import "MBProgressHUD+MJ.h"
#import "HLTestViewController.h"
#import "HLProductCollectionViewController.h"
@interface HLSettingTableViewController ()

@property (nonatomic,strong) NSMutableArray *dataList;


@end
@implementation HLSettingTableViewController


- (NSMutableArray *)dataList{
    if (nil == _dataList) {
        _dataList = [NSMutableArray array];
        //第1组模型构建
        HLSettingItemGroupModel *group0 = [[HLSettingItemGroupModel alloc]init];
        HLSettingArrowItemModel *pushItem = [HLSettingArrowItemModel itemModelWithTitle:@"消息推送和提醒" icon:@"MorePush" destVCClass:[HLTestViewController class]];
        HLSettingSwitchItemModel *handShakeItem = [HLSettingSwitchItemModel itemModelWithTitle:@"摇一摇机选" icon:@"handShake"];
         HLSettingSwitchItemModel *sound_EffectItme = [HLSettingSwitchItemModel itemModelWithTitle:@"声音效果" icon:@"sound_Effect"];
        
        group0.items = @[pushItem,handShakeItem,sound_EffectItme];
        [group0 setHeader:@"第一组的header"];
        [group0 setFooter:@"第一组的footer"];
        //第二组模型构建
        HLSettingItemGroupModel *group1 = [[HLSettingItemGroupModel alloc]init];
        HLSettingArrowItemModel *moreUpdateItem = [HLSettingArrowItemModel itemModelWithTitle:@"检查更新" icon:@"MoreUpdate"];
        //定义坚持更新的block
        [moreUpdateItem setOptionBlock:^{
            //显示蒙板
            [MBProgressHUD showMessage:@"检查版本信息..."];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                //关闭蒙板
                [MBProgressHUD hideHUD];
                //显示提示信息
                UIAlertView *alterView = [[UIAlertView alloc]initWithTitle:@"有新版本" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即更新", nil];
                [alterView show];
            });
            
        }];
        HLSettingArrowItemModel *moreHelpDictItem = [HLSettingArrowItemModel itemModelWithTitle:@"帮助" icon:@"MoreHelp" destVCClass:[HLTestViewController class]];
         HLSettingArrowItemModel *moreShareItem = [HLSettingArrowItemModel itemModelWithTitle:@"分享" icon:@"MoreShare" destVCClass:[HLTestViewController class]];
         HLSettingArrowItemModel *moreMessageItem = [HLSettingArrowItemModel itemModelWithTitle:@"查看消息" icon:@"MoreMessage" destVCClass:[HLTestViewController class]];
         HLSettingArrowItemModel *moreNeteaseItem = [HLSettingArrowItemModel itemModelWithTitle:@"产品推荐" icon:@"MoreNetease" destVCClass:[HLProductCollectionViewController class]];
         HLSettingArrowItemModel *moreAboutItem = [HLSettingArrowItemModel itemModelWithTitle:@"关于" icon:@"MoreAbout" destVCClass:[HLTestViewController class]];

        group1.items = @[moreUpdateItem,moreHelpDictItem,moreShareItem,moreMessageItem,moreNeteaseItem,moreAboutItem];
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

#pragma mark - tableViewDelegate

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
#pragma mark - didSelectRowAtIndexPath

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //取出模型
    HLSettingItemGroupModel *group = self.dataList[indexPath.section];
    HLSettingItemModel *itemModel = group.items[indexPath.row];
    
    //执行optionBlock
    if (itemModel.optionBlock) {
        itemModel.optionBlock();
        return;
    }
    //控制器跳转
    if ([itemModel isKindOfClass:[HLSettingArrowItemModel class]]) {
        HLSettingArrowItemModel *arrowItemModel = (HLSettingArrowItemModel*) itemModel;
        if (arrowItemModel.destVCClass) {
            //控制器跳转
            UIViewController *vc = [[arrowItemModel.destVCClass alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
    
@end
