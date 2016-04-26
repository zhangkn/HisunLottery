//
//  HLTitleButton.m
//  HisunLottery
//
//  Created by devzkn on 4/25/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLTitleButton.h"
#import <Availability.h>

@implementation HLTitleButton

- (void)awakeFromNib{
//    [self.imageView setContentMode:UIViewContentModeCenter];
}


/**
 warning: could not load any Objective-C class information. This will significantly reduce the quality of type information available.
 self.titleLabel.text  不能使用，它内部会调用 titleRectForContentRect：造成死循环。
 采用 self.currentTitle
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleHeight = contentRect.size.height;
    CGFloat titleWeight= 0;
    UIFont *font = [UIFont systemFontOfSize:15.0];
    if (IOS7) {//判断运行时的版本
        //编译环境的判断#define __IPHONE_7_0     70000  －－#import <Availability.h>
#ifdef __IPHONE_7_0
        //计算按钮宽度
        NSDictionary *dict =@{NSFontAttributeName:font};
        titleWeight = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.width;
        
#else
        titleWeight = [self.currentTitle sizeWithFont:font].width;
#endif

    }else{
        titleWeight = [self.currentTitle sizeWithFont:font].width;
    }
    return CGRectMake(titleX, titleY, titleWeight, titleHeight);
}

#if 1
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat Y = 0;
    CGFloat Height = contentRect.size.height;
    
    CGFloat Weight =16;
    CGFloat X =  contentRect.size.width - Weight;
    
    return CGRectMake(X, Y, Weight, Height);
}
#endif

@end
