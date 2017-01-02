//
//  ViewController.m
//  DrawingBoard
//
//  Created by 边雷 on 17/1/1.
//  Copyright © 2017年 Mac-b. All rights reserved.
//

#import "ViewController.h"
#import "BLPaintView.h"
#import "UIView+snapAddition.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet BLPaintView *paintView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 默认可以画线
    [self sliderValueChanged:_slider];
}
#pragma mark - 监听silder的事件
- (IBAction)sliderValueChanged:(UISlider *)sender {
    //拿到silder的值
    float width = sender.value;
    //传递给画板
    _paintView.lineW = width;
}
#pragma Mark - 监听颜色按钮和橡皮擦   -> 橡皮擦: 背景颜色与PaintVew配镜颜色一样, 实现橡皮擦功能
- (IBAction)colorBtnClick:(UIButton *)sender {
    
    UIColor *color = sender.backgroundColor;
    
    _paintView.lineC = color;
}
#pragma mark - 监听保存按钮
- (IBAction)saveBtnClick:(UIButton *)sender {
    
    //1.截图
    UIImage *image = [_paintView sa_snapshotImage];
    
    //2.保存到相册
    /**
     *  @param image#>              image   需要保存的图片
     *  @param completionTarget#>   completionTarget  完成后需要执行方法的对象!
     *  @param completionSelector#> completionSelector 完成后需要执行的方法!
     *  @param contextInfo#>        contextInfo 上下文信息,可以写nil!或着字符串!
     */
//    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), @"1");
}

#pragma mark - 系统规定的图片保存到相册结束后会调用的方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    if (error) {
        NSLog(@"错误信息 %@", error);
        return;
    }
    
    NSLog(@"保存成功 %@", contextInfo);
}

@end
