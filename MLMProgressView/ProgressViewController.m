//
//  ProgressViewController.m
//  MLMProgressView
//
//  Created by my on 16/8/4.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "ProgressViewController.h"
#import "MLMCircleView.h"

@interface ProgressViewController () <UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *_collectionView;

}

@end

@implementation ProgressViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flow = [UICollectionViewFlowLayout new];
    flow.minimumLineSpacing = 1;
    flow.minimumInteritemSpacing = 1;
    flow.itemSize = CGSizeMake((self.view.width-3)/2, (self.view.width-3)/2);
    flow.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flow];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.view addSubview:_collectionView];
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:1];
    for (MLMCircleView *view in cell.subviews) {
        [view removeFromSuperview];
    }
    switch (indexPath.row) {
        case 0:
        {
            [self type1:cell];
        }
            break;
        case 1:
        {
            [self type2:cell];
        }
            break;
        case 2:
        {
            [self type3:cell];
        }
            break;
        case 3:
        {
            [self type4:cell];
        }
            break;
        default:
            break;
    }
    
    return cell;
}

#pragma mark - 自定义
- (void)type1:(UICollectionViewCell *)cell {
    MLMCircleView *circle = [[MLMCircleView alloc] initWithFrame:CGRectMake(0, 0, cell.width,cell.width) startAngle:150 endAngle:390];
    circle.center = CGPointMake(cell.width/2, cell.height/2);
    
    circle.bottomWidth = 10;
    circle.progressWidth = 10;
    circle.fillColor = [UIColor greenColor];
    circle.bgColor = [UIColor colorWithWhite:1 alpha:.5];
    circle.dotDiameter = 10;
    circle.dotImage = [UIImage imageNamed:@"redDot"];
    [circle bottomNearProgress:NO];
    [circle drawProgress];
    circle.backgroundColor = [UIColor clearColor];
    
    [circle tapHandle:^{
        [circle setProgress:newProgress()];
    }];
    
    //自定义文字等label可在下方view中设置
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, circle.freeWidth, circle.freeWidth)];
    view.layer.cornerRadius = circle.freeWidth/2;
    view.backgroundColor = [UIColor colorWithWhite:1 alpha:.2];
    [circle addSubview:view];
    view.center = CGPointMake(cell.width/2, cell.height/2);
    
    [cell addSubview:circle];
}

- (void)type2:(UICollectionViewCell *)cell {
    MLMCircleView *circle = [[MLMCircleView alloc] initWithFrame:CGRectMake(0, 0, cell.width,cell.width)];
    circle.center = CGPointMake(cell.width/2, cell.height/2);
    circle.bottomWidth = 4;
    circle.progressWidth = 4;
    circle.fillColor = [UIColor greenColor];
    circle.bgColor = [UIColor colorWithWhite:1 alpha:.5];
    circle.dotDiameter = 20;
    circle.edgespace = 5;
    circle.dotImage = [UIImage imageNamed:@"brightDot"];
    [circle drawProgress];
    
    [circle tapHandle:^{
        [circle setProgress:newProgress()];
    }];
    
    [cell addSubview:circle];
}

- (void)type3:(UICollectionViewCell *)cell {
    MLMCircleView *circle = [[MLMCircleView alloc] initWithFrame:CGRectMake(0, 0, cell.width,cell.width) startAngle:180 endAngle:360];
    circle.center = CGPointMake(cell.width/2, cell.height/2);
    circle.bottomWidth = 4;
    circle.progressWidth = 20;
    circle.fillColor = [UIColor greenColor];
    circle.bgColor = [UIColor colorWithWhite:1 alpha:.5];
    circle.dotDiameter = 8;
    circle.edgespace = 5;
    circle.dotImage = nil;
    [circle bottomNearProgress:YES];
    circle.capRound = NO;
    [circle drawProgress];
    [circle tapHandle:^{
        [circle setProgress:newProgress()];
    }];
    
    [cell addSubview:circle];

}

- (void)type4:(UICollectionViewCell *)cell {
    MLMCircleView *circle = [[MLMCircleView alloc] initWithFrame:CGRectMake(0, 0, cell.width,cell.width) startAngle:90 endAngle:360];
    circle.center = CGPointMake(cell.width/2, cell.height/2);
    circle.bottomWidth = 4;
    circle.progressWidth = 4;
    circle.fillColor = [UIColor greenColor];
    circle.bgColor = [UIColor colorWithWhite:1 alpha:.5];
    circle.dotDiameter = 8;
    circle.edgespace = 5;
    circle.progressSpace = 10;
    circle.dotImage = [UIImage imageNamed:@"redDot"];
    [circle drawProgress];
    
    [circle tapHandle:^{
        [circle setProgress:newProgress()];
        
    }];
    
    
    [cell addSubview:circle];
}


CGFloat newProgress() {
    return arc4random()%500/500.0;
}

@end
