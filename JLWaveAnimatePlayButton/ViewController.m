//
//  ViewController.m
//  JLWaveAnimatePlayButton
//
//  Created by 李帅 on 2017/8/4.
//  Copyright © 2017年 JimLee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL isPlaying;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isPlaying = NO;
    [self addNavigationRightBarButtonItem];
}

- (void)addNavigationRightBarButtonItem {
    
    UIView *layerView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 80, 80)];
    [self.view addSubview:layerView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [layerView addGestureRecognizer:tap];
    
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(0, 0, 80, 80);
    replicatorLayer.backgroundColor = [UIColor redColor].CGColor;
    // 设置4个子层，3个复制层
    replicatorLayer.instanceCount = 4;
    // 设置复制子层的相对位置，每个x轴相差40
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(10, 0, 0);
    // 设置复制子层的延迟动画时长
    replicatorLayer.instanceDelay = 0.3;
    [layerView.layer addSublayer:replicatorLayer];
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 2, 40);
    layer.position = CGPointMake(25, 60);
    layer.anchorPoint = CGPointMake(0.5f, 1.f);
    layer.masksToBounds = YES;
    [replicatorLayer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    //    animation.keyPath = @"transform.scale.y";
    //    animation.toValue = @(0.15);
    //    animation.keyPath = @"position";
    //    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(25, 60)];
    animation.keyPath = @"bounds";
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 2, 15)];
    animation.autoreverses = YES;
    animation.repeatCount = MAXFLOAT;
    animation.duration = 0.25;
    [layer addAnimation:animation forKey:nil];
    
}

- (void)tapAction {
    
    self.isPlaying = !self.isPlaying;
    
    
    
    NSLog(@"tap action.....");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
