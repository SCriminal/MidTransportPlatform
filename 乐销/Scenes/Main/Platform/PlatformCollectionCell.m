//
//  InfoCollectionInfoCell.m
//  乐销
//
//  Created by 隋林栋 on 2018/2/12.
//  Copyright © 2018年 ping. All rights reserved.
//

#import "PlatformCollectionCell.h"
#import "UIImage+info.h"

@implementation PlatformCollectionCell
#pragma mark 懒加载
- (UIImageView *)iconImg{
    if (_iconImg == nil) {
        _iconImg = [UIImageView new];
        _iconImg.widthHeight = XY(W(65),W(65));
//        _iconImg.layer.cornerRadius = _iconImg.width/2;
//        _iconImg.layer.masksToBounds = YES;
    }
    return _iconImg;
}
- (UILabel *)labelTitle{
    if (_labelTitle == nil) {
        _labelTitle = [UILabel new];
        _labelTitle.textColor = COLOR_333;
        _labelTitle.fontNum = F(12);
        _labelTitle.numberOfLines = 0;
        _labelTitle.lineSpace = 0;
    }
    return _labelTitle;
}

- (UILabel *)labelCount{
    if (_labelCount == nil) {
        _labelCount = [UILabel new];
        _labelCount.textColor = [UIColor redColor];
        _labelCount.fontNum = F(13);
        _labelCount.numberOfLines = 0;
        _labelCount.lineSpace = 0;
    }
    return _labelCount;
}

//添加subview
- (void)addSubView{
    [self addSubview:self.iconImg];
    [self addSubview:self.labelTitle];
    [self addSubview:self.labelCount];
}


#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubView];
    }
    return self;
}

#pragma mark 刷新view
- (void)resetViewWithModel:(ModelBtn *)model {
    self.model = model;
    [self removeSubViewWithTag:TAG_LINE];//移除线
    self.width = SCREEN_WIDTH/3.0 - W(1);
    //刷新view
    self.iconImg.image = [UIImage imageNamed:UnPackStr(model.imageName)];
    self.iconImg.centerXTop = XY(self.width/2,W(40));
    
    [self.labelTitle fitTitle:UnPackStr(model.title) variable:0];
    self.labelTitle.centerXTop = XY(self.iconImg.centerX,self.iconImg.bottom+W(8.5));
    
    [GlobalMethod exchangeLabel:self.labelCount positiveCount:0];
    self.labelCount.leftTop = XY(self.iconImg.right+W(15),self.iconImg.top);
    
    //设置总高度
    self.height = self.labelTitle.bottom+W(10);
}


@end

