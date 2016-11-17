//
//  UIView+MLMBorderPath.m
//  MLMProgressView
//
//  Created by my on 2016/11/17.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "UIView+MLMBorderPath.h"

@implementation UIView (MLMBorderPath)

+ (UIBezierPath *)heartPathRect:(CGRect)rect
                       lineWidth:(CGFloat)width {
    CGFloat radius = rect.size.width/4;
    
    CGPoint center1 = CGPointMake(radius, radius);
    CGPoint center2 = CGPointMake(3*radius, radius);
    
    CGPoint bottom = CGPointMake(2*radius, rect.size.height);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center1 radius:radius startAngle:0 endAngle:3*M_PI_4 clockwise:NO];
    
    [path addLineToPoint:bottom];
    [path addArcWithCenter:center2 radius:radius startAngle:M_PI_4 endAngle:M_PI clockwise:NO];
    
    [path setLineCapStyle:kCGLineCapRound];
    
    [path setLineWidth:width];

    return path;
}

///圆形区域的path
+ (UIBezierPath *)circlePathRect:(CGRect)rect
                       lineWidth:(CGFloat)width {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [path setLineWidth:width];

    return path;
}

@end
