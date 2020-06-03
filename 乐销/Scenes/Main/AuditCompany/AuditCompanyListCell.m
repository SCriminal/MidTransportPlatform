//
//  AuditCompanyListCell.m
//  Platform
//
//  Created by 隋林栋 on 2019/12/26.
//Copyright © 2019 ping. All rights reserved.
//

#import "AuditCompanyListCell.h"

@interface AuditCompanyListCell ()

@end

@implementation AuditCompanyListCell
#pragma mark 懒加载
- (UIView *)colorLine{
    if (!_colorLine) {
        _colorLine = [UIView new];
        _colorLine.widthHeight = XY(W(5), W(30));
        _colorLine.backgroundColor = COLOR_BLUE;
        [GlobalMethod setRoundView:_colorLine color:[UIColor clearColor] numRound:_colorLine.width/2.0 width:0];
    }
    return _colorLine;
}
- (UILabel *)labelMainTitle{
    if (_labelMainTitle == nil) {
        _labelMainTitle = [UILabel new];
        _labelMainTitle.textColor = COLOR_333;
        _labelMainTitle.font =  [UIFont systemFontOfSize:F(16) weight:UIFontWeightBold];
        _labelMainTitle.numberOfLines = 1;
        _labelMainTitle.lineSpace = 0;
    }
    return _labelMainTitle;
}

- (UILabel *)labellSubTitle{
    if (_labellSubTitle == nil) {
        _labellSubTitle = [UILabel new];
        _labellSubTitle.textColor = COLOR_999;
        _labellSubTitle.font =  [UIFont systemFontOfSize:F(13) weight:UIFontWeightRegular];
        _labellSubTitle.numberOfLines = 1;
        _labellSubTitle.lineSpace = 0;
    }
    return _labellSubTitle;
}
- (UILabel *)labelStatus{
    if (_labelStatus == nil) {
        _labelStatus = [UILabel new];
        _labelStatus.textColor = COLOR_BLUE;
        _labelStatus.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightBold];
        _labelStatus.numberOfLines = 1;
        _labelStatus.lineSpace = 0;
    }
    return _labelStatus;
}

- (UIImageView *)icon0{
    if (_icon0 == nil) {
        _icon0 = [UIImageView new];
        _icon0.image = [UIImage imageNamed:@"orderCell_type"];
        _icon0.widthHeight = XY(W(25),W(25));
    }
    return _icon0;
}

- (UILabel *)label0{
    if (_label0 == nil) {
        _label0 = [UILabel new];
        _label0.textColor = COLOR_333;
        _label0.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        _label0.numberOfLines = 1;
        _label0.lineSpace = 0;
    }
    return _label0;
}

- (UIImageView *)icon1{
    if (_icon1 == nil) {
        _icon1 = [UIImageView new];
        _icon1.image = [UIImage imageNamed:@"orderCell_address"];
        _icon1.widthHeight = XY(W(25),W(25));
    }
    return _icon1;
}

- (UILabel *)label1{
    if (_label1 == nil) {
        _label1 = [UILabel new];
        _label1.textColor = COLOR_333;
        _label1.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        _label1.numberOfLines = 1;
        _label1.lineSpace = 0;
    }
    return _label1;
}

- (UIImageView *)icon2{
    if (_icon2 == nil) {
        _icon2 = [UIImageView new];
        _icon2.image = [UIImage imageNamed:@"orderCell_time"];
        _icon2.widthHeight = XY(W(25),W(25));
    }
    return _icon2;
}

- (UILabel *)label2{
    if (_label2 == nil) {
        _label2 = [UILabel new];
        _label2.textColor = COLOR_333;
        _label2.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        _label2.numberOfLines = 1;
        _label2.lineSpace = 0;
    }
    return _label2;
}

- (UIImageView *)icon3{
    if (_icon3 == nil) {
        _icon3 = [UIImageView new];
        _icon3.image = [UIImage imageNamed:@"orderCell_time"];
        _icon3.widthHeight = XY(W(25),W(25));
    }
    return _icon3;
}

- (UILabel *)label3{
    if (_label3 == nil) {
        _label3 = [UILabel new];
        _label3.textColor = COLOR_333;
        _label3.font =  [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        _label3.numberOfLines = 1;
        _label3.lineSpace = 0;
    }
    return _label3;
}

- (UIImageView *)ivBg{
    if (_ivBg == nil) {
        _ivBg = [UIImageView new];
        _ivBg.image = IMAGE_WHITE_BG;
        _ivBg.backgroundColor = [UIColor clearColor];
    }
    return _ivBg;
}
- (UIView *)viewBG{
    if (!_viewBG) {
        _viewBG = [UIView new];
        _viewBG.backgroundColor = [UIColor clearColor];
        _viewBG.width = SCREEN_WIDTH;
    }
    return _viewBG;
}

#pragma mark 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = COLOR_BACKGROUND;
        self.backgroundColor = COLOR_BACKGROUND;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.clipsToBounds = false;
        self.contentView.clipsToBounds = false;
        [self.contentView addSubview:self.ivBg];
        [self.contentView addSubview:self.viewBG];
        [self.viewBG addSubview:self.colorLine];
        [self.viewBG addSubview:self.labelMainTitle];
        [self.viewBG addSubview:self.labellSubTitle];
        [self.viewBG addSubview:self.labelStatus];
        [self.viewBG addSubview:self.icon0];
        [self.viewBG addSubview:self.label0];
        [self.viewBG addSubview:self.icon1];
        [self.viewBG addSubview:self.label1];
        [self.viewBG addSubview:self.icon2];
        [self.viewBG addSubview:self.label2];
//        [self.viewBG addSubview:self.icon3];
//        [self.viewBG addSubview:self.label3];
        
    }
    return self;
}
#pragma mark 刷新cell
- (void)resetCellWithModel:(ModelAuditCompany *)model{
    
    self.model = model;
    [self.viewBG removeSubViewWithTag:TAG_LINE];//移除线
    //刷新view
    
    [self.labelStatus fitTitle:model.stateShow variable:0];
    self.labelStatus.textColor = model.stateColorShow;
    self.labelStatus.rightTop = XY(self.viewBG.width - W(25),W(36));
    
    self.colorLine.left = W(25);
    self.colorLine.backgroundColor = model.stateColorShow;
    
    [self.labelMainTitle fitTitle:[NSString stringWithFormat:@"%@",UnPackStr(model.name)] fixed:self.labelStatus.left - W(30) - self.colorLine.right];
    self.labelMainTitle.leftCenterY = XY(self.colorLine.right + W(20),self.labelStatus.centerY);
    
    [self.labellSubTitle fitTitle:UnPackStr(model.businessLicense) fixed:self.viewBG.width - W(30)- self.colorLine.right];
    self.labellSubTitle.leftTop = XY(self.labelMainTitle.left,self.labelMainTitle.bottom + W(13));
    
    
    self.colorLine.centerY = self.labelMainTitle.bottom + W(13)/2.0;
    
    CGFloat bottom =  [self.viewBG addLineFrame:CGRectMake(W(25), self.labellSubTitle.bottom + W(20), self.viewBG.width - W(50), 1)];
    
    self.icon0.leftTop = XY(W(25),bottom+W(14));
    [self.label0 fitTitle:UnPackStr(model.typeShow) variable:self.viewBG.width - self.icon0.right - W(40)];
    self.label0.leftCenterY = XY(self.icon0.right + W(11),self.icon0.centerY);
    
    
    self.icon1.leftTop = XY(self.icon0.left,self.icon0.bottom + W(10));
    [self.label1 fitTitle:model.addressShow variable:self.viewBG.width - self.icon1.right - W(40)];
    self.label1.leftCenterY = XY(self.icon1.right + W(11),self.icon1.centerY);
    
    self.icon2.leftTop = XY(self.icon1.left,self.icon1.bottom + W(10));
    [self.label2 fitTitle:UnPackStr(model.timeShow) variable:self.viewBG.width - self.icon2.right - W(40)];
    self.label2.leftCenterY = XY(self.icon2.right + W(11),self.icon2.centerY);
    
    
    self.viewBG.height = self.icon2.bottom +W(16);
    self.ivBg.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.viewBG.height+W(10));
    //设置总高度
    self.height = self.viewBG.bottom;
    
}

@end
