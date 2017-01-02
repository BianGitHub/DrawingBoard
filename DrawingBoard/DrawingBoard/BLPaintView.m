//
//  BLPaintView.m
//  DrawingBoard
//
//  Created by 边雷 on 17/1/2.
//  Copyright © 2017年 Mac-b. All rights reserved.
//

#import "BLPaintView.h"

@interface BLBezierPath : UIBezierPath
//负责记录自己的颜色
@property(nonatomic, strong) UIColor *lineColor;
@end
@implementation BLBezierPath
@end

@interface BLPaintView ()
@property(nonatomic, strong) BLBezierPath *path;
@end

@implementation BLPaintView
{
    NSMutableArray<BLBezierPath *> *_pathArrM;
}
#pragma mark - 文件完全唤醒时,实例化数组
- (void)awakeFromNib
{
    [super awakeFromNib];
    _pathArrM = [NSMutableArray array];
}

#pragma mark - 开始触摸时
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //1.获取触摸点
    CGPoint loc = [touches.anyObject locationInView:self];
    //2.设置为路径的起点
    //实例化路径
    _path = [BLBezierPath bezierPath];
    //设置线宽
    _path.lineWidth = _lineW;
    //设置颜色
    _path.lineColor = _lineC;
    //设置起点
    [_path moveToPoint:loc];
    //将路径添加到集合
    [_pathArrM addObject:_path];
    
}
#pragma mark - 移动时
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取触摸点
    CGPoint loc = [touches.anyObject locationInView:self];
    //添加为线
    [_path addLineToPoint:loc];
    //重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
//    [_path stroke];
    [_pathArrM enumerateObjectsUsingBlock:^(BLBezierPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj.lineColor setStroke];
        [obj stroke];
    }];
}


@end
