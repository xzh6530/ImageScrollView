//
//  UIImage+XZH_Image.m
//  Animation
//
//  Created by 谢小幽 on 16/3/22.
//  Copyright © 2016年 XZH. All rights reserved.
//

#import "UIImage+XZH_Image.h"

@implementation UIImage (XZH_Image)
-(CGSize)getNewSizeWithTargetSize:(CGSize)targetSize{
    CGFloat height = self.size.height;
    CGFloat width = self.size.width;
    CGSize newSize ;
    if (width > targetSize.width|| height > targetSize.height) {
        CGFloat imgScale = width / height;
        CGFloat targetScale = targetSize.width/targetSize.height;
        if (imgScale > targetScale) {
            CGFloat newHeight = height /( width / targetSize.width);
            newSize = CGSizeMake(targetSize.width, newHeight);
        }else if(imgScale < targetScale){
            CGFloat newWidth = width / (height / targetSize.height);
            newSize = CGSizeMake(newWidth, targetSize.height);
        }else{
            newSize = targetSize;
        }
    }else{
        newSize = CGSizeMake(width, height);
    }
    return newSize;
}

@end
