//
//  HLTitleButton.m
//  HisunLottery
//
//  Created by devzkn on 4/25/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HLTitleButton.h"

@implementation HLTitleButton


/**
 warning: could not load any Objective-C class information. This will significantly reduce the quality of type information available.
 self.titleLabel.text  不能使用，它内部会调用 titleRectForContentRect：造成死循环。
 采用 self.currentTitle
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleHeight = contentRect.size.height;
    NSDictionary *dict =@{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    CGFloat titleWeight = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size.width;
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
