//
//  ViewController.m
//  DrawingBoard
//
//  Created by 边雷 on 17/1/1.
//  Copyright © 2017年 Mac-b. All rights reserved.
//

#import "ViewController.h"
#import "BLPaintView.h"

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





@end
