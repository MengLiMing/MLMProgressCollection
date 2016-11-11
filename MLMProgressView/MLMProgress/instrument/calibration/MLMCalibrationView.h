//
//  MLMCalibrationView.h
//  MLMProgressView
//
//  Created by my on 16/8/4.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLMProgressHeader.h"

typedef enum {
    MLMCalibrationViewTextDefault,///text不旋转
    MLMCalibrationViewTextRotate///text随刻度旋转
} MLMCalibrationViewTextStyle;

@interface MLMCalibrationView : UIView

///总刻度
@property (nonatomic, assign) NSInteger maxValue;

///大刻度
///大刻度总共分成几份
@property (nonatomic, assign) NSInteger majorScaleNum;
///大刻度颜色
@property (nonatomic, strong) UIColor *majorScaleColor;
///大刻度长度
@property (nonatomic, assign) CGFloat majorScaleLength;
///大刻度宽度
@property (nonatomic, assign) CGFloat majorScaleWidth;

///小刻度
///每个大刻度对应的小刻度分成几份
@property (nonatomic, assign) NSInteger smallScaleNum;
///小刻度颜色
@property (nonatomic, strong) UIColor *smallScaleColor;
///小刻度长度
@property (nonatomic, assign) CGFloat smallScaleLength;
//小刻度宽度
@property (nonatomic, assign) CGFloat smallScaleWidth;

///背景颜色(背景宽度默认为大刻度的宽度)
@property (nonatomic, strong) UIColor *bgColor;

///刻度值显示风格
@property (nonatomic, assign) MLMCalibrationViewTextStyle textType;

///刻度字体
@property (nonatomic, strong) UIFont *scaleFont;
///字体颜色
@property (nonatomic, strong) UIColor *majorTextColor;


///Custom风格的数组,设置数组则风格强制更改为Custom
@property (nonatomic, strong) NSArray *customArray;

///微调
///刻度距离view边缘的距离,默认0
@property (nonatomic, assign) CGFloat edgeSpace;
///刻度值离刻度的距离，默认为5
@property (nonatomic, assign) CGFloat scaleSpace;

///方便使用时布局
@property (nonatomic, assign, readonly) CGFloat freeWidth;


- (instancetype)initWithFrame:(CGRect)frame startAngle:(CGFloat)start endAngle:(CGFloat)end;

///请务必使用绘制
- (void)drawCalibration;




@end
