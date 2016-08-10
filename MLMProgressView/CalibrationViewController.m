//
//  CalibrationViewController.m
//  MLMProgressView
//
//  Created by my on 16/8/4.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "CalibrationViewController.h"
#import "MLMCalibrationView.h"


@implementation CalibrationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    MLMCalibrationView *calibra = [[MLMCalibrationView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.width) startAngle:150 endAngle:390];
    calibra.center = self.view.center;
    calibra.textType = MLMCalibrationViewTextRotate;
    calibra.maxValue = 1000000;
    calibra.smallScaleNum = 10;
    calibra.majorScaleNum = 10;
    calibra.customArray =  @[@"350",@"较差",@"550",@"中等",@"600",@"良好",@"650",@"优秀",@"700",@"极好",@"950"];
    calibra.edgeSpace = 20;
    [calibra drawCalibration];
    calibra.backgroundColor = [UIColor redColor];
    [self.view addSubview:calibra];
    
    //自定义文字等label可在下方view中设置
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, calibra.freeWidth, calibra.freeWidth)];
    view.center = self.view.center;
    view.layer.cornerRadius = calibra.freeWidth/2;
    view.backgroundColor = [UIColor colorWithWhite:1 alpha:.3];
    [self.view addSubview:view];
    
}
@end
