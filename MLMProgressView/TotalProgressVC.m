//
//  TotalProgressVC.m
//  MLMProgressView
//
//  Created by my on 16/8/10.
//  Copyright © 2016年 MS. All rights reserved.
//

#import "TotalProgressVC.h"
#import "MLMProgressView.h"
@interface TotalProgressVC () <UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *_collectionView;
}
@end

@implementation TotalProgressVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flow = [UICollectionViewFlowLayout new];
    flow.minimumLineSpacing = 1;
    flow.minimumInteritemSpacing = 1;
    flow.itemSize = CGSizeMake(self.view.width-2, self.view.width-2);
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
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:1];

    for (MLMProgressView *view in cell.subviews) {
        [view removeFromSuperview];
    }
    switch (indexPath.row) {
        case 0:
        {
            MLMProgressView *progress = [[MLMProgressView alloc] initWithFrame:CGRectMake(0, 0, cell.width, cell.height)];
            [cell addSubview:[progress sesameCreditType]];
            [progress tapHandle:^{
                [progress.circle setProgress:.8];
            }];
        }
            break;
        case 1:
        {
            MLMProgressView *progress = [[MLMProgressView alloc] initWithFrame:CGRectMake(0, 0, cell.width, cell.height)];
            [cell addSubview:[progress speedDialType]];
            [progress tapHandle:^{
                [progress.circle setProgress:.6];
            }];
        }
            break;
        default:
            break;
    }

    return cell;
}


@end
