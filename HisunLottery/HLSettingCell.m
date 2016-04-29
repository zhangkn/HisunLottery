//
//  HLSettingCell.m
//  HisunLottery
//
//  Created by devzkn on 4/28/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLSettingCell.h"
#import "HLSettingArrowItemModel.h"
#import "HLSettingSwitchItemModel.h"
#import "HLSettingLabeltemModel.h"

@interface HLSettingCell ()

@property (nonatomic,strong) UISwitch *accessorySwitchView;
@property (nonatomic,strong) UIImageView *accessoryDisclosureIndicatorView;
//label 属性
@property (nonatomic,strong) UILabel *label;


@end

@implementation HLSettingCell

- (UILabel *)label{
    if (nil == _label) {
        UILabel *tmpView = [[UILabel alloc]init];
        [tmpView setTextColor:[UIColor redColor]];
        [tmpView setTextAlignment:NSTextAlignmentRight];
        [tmpView setBounds:CGRectMake(0, 0, 100, 44)];

        _label = tmpView;
    }
    return _label;
}

- (UIImageView *)accessoryDisclosureIndicatorView{
    if (nil == _accessoryDisclosureIndicatorView) {
        UIImageView *tmpView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellArrow"]];
        _accessoryDisclosureIndicatorView = tmpView;
    }
    return _accessoryDisclosureIndicatorView;
}


- (UISwitch *)accessorySwitchView{
    if (nil == _accessorySwitchView) {
        UISwitch *tmpView = [[UISwitch alloc]init];
        _accessorySwitchView = tmpView;
    }
    return _accessorySwitchView;
}

#pragma mark - 装配数据
- (void)setItemModel:(HLSettingItemModel *)itemModel{
    _itemModel = itemModel;
    //装配cell
    [self setUpData];
    //设置setAccessoryView
    [self settingAccessoryView];
    
}


- (void) setUpData{
    [self.textLabel setText:self.itemModel.title];
    [self.imageView setImage:self.itemModel.iconImage];
}

- (void) settingAccessoryView{
    if ([self.itemModel isKindOfClass: [HLSettingArrowItemModel class]]) {
        [self setAccessoryView:self.accessoryDisclosureIndicatorView];
        [self setSelectionStyle:UITableViewCellSelectionStyleDefault]; 
    }else if ([self.itemModel isKindOfClass:[HLSettingSwitchItemModel class]]){
        [self setAccessoryView:self.accessorySwitchView];
        //selectionStyle
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }else if ([self.itemModel isKindOfClass:[HLSettingLabeltemModel class]]){
        [self setSelectionStyle:UITableViewCellSelectionStyleDefault];//恢复可以选择的默认状态
        HLSettingLabeltemModel *labelModel = (HLSettingLabeltemModel *)self.itemModel;
        [self.label setText:labelModel.text];
        [self  setAccessoryView:self.label];
        
    }else{
        [self setAccessoryView:nil];
        [self setSelectionStyle:UITableViewCellSelectionStyleDefault];


    }
}

+ (instancetype)tableVieCellWithItemModel:(HLSettingItemModel *)model tableView:(UITableView *)tableView{
    HLSettingCell *cell = [self tableViewCellWithTableView:tableView];
    [cell setItemModel:model];
    return cell;
}

+ (instancetype)tableViewCellWithTableView:(UITableView *)tableVIew{
    NSString *identifier = @"HLSettingCell";
    HLSettingCell *cell = [tableVIew dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[HLSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}




@end
