//
//  InfoCollectionInfoCell.h
//  乐销
//
//  Created by 隋林栋 on 2018/2/12.
//  Copyright © 2018年 ping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlatformCollectionCell : UICollectionViewCell
//属性
@property (strong, nonatomic) UIImageView *iconImg;
@property (strong, nonatomic) UILabel *labelTitle;
@property (strong, nonatomic) UILabel *labelCount;
@property (nonatomic, strong) ModelBtn *model;

#pragma mark 刷新view
- (void)resetViewWithModel:(ModelBtn *)model;

@end
