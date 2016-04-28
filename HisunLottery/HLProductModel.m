//
//  HLProductModel.m
//  HisunLottery
//
//  Created by devzkn on 4/28/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLProductModel.h"

@implementation HLProductModel
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
        
        [self setValue:dict[@"title"] forKey:@"title"];
        [self setValue:dict[@"id"] forKey:@"ID"];
        [self setValue:dict[@"url"] forKey:@"url"];
        [self setValue:dict[@"icon"] forKey:@"icon"];
        [self setValue:dict[@"customUrl"] forKey:@"customUrl"];

    }
    return self;
}

- (void)setIcon:(NSString *)icon{
    _icon = [icon stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""];
}
+ (instancetype)productModelWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}

+ (NSArray *)list{
    NSMutableArray *tmpArrayM = [NSMutableArray array];
    //解析plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
    NSData *data = [path dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *arrayDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    for (NSDictionary *dict in  arrayDict) {
        [tmpArrayM addObject:[self productModelWithDictionary:dict]];
    }
    return tmpArrayM;
}

@end
