//
//  MLMProgressHeader.h
//  MLMProgressView
//
//  Created by my on 16/8/4.
//  Copyright © 2016年 MS. All rights reserved.
//


//木有接触过画图的请观看下图方便设置角度，0-90-180-270
//       .......@270@.......
//............@.......@..........
//..........@...........@........
//........@...............@...
//......@...................@.......
//....@.......................@.
//....180.....................0..
//....@.......................@.
//......@...................@.....
//........@...............@..
//..........@...........@.......
//............@.......@.........
//       .......@090@.......

#ifndef MLMProgressHeader_h
#define MLMProgressHeader_h

#import "MLMCalibrationView.h"
#import "MLMCircleView.h"
#import "UIView+Extensions.h"
#import "UIView+TapAction.h"

#define DEGREES_TO_RADIANS(degrees) ((degrees)*M_PI)/180

static const CGFloat kAnimationTime = 2.f;


#endif /* MLMProgressHeader_h */
