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
            rect.size.height = rect.size.width * 9 /10;

            waterView.borderPath = [UIView heartPathRect:rect lineWidth:0];
            waterView.border_fillColor = [UIColor groupTableViewBackgroundColor];
            
        }
            break;
        case 2:
        {
            rect.size.height = rect.size.width;

            waterView.borderPath = [UIView circlePathRect:rect lineWidth:0];
            waterView.border_fillColor = [UIColor groupTableViewBackgroundColor];
        }
            break;
        case 3:
        {
            rect.size.height = rect.size.width * (sin(3*M_PI/10) + 1) / 2;

            waterView.borderPath = [UIView startPathRect:rect lineWidth:0];
            waterView.border_fillColor = [UIColor groupTableViewBackgroundColor];
            
        }
            break;
        default:
            break;
    }
    waterView.frame = rect;

}


@end
