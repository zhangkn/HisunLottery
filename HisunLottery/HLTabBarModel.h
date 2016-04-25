//
//  HLTabBarModel.h
//  HisunLottery
//
//  Created by devzkn on 4/25/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLTabBarModel : UIView
@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,copy) NSString *selectedImageName;
@property (nonatomic,strong,readonly) UIImage *image;
@property (nonatomic,strong,readonly) UIImage *selectedImage;



//定义初始化方法 KVC的使用
- (instancetype) initWithDictionary:(NSDictionary *) dict;
+ (instancetype) tabBarModelWithDictionary:(NSDictionary *) dict;


@end
