//
//  XZH_ImageScrollView.h
//  Animation
//
//  Created by 谢小幽 on 16/3/22.
//  Copyright © 2016年 XZH. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@protocol XZH_ImageScrollViewDelegate <NSObject>

-(void)imgViewClick;

@end



@interface XZH_ImageScrollView : UIScrollView<UIScrollViewDelegate>

@property(nonatomic,strong)UIImageView   *imgView;
@property(nonatomic,strong)NSURL        *imgUrl;//通过URL下载图片
@property(nonatomic,strong)UIImage      *localImage;//通过本地图片设置

@property(nonatomic,assign)CGFloat     maxZoom;//最大比例

@property(nonatomic,weak)id<XZH_ImageScrollViewDelegate> imageClickDelegate;



-(void)restoreZoomingScale:(CGFloat)scale;

@end
