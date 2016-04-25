//
//  HLTabBarModel.m
//  HisunLottery
//
//  Created by devzkn on 4/25/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLTabBarModel.h"

@implementation HLTabBarModel
@synthesize image = _image;
@synthesize selectedImage = _selectedImage;


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (UIImage *)image{
    if (nil == _image) {
        _image = [UIImage  imageNamed:self.imageName];
    }
    return _image;
}

- (UIImage *)selectedImage{
    if (nil == _selectedImage) {
        _selectedImage = [UIImage  imageNamed:self.selectedImageName];
    }
    return _selectedImage;
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
+ (instancetype)tabBarModelWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}


@end
