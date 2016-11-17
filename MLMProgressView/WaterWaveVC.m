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
    switch (sender.selectedSegmentIndex) {
        case 0:
        {
            waterView.borderPath = nil;
            
        }
            break;
        case 1:
        {
            waterView.borderPath = [UIView heartPathRect:waterView.bounds lineWidth:0];
            waterView.border_fillColor = [UIColor groupTableViewBackgroundColor];
 
        }
            break;
        case 2:
        {
            waterView.borderPath = [UIView circlePathRect:waterView.bounds lineWidth:0];
            waterView.border_fillColor = [UIColor groupTableViewBackgroundColor];
        }
            break;
        default:
            break;
    }

}


@end
