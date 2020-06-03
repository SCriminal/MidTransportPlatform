//
//  AuditCarListCell.h
//  Platform
//
//  Created by 隋林栋 on 2019/12/26.
//Copyright © 2019 ping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuditCarListCell : UITableViewCell

@property (strong, nonatomic) UIView *colorLine;
@property (strong, nonatomic) UILabel *labelMainTitle;
@property (strong, nonatomic) UILabel *labellSubTitle;
@property (strong, nonatomic) UILabel *labelStatus;

@property (strong, nonatomic) UILabel *label0;
@property (strong, nonatomic) UIImageView *icon0;

@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UIImageView *icon1;

@property (strong, nonatomic) UILabel *label2;
@property (strong, nonatomic) UIImageView *icon2;

@property (strong, nonatomic) UILabel *label3;
@property (strong, nonatomic) UIImageView *icon3;

@property (strong, nonatomic) UIImageView *ivBg;
@property (strong, nonatomic) UIView *viewBG;

@property (nonatomic, strong) ModelAuditCar *model;

#pragma mark 刷新cell
- (void)resetCellWithModel:(ModelAuditCar *)model;

@end
