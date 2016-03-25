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
    urls = @[@"http://pic91.nipic.com/file/20160310/22671524_101323754000_2.jpg",@"http://izzs.cc/wp-content/uploads/2015/03/%E5%A4%8F%E5%A9%89%E5%A9%89_06.jpg",@"http://izzs.cc/wp-content/uploads/2015/03/%E5%A4%8F%E5%A9%89%E5%A9%89_25.jpg",@"http://izzs.cc/wp-content/uploads/2015/03/%E5%A4%8F%E5%A9%89%E5%A9%89_38.jpg",@"http://ww2.sinaimg.cn/large/005Kz0tbgw1eyq60wlz4tj30zk1hcjwn.jpg",@"http://f.hiphotos.baidu.com/lvpics/h=800/sign=8430a8305cee3d6d3dc68acb73176d41/9213b07eca806538d9da1f8492dda144ad348271.jpg",@"http://d.hiphotos.baidu.com/lvpics/w=1000/sign=81bf893e12dfa9ecfd2e521752e0f603/242dd42a2834349b705785a7caea15ce36d3bebb.jpg",@"http://g.hiphotos.baidu.com/lvpics/h=800/sign=e1ad4f8c33fae6cd13b4a6613fb20f9e/a08b87d6277f9e2f718eb3b31930e924b999f3d6.jpg",@"http://i1.sinaimg.cn/ent/d/2009-05-15/U93P28T3D2520384F346DT20090515164753.jpg" ,@"http://img6.faloo.com/Picture/680x580/0/461/461310.jpg"];
    
    imgs = @[[UIImage imageNamed:@"1.jpg"],[UIImage imageNamed:@"2.jpg"],[UIImage imageNamed:@"3.jpg"],[UIImage imageNamed:@"4.jpg"],[UIImage imageNamed:@"5.jpg"]];

    
    
}
/** 可以通过 代理 或者属性  传入 URL数组  或者 imgae数组
  属性  和  代理   2选1
 */
-(void)lookLook:(id)sender{
    XZH_ImageVC *vc = [[XZH_ImageVC alloc]init];
//    vc.imgDataSourceDelegate = self;
    vc.imgArr = [NSMutableArray arrayWithArray:imgs];//
    [self presentViewController:vc animated:YES completion:nil];
}

-(NSInteger)totalImageNumber{
//    return urls.count;
        return imgs.count;
}
//-(NSURL *)urlWithIndex:(NSInteger)index{
//    return [NSURL URLWithString:urls[index]];
//}
-(UIImage*)imageWithIndex:(NSInteger)index{
    return imgs[index];
}

@end
