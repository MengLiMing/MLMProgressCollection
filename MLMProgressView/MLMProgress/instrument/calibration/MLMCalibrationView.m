//
//  MLMCalibrationView.m
//  MLMProgressView
//
//  Created by my on 16/8/4.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "MLMCalibrationView.h"

typedef enum {
    MLMCalibrationViewDefault,///Default风格数字分割仪表盘
    MLMCalibrationViewCustom///Custom是自定义数组显示刻度的仪表盘,类似芝麻信用
} MLMCalibrationViewType;

@interface MLMCalibrationView () {
    CGFloat circleRadius;//圆半径
    
    ///起点
    CGFloat _startAngle;
    ///终点
    CGFloat _endAngle;
    
    //背景宽度
    CGFloat bottomWidth;
}
///刻度风格
@property (nonatomic, assign) MLMCalibrationViewType scaleType;

@property (nonatomic, strong) CAShapeLayer *bottomLayer;//弧度背景

@end

@implementation MLMCalibrationView

- (instancetype)initWithFrame:(CGRect)frame startAngle:(CGFloat)start endAngle:(CGFloat)end {
    if (self = [super initWithFrame:frame]) {
        _startAngle = start;
        _endAngle = end;
        
        //默认数据
        [self initData];
    }
    return self;
}

#pragma mark - 默认数据
- (void)initData {
    _maxValue = 10000;
    
    _majorScaleNum = 5;
    _majorScaleColor = [UIColor whiteColor];
    _majorScaleWidth = 1;
    _majorScaleLength =  15;
    
    _smallScaleNum = 6;
    _smallScaleColor = [UIColor whiteColor];
    _smallScaleWidth = 1;
    _smallScaleLength = 7;
    
    _bgColor = [UIColor colorWithWhite:1 alpha:.7];
    _customArray = nil;
    _scaleType = MLMCalibrationViewDefault;
    _textType = MLMCalibrationViewTextRotate;
    _edgeSpace = 0;
    _scaleSpace = 5;
    _scaleFont = [UIFont systemFontOfSize:10];
    _majorTextColor = [UIColor whiteColor];
}

#pragma mark - 绘画
- (void)drawCalibration {
    bottomWidth = _majorScaleLength>_smallScaleLength?_majorScaleLength:_smallScaleLength;
    circleRadius = self.width/2 - bottomWidth/2 - _edgeSpace;
    //画背景
    [self drawBottom];
    //画刻度
    [self drawScale];
    //画刻度值
    [self drawScaleNum];
}

#pragma mark - 背景
- (void)drawBottom {
    UIBezierPath *bottomPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width/2, self.height/2)
                                                              radius:circleRadius
                                                          startAngle:DEGREES_TO_RADIANS(_startAngle)
                                                            endAngle:DEGREES_TO_RADIANS(_endAngle)
                                                           clockwise:YES];
    self.bottomLayer = [CAShapeLayer layer];
    self.bottomLayer.frame = CGRectMake(0, 0, self.width, self.height);
    self.bottomLayer.fillColor = [UIColor clearColor].CGColor;
    self.bottomLayer.strokeColor = self.bgColor.CGColor;
    self.bottomLayer.opacity = .5;
    self.bottomLayer.lineWidth = bottomWidth;
    self.bottomLayer.path = [bottomPath CGPath];
    [self.layer addSublayer:self.bottomLayer];
}

#pragma mark - 刻度
- (void)drawScale {
    //总刻度
    CGFloat totalScale;
    //每个刻度旋转的度数
    CGFloat perAngle;
    
    switch (_scaleType) {
        case MLMCalibrationViewDefault:
        {
            totalScale = (_majorScaleNum?_majorScaleNum:1)*(_smallScaleNum?_smallScaleNum:1);
        }
            break;
        case MLMCalibrationViewCustom:
        {
            totalScale = _majorScaleNum*(_smallScaleNum?_smallScaleNum:1);
        }
            break;
        default:
            break;
    }
    //每个刻度旋转的度数
    perAngle = (_endAngle - _startAngle)/totalScale;
    
    for (NSInteger i = 0; i < totalScale + 1; i ++) {
        //刻度起始度数
        CGFloat startAngle = _startAngle + perAngle*i;
        if (i%_smallScaleNum == 0) {
            //刻度结束度数
            CGFloat endAngle = startAngle + _majorScaleWidth/(2*M_PI*circleRadius)*360;
            UIBezierPath *majorPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width/2, self.height/2)
                                                                     radius:circleRadius
                                                                 startAngle:DEGREES_TO_RADIANS(startAngle)
                                                                   endAngle:DEGREES_TO_RADIANS(endAngle)
                                                                  clockwise:YES];
            CAShapeLayer *majorLayer = [CAShapeLayer layer];
            majorLayer.strokeColor = _majorScaleColor.CGColor;
            majorLayer.path = [majorPath CGPath];
            majorLayer.lineWidth = _majorScaleLength;
            [self.layer addSublayer:majorLayer];
            
            
        } else {
            //刻度结束度数
            CGFloat endAngle = startAngle + _smallScaleWidth/(2*M_PI*circleRadius)*360;
            UIBezierPath *smallPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width/2, self.height/2) radius:circleRadius
                                                                 startAngle:DEGREES_TO_RADIANS(startAngle)
                                                                   endAngle:DEGREES_TO_RADIANS(endAngle)
                                                                  clockwise:YES];
            CAShapeLayer *smallLayer = [CAShapeLayer layer];
            smallLayer.strokeColor = _smallScaleColor.CGColor;
            smallLayer.path = [smallPath CGPath];
            smallLayer.lineWidth = _smallScaleLength;
            [self.layer addSublayer:smallLayer];
        }
    }
}



#pragma mark - 刻度值
- (void)drawScaleNum {
    //只画大刻度处对应的文字
    NSMutableArray *textArray = [NSMutableArray array];
    switch (_scaleType) {
        case MLMCalibrationViewDefault:
        {
            for (NSInteger i = 0; i < _majorScaleNum + 1; i ++) {
                [textArray addObject:@(_maxValue/_majorScaleNum*i)];
            }
        }
            break;
        case MLMCalibrationViewCustom:
        {
            [textArray addObjectsFromArray:_customArray];
        }
            break;
        default:
            break;
    }
    
    
    //两种方式
    [self createLabel:textArray];
//    [self drowText:textArray];
}

#pragma mark - label
- (void)createLabel:(NSArray *)textArray {
//    for (UILabel *label in self.subviews) {
//        [label removeFromSuperview];
//    }
    //每个大刻度对应的角度
    CGFloat singleAngle = (_endAngle - _startAngle)/(textArray.count - 1);
    for (NSInteger i = 0; i < textArray.count; i ++) {
        //每个大刻度对应的角度
        CGFloat degree = _startAngle + i * singleAngle;
        CGFloat angle = DEGREES_TO_RADIANS(degree);
        
        //对应文字的Size
        CGSize textSize = [self stringSize:[NSString stringWithFormat:@"%@",textArray[i]] withFont:_scaleFont size:CGSizeMake(MAXFLOAT, _scaleFont.lineHeight)];
        
        //对应的center
        CGFloat textRadius = circleRadius - self.bottomLayer.lineWidth/2 - _scaleSpace;
        CGPoint majorCenter = CGPointMake(self.width/2+textRadius*cosf(angle), self.height/2+textRadius*sinf(angle));
        ;
        
        UILabel *scaleLable      = [[UILabel alloc] init];
        scaleLable.frame = CGRectMake(0, 0, textSize.width, _scaleFont.lineHeight);
        scaleLable.text          = [NSString stringWithFormat:@"%@",textArray[i]];
        scaleLable.font          = _scaleFont;
        scaleLable.textColor     = _majorTextColor;
        [self addSubview:scaleLable];
        
        if (_textType == MLMCalibrationViewCustom) {
            //使用中心点
            scaleLable.center = CGPointMake(majorCenter.x - scaleLable.height/2*cosf(angle), majorCenter.y - scaleLable.height/2*sinf(angle));
            scaleLable.transform = CGAffineTransformRotate(scaleLable.transform, DEGREES_TO_RADIANS(90+degree));
        } else {
            //调整label的位置
            CGFloat offx = 0;
            CGFloat offy = 0;
            NSInteger angleCos = (10000 * cosf(angle));
            if (angleCos == 0) {
                offx = -textSize.width/2;
            } else if (angleCos < 0) {
                offy = -textSize.height/2;
            } else {
                offy = -textSize.height/2;
                offx = -textSize.width;
            }
            
            scaleLable.frame = CGRectMake(majorCenter.x+offx, majorCenter.y+offy, textSize.width, _scaleFont.lineHeight);
        }
    }
}

#pragma makr - 画字
- (void)drowText:(NSArray *)textArray {
    
}

#pragma mark - setter
- (void)setCustomArray:(NSArray *)customArray {
    _customArray = [NSArray arrayWithArray:customArray];
    if (_customArray.count) {
        self.scaleType = MLMCalibrationViewCustom;
    } else {
        self.scaleType = MLMCalibrationViewDefault;
    }
}

- (void)setScaleType:(MLMCalibrationViewType)scaleType {
    _scaleType = scaleType;
    if (scaleType == MLMCalibrationViewTextDefault) {
        _scaleSpace = 5;
    }
}


#pragma mark - 中间空区域的面积
- (CGFloat)freeWidth {
    NSAssert(_textType == MLMCalibrationViewTextRotate, @"只有在MLMCalibrationViewTextRotate风格时可以使用");
    return (circleRadius - bottomWidth/2 - _scaleSpace - self.scaleFont.lineHeight)*2;
}

#pragma mark - 字体长度
- (CGSize)stringSize:(NSString *)string withFont:(UIFont *)font size:(CGSize)size {
    
    CGSize resultSize;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7) {
        //段落样式
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineBreakMode = NSLineBreakByWordWrapping;
        
        //字体大小，换行模式
        NSDictionary *attributes = @{NSFontAttributeName : font , NSParagraphStyleAttributeName : style};
        resultSize = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    } else {
        //计算正文的高度
        resultSize = [string sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    }
    return resultSize;
}
@end
