//
//  StatisticalVC.m
//  MLMProgressView
//
//  Created by my on 16/9/7.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "StatisticalVC.h"
#import "MLMStatisticalView.h"

@interface StatisticalVC ()

@end

@implementation StatisticalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MLMStatisticalView *view = [[MLMStatisticalView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    view.scaleArray = @[@(0.23),@(.52),@(.25)];
    view.colorArray = @[[UIColor redColor],[UIColor blueColor],[UIColor yellowColor]];
    view.widthArray = @[@(50),@(30),@(40)];
    [view drow];
    view.center = self.view.center;
    [self.view addSubview:view];
    
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = view.centerView.bounds;
    [view.centerView addSubview:label];
    label.text = @"我美吗";
    label.textAlignment = NSTextAlignmentCenter;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
