//
//  MLMProgressView.h
//  MLMProgressView
//
//  Created by my on 16/8/4.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLMProgressHeader.h"

@interface MLMProgressView : UIView

@property (nonatomic, strong) MLMCircleView *circle;
@property (nonatomic, strong) MLMCalibrationView *calibra;


//这里只是简单写两种进度盘的风格，具体使用的时候请自己组合

//芝麻信用
- (UIView *)sesameCreditType;

//速度表盘
- (UIView *)speedDialType;


@end
