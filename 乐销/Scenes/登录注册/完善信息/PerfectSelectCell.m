//
//  PerfectSelectCell.m
//中车运
//
//  Created by 隋林栋 on 2018/10/24.
//Copyright © 2018年 ping. All rights reserved.
//

#import "PerfectSelectCell.h"

@interface PerfectSelectCell ()

@end

@implementation PerfectSelectCell
#pragma mark 懒加载
- (UILabel *)title{
    if (_title == nil) {
        _title = [UILabel new];
        _title.textColor = COLOR_666;
        _title.font =  [UIFont systemFontOfSize:F(16) weight:UIFontWeightRegular];
        _title.numberOfLines = 0;
        _title.lineSpace = 0;
    }
    return _title;
}
- (UILabel *)subTitle{
    if (_subTitle == nil) {
        _subTitle = [UILabel new];
        _subTitle.textColor = COLOR_999;
        _subTitle.font =  [UIFont systemFontOfSize:F(16) weight:UIFontWeightRegular];
        _subTitle.numberOfLines = 0;
        _subTitle.lineSpace = 0;
    }
    return _subTitle;
}
- (UIImageView *)iconArrow{
    if (!_iconArrow) {
        _iconArrow = [UIImageView new];
        _iconArrow.backgroundColor = [UIColor clearColor];
        _iconArrow.image = [UIImage imageNamed:@"arrow_down"];
        _iconArrow.hidden = true;
        _iconArrow.widthHeight = XY(W(25), W(25));
    }
    return _iconArrow;
}
#pragma mark 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.subTitle];
        [self.contentView addSubview:self.iconArrow];

        [self.contentView addTarget:self action:@selector(cellClick)];
    }
    return self;
}
#pragma mark 刷新cell
/*
 isSelected 是否必填
 isHide 是否隐藏右箭头
 */
- (void)resetCellWithModel:(ModelBaseData *)model{
    self.model = model;
    [self.contentView removeSubViewWithTag:TAG_LINE];//移除线
    //设置总高度
    self.height = W(65);
    
    
    [self.title fitTitle:model.string variable:0];
    self.title.leftCenterY = XY(W(15),self.height/2.0);
    
    NSString *placeHolder = isStr(model.placeHolderString)?model.placeHolderString:@"选择您的出生年月日";
    [self.subTitle fitTitle:isStr(model.subString)?model.subString:placeHolder variable:0];
    self.subTitle.leftCenterY = XY(W(99),self.height/2.0);
    self.subTitle.textColor = isStr(model.subString)?COLOR_333:COLOR_999;
    
    self.iconArrow.rightCenterY = XY(SCREEN_WIDTH- W(10),self.height/2.0);

    [self.contentView addLineFrame:CGRectMake(W(15), self.height -1, SCREEN_WIDTH - W(15), 1)];
}
//reconfig text field left
- (void) reconfigTextFieldLeft:(CGFloat)left{
    self.subTitle.width = SCREEN_WIDTH - left - W(15);
    self.subTitle.left = left;
    
}
#pragma mark click
- (void)cellClick{
    if (self.model.blocClick) {
        self.model.blocClick(self.model);
    }
}

@end
