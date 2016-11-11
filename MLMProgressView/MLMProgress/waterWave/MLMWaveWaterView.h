//
//  WaveWaterView.h
//  WaveWaterProgress
//
//  Created by my on 2016/11/9.
//  Copyright © 2016年 my. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLMWaveWaterView : UIView


@property (nonatomic, strong) UIColor *topColor;//前方波纹颜色
@property (nonatomic, strong) UIColor *bottomColor;//后方波纹颜色

//y = asin(wx+φ) + k
@property (nonatomic, assign) CGFloat progress;//进度,计算k
@property (nonatomic, assign) CGFloat wave_Amplitude;//振幅，a
@property (nonatomic, assign) CGFloat wave_Cycle;//周期，w

@property (nonatomic, assign) CGFloat wave_distance;//两个波之间偏移


@property (nonatomic, assign) CGFloat wave_scale;//水波速率
@property (nonatomic, assign) CGFloat progress_scale;//progress速率

@property (nonatomic, assign) BOOL progress_animation;//是否需要进度变化的动画，默认YES

@end
