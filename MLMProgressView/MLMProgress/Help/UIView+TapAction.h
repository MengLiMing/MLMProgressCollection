//
//  UIView+Category.h
//  BaseProject
//
//  Created by my on 16/3/24.
//  Copyright © 2016年 base. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapAction)();

@interface UIView (TapAction)

- (void)tapHandle:(TapAction)block;

@end
