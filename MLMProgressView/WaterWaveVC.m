//
//  ViewController.m
//  WaveWaterProgress
//
//  Created by my on 2016/11/9.
//  Copyright © 2016年 my. All rights reserved.
//

#import "WaterWaveVC.h"
#import "MLMWaveWaterView.h"
#import "UIView+MLMBorderPath.h"

@interface WaterWaveVC ()
{
    MLMWaveWaterView *waterView;
}
@end

@implementation WaterWaveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    waterView = [[MLMWaveWaterView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 200)/2, 70, 200,200)];
    waterView.progress = .1;
    [self.view addSubview:waterView];

}

- (IBAction)changProgress:(UISlider *)sender {
    [waterView setProgress:sender.value];
}
- (IBAction)animationAction:(UISwitch *)sender {
    waterView.progress_animation = sender.on;
}

- (IBAction)borderTypeAction:(UISegmentedControl *)sender {
    
    CGRect rect = waterView.frame;

    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            waterView.borderPath = nil;
            rect.size.height = rect.size.width;

        }
            break;
        case 1:
        {
            CGRect frame = waterView.bounds;
            frame.size.height = frame.size.width * 9 /10;
            waterView.changeFrame = frame;

            waterView.borderPath = [UIView heartPathRect:rect lineWidth:0];
            waterView.border_fillColor = [UIColor groupTableViewBackgroundColor];
            
        }
            break;
        case 2:
        {

            waterView.changeFrame = waterView.bounds;

            
            waterView.borderPath = [UIView circlePathRect:rect lineWidth:0];
            waterView.border_fillColor = [UIColor groupTableViewBackgroundColor];
        }
            break;
        case 3:
        {
            //五角星距离中心距离
            CGFloat redius_star = rect.size.width/2;
            
            CGFloat star_w = redius_star * sin(2*M_PI/5)*2;
            CGFloat star_h = redius_star * (sin(3*M_PI/10) + 1);
            
            //图形所在区域frame
            CGRect changeFrame = CGRectMake((rect.size.width -star_w)/2, 0, star_w, star_h);
            
            rect.size.height = star_h;

            waterView.changeFrame = changeFrame;
            
            waterView.borderPath = [UIView startPathRect:rect lineWidth:0];
            waterView.border_fillColor = [UIColor groupTableViewBackgroundColor];
            
        }
            break;
        default:
            break;
    }
}


@end
