//
//  MLMStatisticalView.m
//  MLMProgressView
//
//  Created by my on 16/9/7.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "MLMStatisticalView.h"
#import "MLMProgressHeader.h"

@interface MLMStatisticalView ()
{
    ///中空位置半径,根据传入的宽度计算半径
    CGFloat radius;
    
    ///起点
    CGFloat _startAngle;
    ///终点
    CGFloat _endAngle;
    
    
    ///中心view
    UIView *centerView;
}

@property (nonatomic, strong) CAShapeLayer *bottomLayer;

@end

@implementation MLMStatisticalView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [self initWithFrame:frame startAngle:0 endAngle:360];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                   startAngle:(CGFloat)start
                     endAngle:(CGFloat)end {
    if (self = [super initWithFrame:frame]) {
        //默认数据
        _startAngle = start;
        _endAngle = end;
        
        //Bottom
        _bottomColor = [UIColor colorWithWhite:1 alpha:.5];
        _bottomWidth = 40;
        
        radius = self.width - _bottomWidth;
    }
    return self;
}


#pragma mark - 计算数组中的最大值
- (CGFloat)maxWidth:(NSArray *)arr {
    NSArray *array = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 floatValue] > [obj2 floatValue]) {
            return NSOrderedAscending;
        }
        if ([obj1 floatValue] < [obj2 floatValue]) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    }];
    
    return [array.firstObject floatValue];
}

- (CGFloat)minWidth:(NSArray *)arr {
    NSArray *array = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 floatValue] > [obj2 floatValue]) {
            return NSOrderedAscending;
        }
        if ([obj1 floatValue] < [obj2 floatValue]) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    }];
    
    return [array.lastObject floatValue];
}


#pragma mark - 画总刻度
- (void)drowBottom {
    UIBezierPath *bottomPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width/2,self.height/2)
                                                              radius:radius+_bottomWidth/2
                                                          startAngle:DEGREES_TO_RADIANS(_startAngle)
                                                            endAngle:DEGREES_TO_RADIANS(_endAngle)
                                                           clockwise:NO];
    self.bottomLayer = [CAShapeLayer layer];
    self.bottomLayer.frame = CGRectMake(0, 0, self.width, self.height);
    self.bottomLayer.fillColor = [UIColor clearColor].CGColor;
    self.bottomLayer.strokeColor = _bottomColor.CGColor;
    self.bottomLayer.lineWidth = _bottomWidth;
    self.bottomLayer.path = [bottomPath CGPath];
    [self.layer addSublayer:self.bottomLayer];
}


#pragma mark - 根据数组画统计
- (void)drowStatistical {
    //获取最大的那个宽度
    CGFloat maxWidth = [self maxWidth:_widthArray];
    
    _bottomWidth = [self minWidth:_widthArray];
    //中空位置半径
    radius = self.width/2 - maxWidth;
    
    [self drowBottom];
    
    
    //添加centerView
    [self addSubview:[self centerView]];
    
    //上一个结束的角度
    CGFloat end = 0;
    
    for (NSInteger i = 0; i < _scaleArray.count; i ++) {
        //百分比
        CGFloat scale = [_scaleArray[i] floatValue];
        if (scale == 0) {
            continue;
        }
        //开始角度
        CGFloat startAngle = end;
        CGFloat endAngle;

        //防止转换过程，出现偏差
        if (i == _scaleArray.count - 1 || scale == 1) {
            endAngle = _endAngle;
        } else {
            endAngle = end + (1-scale) * (_endAngle - _startAngle);
            
            //逆时针角度计算bug解决
            if (endAngle > 360) {
                endAngle -= 360;
            }
        }
        
        CGFloat scaleRadius = radius + [_widthArray[i] floatValue]/2;
        
        UIBezierPath *scalePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width/2, self.height/2)
                                                                 radius:scaleRadius
                                                             startAngle:DEGREES_TO_RADIANS(startAngle)
                                                               endAngle:DEGREES_TO_RADIANS(endAngle)
                                                              clockwise:NO];
        
        
        CAShapeLayer *scaleLayer = [CAShapeLayer layer];
        scaleLayer.fillColor = [UIColor clearColor].CGColor;
        
        //
        UIColor *strokeColor = _colorArray[i];
        scaleLayer.strokeColor = strokeColor.CGColor;
        scaleLayer.lineWidth = [_widthArray[i] floatValue];
        scaleLayer.path = [scalePath CGPath];
        [self.layer addSublayer:scaleLayer];
        
        //每次结束
        end = endAngle;
    }

}


- (CGFloat)freeWidth {
    return radius*2;
}

- (UIView *)centerView {
    if (!centerView) {
        centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.freeWidth, self.freeWidth)];
        centerView.layer.cornerRadius = radius;
        centerView.backgroundColor = [UIColor greenColor];
        centerView.center = self.center;
    }
    return centerView;
}



- (void)drow {
    [self drowStatistical];
}
@end
