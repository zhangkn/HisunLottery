//
//  HLSettingItemModel.m
//  HisunLottery
//
//  Created by devzkn on 4/27/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLSettingItemModel.h"

@implementation HLSettingItemModel
@synthesize iconImage = _iconImage;

- (UIImage *)iconImage{
    if (nil == _iconImage) {
        _iconImage = [UIImage imageNamed:self.icon];
    }
    return _iconImage;
    
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    //KVC
    self = [super init];//初始化父类属性
    if (self) {
        //初始化自身属性
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)itemModelWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}

+ (NSArray *)list:(NSArray *)arrayDict{
    NSMutableArray *tmpArrayM = [NSMutableArray array];
    //解析plist
    for (NSDictionary *dict in  arrayDict) {
        [tmpArrayM addObject:[self itemModelWithDictionary:dict]];
    }
    return tmpArrayM;
}


@end
