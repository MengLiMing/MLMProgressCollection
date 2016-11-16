//
//  WaveWaterView.h
//  WaveWaterProgress
//
//  Created by my on 2016/11/9.
//  Copyright © 2016年 my. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLMWaveWaterView : UIView

///前方波纹颜色
@property (nonatomic, strong) UIColor *topColor;
///后方波纹颜色
@property (nonatomic, strong) UIColor *bottomColor;

//y = asin(wx+φ) + k
///进度,计算k
@property (nonatomic, assign) CGFloat progress;
///振幅，a
@property (nonatomic, assign) CGFloat wave_Amplitude;
///周期，w
@property (nonatomic, assign) CGFloat wave_Cycle;
///两个波水平之间偏移
@property (nonatomic, assign) CGFloat wave_h_distance;
///两个波竖直之间偏移
@property (nonatomic, assign) CGFloat wave_v_distance;

///水波速率
@property (nonatomic, assign) CGFloat wave_scale;
///progress速率
@property (nonatomic, assign) CGFloat progress_scale;

///是否需要进度变化的动画，默认YES
@property (nonatomic, assign) BOOL progress_animation;

@end
