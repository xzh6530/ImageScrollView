//
//  ViewController.m
//  ImageScrollView
//
//  Created by 谢小幽 on 16/3/23.
//  Copyright © 2016年 XZH. All rights reserved.
//

#import "ViewController.h"
#import "XZH_ImageVC.h"

@interface ViewController ()<XZH_imageDataSourceDelegate>{
    NSArray   *urls;
    NSArray   *imgs;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    urls = @[@"http://i1.sinaimg.cn/ent/d/2009-05-01/U2599P28T3D2499793F346DT20090501110248.JPG",@"http://img5.dfhon.cn/imagefiles/2011/201105/09/091425.jpg",@"http://img4q.duitang.com/uploads/item/201307/18/20130718101141_3uLFy.thumb.700_0.jpeg",@"http://pic20.nipic.com/20120426/3335995_092207447169_2.jpg",@"http://shopimg.kongfz.com.cn/20131224/1660560/1660560v5tiWn_b.jpg",@"http://f.hiphotos.baidu.com/lvpics/h=800/sign=8430a8305cee3d6d3dc68acb73176d41/9213b07eca806538d9da1f8492dda144ad348271.jpg",@"http://d.hiphotos.baidu.com/lvpics/w=1000/sign=81bf893e12dfa9ecfd2e521752e0f603/242dd42a2834349b705785a7caea15ce36d3bebb.jpg",@"http://g.hiphotos.baidu.com/lvpics/h=800/sign=e1ad4f8c33fae6cd13b4a6613fb20f9e/a08b87d6277f9e2f718eb3b31930e924b999f3d6.jpg",@"http://i1.sinaimg.cn/ent/d/2009-05-15/U93P28T3D2520384F346DT20090515164753.jpg" ,@"http://img6.faloo.com/Picture/680x580/0/461/461310.jpg"];
    
    imgs = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"4.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"5.jpg"]];
    
}
-(void)lookLook:(id)sender{
    XZH_ImageVC *vc = [[XZH_ImageVC alloc]init];
    vc.imgDataSourceDelegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
}

-(NSInteger)totalImageNumber{
    return urls.count;
    //    return imgs.count;
}
-(NSURL *)urlWithIndex:(NSInteger)index{
    return [NSURL URLWithString:urls[index]];
}
//-(UIImage*)imageWithIndex:(NSInteger)index{
//    return imgs[index];
//}

@end
