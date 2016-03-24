//
//  XZH_ImageVC.m
//  Animation
//
//  Created by 谢小幽 on 16/3/22.
//  Copyright © 2016年 XZH. All rights reserved.
//

#import "XZH_ImageVC.h"
#import "XZH_ImageScrollView.h"

@interface XZH_ImageVC ()<UIScrollViewDelegate,XZH_ImageScrollViewDelegate>{
    XZH_ImageScrollView *_leftView;
    XZH_ImageScrollView *_centerView;
    XZH_ImageScrollView *_rightView;
    NSInteger    _count;
    
}

@property(nonatomic,strong)UIScrollView    *scrollView;
@property(nonatomic,strong)UILabel         *lab;
@property(nonatomic,strong)UIButton        *exitBtn;

@end

@implementation XZH_ImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _count = [self.imgDataSourceDelegate totalImageNumber];
    NSInteger widhtNum  =_count > 3?3:_count;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * widhtNum, self.view.frame.size.height);
    if (_count == 1) {//只有一张图
        _leftView = [self createSubScrollView:_scrollView.bounds];
        [_scrollView addSubview:_leftView];
        
        if ([self.imgDataSourceDelegate respondsToSelector:@selector(imageWithIndex:)]) {
            _leftView.localImage = [self.imgDataSourceDelegate imageWithIndex:_index];
        }else{
            _leftView.imgUrl = [self.imgDataSourceDelegate urlWithIndex:_index];
        }
    }else if (_count == 2) {//只有2张图
        _leftView = [self createSubScrollView:_scrollView.bounds];
        [_scrollView addSubview:_leftView];
        
        _centerView = [[XZH_ImageScrollView alloc]initWithFrame:CGRectMake(_scrollView.bounds.size.width, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
        [_scrollView addSubview:_centerView];
        
        if ([self.imgDataSourceDelegate respondsToSelector:@selector(imageWithIndex:)]) {
            _leftView.localImage = [self.imgDataSourceDelegate imageWithIndex:_index];
            _centerView.localImage = [self.imgDataSourceDelegate imageWithIndex:_index+1];
        }else{
            _leftView.imgUrl = [self.imgDataSourceDelegate urlWithIndex:_index];
            _centerView.imgUrl = [self.imgDataSourceDelegate urlWithIndex:_index+1];
        }
        
    }else{
        _leftView = [self createSubScrollView:_scrollView.bounds];
        [_scrollView addSubview:_leftView];
        
        _centerView = [self createSubScrollView:CGRectMake(_scrollView.bounds.size.width, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
        [_scrollView addSubview:_centerView];
        
        _rightView = [self createSubScrollView:CGRectMake(_scrollView.bounds.size.width*2, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
        [_scrollView addSubview:_rightView];
        
        if (_index == 0) {
            [self changeImageLeft:_count-1 center:0 right:1];
        }else if (_index == _count -1){
            [self changeImageLeft:_index-1 center:_index right:0];
        }else{
            [self changeImageLeft:_index-1 center:_index right:_index+1];
        }
        
    }
    [super viewDidLoad];
    
    self.lab.text = [NSString stringWithFormat:@"%ld/%ld",_index+1,_count];
    [self.exitBtn setTitle:@"退出" forState:UIControlStateNormal];
}

-(void)imgViewClick{
    NSLog(@"      点击了   %ld",_index);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_count > 2) {
        [self changeImageWithOffset:scrollView.contentOffset.x];
    }else{
        _index = scrollView.contentOffset.x / scrollView.frame.size.width;
        self.lab.text = [NSString stringWithFormat:@"%ld/%ld",_index+1,_count];
    }
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (_leftView) {
        [_leftView restoreZoomingScale:1];
    }
    if (_centerView) {
        [_centerView restoreZoomingScale:1];
    }
    if (_rightView) {
        [_centerView restoreZoomingScale:1];
    }
}

- (void)changeImageWithOffset:(CGFloat)offsetX {
    
    if (offsetX >= _scrollView.bounds.size.width * 2) {
        _index++;
        if (_index == _count-1) {
            
            [self changeImageLeft:_index-1 center:_index right:0];
            
        }else if (_index == _count) {
            _index = 0;
            [self changeImageLeft:_count-1 center:0 right:1];
            
        }else {
            [self changeImageLeft:_index-1 center:_index right:_index+1];
        }
        
    }
    
    if (offsetX <= 0) {
        _index--;
        
        if (_index == 0) {
            
            [self changeImageLeft:_count-1 center:0 right:1];
            
        }else if (_index == -1) {
            
            _index = _count-1;
            [self changeImageLeft:_index-1 center:_index right:0];
            
        }else {
            [self changeImageLeft:_index-1 center:_index right:_index+1];
        }
    }
    
}

- (void)changeImageLeft:(NSInteger)LeftIndex center:(NSInteger)centerIndex right:(NSInteger)rightIndex {
    if (_count > 2) {
        if ([self.imgDataSourceDelegate respondsToSelector:@selector(imageWithIndex:)]) {//如果是本地图片
            _leftView.localImage = [self.imgDataSourceDelegate imageWithIndex:LeftIndex ];
            _centerView.localImage = [self.imgDataSourceDelegate imageWithIndex:centerIndex];
            _rightView.localImage = [self.imgDataSourceDelegate imageWithIndex:rightIndex];
        }else{
            _leftView.imgUrl = [self.imgDataSourceDelegate urlWithIndex:LeftIndex ];
            _centerView.imgUrl = [self.imgDataSourceDelegate urlWithIndex:centerIndex];
            _rightView.imgUrl = [self.imgDataSourceDelegate urlWithIndex:rightIndex];
        }
        
        [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0)];
    }
    
    self.lab.text = [NSString stringWithFormat:@"%ld/%ld",_index+1,_count];
}
-(UILabel *)lab{
    if (!_lab) {
        _lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        _lab.center = CGPointMake(self.view.frame.size.width *0.5, 40);
        _lab.backgroundColor = [UIColor clearColor];
        _lab.font = [UIFont systemFontOfSize:17];
        _lab.textColor = [UIColor whiteColor];
        _lab.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_lab];
    }
    return _lab;
}
-(UIButton *)exitBtn{
    if (!_exitBtn) {
        _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _exitBtn.titleLabel.textColor = [UIColor whiteColor];
        _exitBtn.bounds = CGRectMake(0, 0, 40, 40);
        _exitBtn.center = CGPointMake(self.view.frame.size.width - 50, 40);
        [_exitBtn addTarget:self action:@selector(exitImg) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_exitBtn];
    }
    return _exitBtn;
}
-(XZH_ImageScrollView*)createSubScrollView:(CGRect)frame{
    XZH_ImageScrollView *view = [[XZH_ImageScrollView alloc]initWithFrame:frame];
    view.imageClickDelegate = self;
    return view;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor blackColor];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}
-(void)exitImg{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
