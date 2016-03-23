//
//  XZH_ImageVC.h
//  Animation
//
//  Created by 谢小幽 on 16/3/22.
//  Copyright © 2016年 XZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XZH_imageDataSourceDelegate <NSObject>

-(NSInteger)totalImageNumber;

@optional
/** 2 个方法只需同时实现一种，一个网络加载，一个本地图片 */
-(UIImage*)imageWithIndex:(NSInteger)index;
-(NSURL*)urlWithIndex:(NSInteger)index;

@end

@interface XZH_ImageVC : UIViewController

@property(nonatomic,weak)id<XZH_imageDataSourceDelegate>  imgDataSourceDelegate;
@property(nonatomic,assign)NSInteger     index;

@end
