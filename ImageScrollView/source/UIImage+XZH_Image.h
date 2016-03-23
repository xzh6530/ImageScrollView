//
//  UIImage+XZH_Image.h
//  Animation
//
//  Created by 谢小幽 on 16/3/22.
//  Copyright © 2016年 XZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XZH_Image)

/**根据目标大小    获取新的size，图片实际大小不变*/
-(CGSize)getNewSizeWithTargetSize:(CGSize)size;

@end
