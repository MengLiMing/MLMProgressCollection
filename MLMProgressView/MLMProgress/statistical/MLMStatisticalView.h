//
//  MLMStatisticalView.h
//  MLMProgressView
//
//  Created by my on 16/9/7.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLMStatisticalView : UIView

///百分比数组
@property (nonatomic, strong) NSArray *scaleArray;
///填充色数组
@property (nonatomic, strong) NSArray *colorArray;
///宽度数组
@property (nonatomic, strong) NSArray *widthArray;

///底部颜色
@property (nonatomic, strong) UIColor *bottomColor;
///底部宽
@property (nonatomic, assign) CGFloat bottomWidth;

///freeWidth
@property (nonatomic, assign, readonly) CGFloat freeWidth;



- (instancetype)initWithFrame:(CGRect)frame
                   startAngle:(CGFloat)start
                     endAngle:(CGFloat)end;
- (void)drow;
- (UIView *)centerView;

@end
