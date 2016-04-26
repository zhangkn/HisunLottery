//
//  UIImage+ResizableImage.m
//  HisunLottery
//
//  Created by devzkn on 4/26/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "UIImage+ResizableImage.h"

@implementation UIImage (ResizableImage)


+ (UIImage*)resizableImageWithName:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    //裁剪图片方式一：
    //Creates and returns a new image object with the specified cap values.
    /*right cap is calculated as width - leftCapWidth - 1
     bottom cap is calculated as height - topCapWidth - 1
     */
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    //方式二：
    //    CGFloat top = image.size.width*0.5f-1;
    //    CGFloat left = image.size.height*0.5f-1;
    //    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, top, left);
    //    UIImage *capImage = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeTile];
    //
}


@end
