//
//  XZH_ImageVC.h
//  Animation
//
//  Created by 谢小幽 on 16/3/22.
//  Copyright © 2016年 XZH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XZH_imageDataSourceDelegate <NSObject>

@optional
-(NSInteger)totalImageNumber;//照片总数
/** 2 个方法只需同时实现一种，一个网络加载，一个本地图片 */
-(UIImage*)imageWithIndex:(NSInteger)index;
-(NSURL*)urlWithIndex:(NSInteger)index;

@end

@interface XZH_ImageVC : UIViewController

/**如果 使用代理设置图片源，这不需要用属性传值*/
@property(nonatomic,weak)id<XZH_imageDataSourceDelegate>  imgDataSourceDelegate;

@property(nonatomic,strong)NSMutableArray    <NSString*>*imgUrls;//url数组
@property(nonatomic,strong)NSMutableArray    <UIImage*>*imgArr;//图片数组


/**可设置  预览照片的起始位置，必须小于照片总数*/
@property(nonatomic,assign)NSInteger     index;

@end
