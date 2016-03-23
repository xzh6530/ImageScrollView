//
//  XZH_ImageScrollView.m
//  Animation
//
//  Created by 谢小幽 on 16/3/22.
//  Copyright © 2016年 XZH. All rights reserved.
//
#define kScreenWidth      [[UIScreen mainScreen]bounds].size.width
#define kScreenHeight     [[UIScreen mainScreen]bounds].size.height

#import "XZH_ImageScrollView.h"
#import "UIImage+XZH_Image.h"

@implementation XZH_ImageScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.delegate = self;
        self.bounds = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        self.maximumZoomScale = 2.5;
        self.backgroundColor = [UIColor blackColor];
        
        _imgView = [[UIImageView alloc]init];
        _imgView.frame = CGRectMake(10, 10, kScreenWidth - 20, kScreenHeight -20);
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgClick)];
        [self addGestureRecognizer:tap];
        [self addSubview:_imgView];
    }
    return self;
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imgView;
}

- (void)restoreZoomingScale:(CGFloat)scale
{
    [self setZoomScale:scale animated:NO];
}

//实现图片在缩放过程中居中
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat width = scrollView.bounds.size.width;
    CGFloat height = scrollView.bounds.size.height;
    
    CGFloat offsetX = (width > scrollView.contentSize.width)?(width - scrollView.contentSize.width)/2 : 0.0;
    CGFloat offsetY = (height > scrollView.contentSize.height)?(height - scrollView.contentSize.height)/2 : 0.0;
    _imgView.center = CGPointMake(scrollView.contentSize.width/2 + offsetX,scrollView.contentSize.height/2 + offsetY);
    
}
-(void)imgClick{
    if ([self.imageClickDelegate respondsToSelector:@selector(imgViewClick)]) {
        [self.imageClickDelegate imgViewClick];
    }
}

-(void)setImgUrl:(NSURL *)imgUrl
{
    _imgUrl = imgUrl;
    [_imgView sd_setImageWithURL:imgUrl placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            [self setImgViewNewFrame:image];
        }
    }];
}
-(void)setLocalImage:(UIImage *)localImage{
    _localImage = localImage;
    CGSize  newSize = [localImage getNewSizeWithTargetSize:CGSizeMake(kScreenWidth -20, kScreenHeight -20)];
    _imgView.image = localImage;
    _imgView.bounds = CGRectMake(0, 0, newSize.width, newSize.height);
}

-(void)setImgViewNewFrame:(UIImage*)image{
    CGSize  newSize = [image getNewSizeWithTargetSize:CGSizeMake(kScreenWidth -20, kScreenHeight -20)];
    dispatch_async(dispatch_get_main_queue(), ^{
        _imgView.image = image;
        _imgView.bounds = CGRectMake(0, 0, newSize.width, newSize.height);
    });
}
@end
