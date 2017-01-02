//
//  UIView+snapAddition.m
//  DrawingBoard
//
//  Created by 边雷 on 17/1/3.
//  Copyright © 2017年 Mac-b. All rights reserved.
//

#import "UIView+snapAddition.h"

@implementation UIView (snapAddition)

- (UIImage *)sa_snapshotImage
{
    //1.需要开启图片的图形上下文  -> 可以生成一张图片
    /**
     *  size -> 图片上下文的大小
     *  opaque -> 不透明,设置为 NO -> 透明
     *  scale -> 缩放因子
     */
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    //2.将视图的内容绘制到上下文中
    //  将当前的层级结构绘渲染到上下文中
    //  updatas 是否更新,tableView在滚动的过程,截图!保证不会有不清晰的情况
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    //3.获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //4. 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
