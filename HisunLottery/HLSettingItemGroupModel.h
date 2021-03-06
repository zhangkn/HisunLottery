//
//  HLSettingItemGroupModel.h
//  HisunLottery
//
//  Created by devzkn on 4/27/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLSettingItemGroupModel : UIView
@property (nonatomic,copy) NSString *footer;
@property (nonatomic,copy) NSString *header;
@property (nonatomic,copy) NSArray *items;


//定义初始化方法 KVC的使用
- (instancetype) initWithDictionary:(NSDictionary *) dict;
+ (instancetype) groupModelsWithDictionary:(NSDictionary *) dict;


@end
