//
//  AuditDao.m
//  Platform
//
//  Created by 隋林栋 on 2019/12/27.
//Copyright © 2019 ping. All rights reserved.
//

#import "AuditDao.h"
//image
#import "ImageDetailBigView.h"

@implementation AuditDao

#pragma mark =======Code Here
+ (CGFloat)addDetailSubView:(NSArray *)aryBtns inView:(UIView *)viewSuper title:(NSString *)title{
    UIView * viewGray = [UIView new];
    viewGray.frame = CGRectMake(0, 0, SCREEN_WIDTH, W(44));
    viewGray.backgroundColor = [UIColor colorWithHexString:@"#F3F4F8"];
    [viewSuper addSubview:viewGray];
    
    UILabel * labelTitle = [UILabel new];
    labelTitle.font = [UIFont systemFontOfSize:F(14) weight:UIFontWeightMedium];
    labelTitle.textColor = COLOR_666;
    labelTitle.numberOfLines = 1;
    [labelTitle fitTitle:UnPackStr(title) variable:SCREEN_WIDTH - W(30)];
    labelTitle.leftCenterY = XY(W(15), viewGray.height/2.0);
    [viewSuper addSubview:labelTitle];
    CGFloat bottom = viewGray.bottom + W(25);
    
    for (ModelBtn * model in aryBtns) {
        if (model.isHide) {
           bottom = [viewSuper addLineFrame:CGRectMake(W(15), bottom, SCREEN_WIDTH - W(30), 1)]+ W(20);
            continue;
        }
        UILabel * labelTitle = [UILabel new];
        labelTitle.font = [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        labelTitle.textColor = COLOR_666;
        labelTitle.numberOfLines = 1;
        [labelTitle fitTitle:UnPackStr(model.title) variable:SCREEN_WIDTH/2.0 - W(60)];
        labelTitle.leftTop = XY(W(15), bottom);
        [viewSuper addSubview:labelTitle];
        
        UILabel * labelSubTitle = [UILabel new];
        labelSubTitle.font = [UIFont systemFontOfSize:F(15) weight:UIFontWeightRegular];
        labelSubTitle.textColor = model.color?model.color:COLOR_666;
        labelSubTitle.numberOfLines = 0;
        labelSubTitle.textAlignment = NSTextAlignmentRight;
        [labelSubTitle fitTitle:UnPackStr(model.subTitle) variable:SCREEN_WIDTH/2.0 + W(25)];
        labelSubTitle.rightTop = XY(SCREEN_WIDTH - W(15), labelTitle.top);
        [viewSuper addSubview:labelSubTitle];
        
        bottom = MAX(labelTitle.bottom , labelSubTitle.bottom)+ W(20);
    }
    return bottom+ W(5);
}

@end



@implementation AuditDetailImageView

#pragma mark 刷新view
- (void)resetViewWithAryModels:(NSArray *)aryImages{
    self.aryImages = aryImages;
    [self removeAllSubViews];//移除线
    CGFloat left= W(15);
    CGFloat y = W(25);
    CGFloat bottom = 0;
    //重置视图坐标
    for (int i = 0; i<aryImages.count; i++) {
        ModelImage *model = aryImages[i];
        UIImageView * iv = [[UIImageView alloc]initWithFrame:CGRectMake(left, y, W(78), W(65))];
        [iv sd_setImageWithURL:[NSURL URLWithString:model.url] placeholderImage:model.image];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.tag = i;
        iv.userInteractionEnabled = true;
        [iv addTarget:self action:@selector(imageClick:)];
        [self addSubview:iv];
        left = iv.right +W(11);
        [GlobalMethod setRoundView:iv color:[UIColor clearColor] numRound:5 width:0];
        bottom = iv.bottom + W(25);
        if ((i+1)%4==0) {
            left = W(15);
            y = iv.bottom + W(11);
        }
    }
    self.height = bottom;
}

#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];//背景色
        self.width = SCREEN_WIDTH;//默认宽度
    }
    return self;
}

#pragma mark click
- (void)imageClick:(UITapGestureRecognizer *)tap{
    UIImageView * view = (UIImageView *)tap.view;
    if (![view isKindOfClass:UIImageView.class]) {
        return;
    }
    ImageDetailBigView * detailView = [ImageDetailBigView new];
    [detailView resetView:self.aryImages.mutableCopy isEdit:false index: view.tag];
    [detailView showInView:[GB_Nav.lastVC view] imageViewShow:view];
}


@end



@implementation AuditDetailBottomView
#pragma mark 懒加载
-(UIButton *)btnReject{
    if (_btnReject == nil) {
        _btnReject = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnReject.tag = 2;
        [_btnReject addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _btnReject.backgroundColor = [UIColor clearColor];
        _btnReject.titleLabel.font = [UIFont systemFontOfSize:F(15)];
        [_btnReject setTitleColor:COLOR_RED forState:UIControlStateNormal];
        _btnReject.widthHeight = XY(W(165),W(40));
        [GlobalMethod setRoundView:_btnReject color:COLOR_RED numRound:_btnReject.height/2.0 width:1];
        [_btnReject setTitle:@"拒绝" forState:(UIControlStateNormal)];
    }
    return _btnReject;
}
-(UIButton *)btnAgree{
    if (_btnAgree == nil) {
        _btnAgree = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnAgree.tag = 3;
        [_btnAgree addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _btnAgree.backgroundColor = [UIColor clearColor];
        _btnAgree.titleLabel.font = [UIFont systemFontOfSize:F(15)];
        [_btnAgree setTitleColor:COLOR_BLUE forState:UIControlStateNormal];
        _btnAgree.widthHeight = XY(W(165),W(40));
        [GlobalMethod setRoundView:_btnAgree color:COLOR_BLUE numRound:_btnAgree.height/2.0 width:1];
        [_btnAgree setTitle:@"同意" forState:(UIControlStateNormal)];
    }
    return _btnAgree;
}

#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.width = SCREEN_WIDTH;
        [self addSubView];
    }
    return self;
}
//添加subview
- (void)addSubView{
    [self addSubview:self.btnReject];
    [self addSubview:self.btnAgree];
    
    //初始化页面
    [self resetViewWithModel:nil];
}

#pragma mark 刷新view
- (void)resetViewWithModel:()model{
    [self removeSubViewWithTag:TAG_LINE];//移除线
    //刷新view
    self.btnReject.leftTop = XY(W(15),0);
    self.btnAgree.rightTop = XY(SCREEN_WIDTH - W(15),0);
    
    //设置总高度
    self.height = self.btnAgree.bottom + W(15)+iphoneXBottomInterval;
}
#pragma mark 点击事件
- (void)btnClick:(UIButton *)sender{
    switch (sender.tag) {
            
        case 2://拒绝
        {
            if (self.blockReject) {
                self.blockReject();
            }
        }
            break;
        case 3://同意
        {
            if (self.blockAgree) {
                self.blockAgree();
            }
        }
            break;
        default:
            break;
    }
}

@end


@implementation AuditDetailRecordView

#pragma mark 刷新view
- (void)resetViewWithAuditCarAryModels:(NSArray *)aryDatas{
    [self removeAllSubViews];//移除线
    //重置视图坐标
    NSMutableArray * aryMu = [NSMutableArray new];
    for (ModelAuditCarRecordItem * item in aryDatas) {
        
        if (item.submitTime) {
            [aryMu addObject:^(){
                ModelBtn * modelBase = [ModelBtn new];
                modelBase.title = @"提交时间";
                modelBase.subTitle = [GlobalMethod exchangeTimeWithStamp:item.submitTime andFormatter:TIME_SEC_SHOW];
                return modelBase;
            }()];
        }
        if (item.reviewTime&&(item.state!=2)) {
            [aryMu addObject:^(){
                ModelBtn * modelBase = [ModelBtn new];
                modelBase.title = @"审核时间";
                modelBase.subTitle = [GlobalMethod exchangeTimeWithStamp:item.reviewTime andFormatter:TIME_SEC_SHOW];
                return modelBase;
            }()];
        }
        [aryMu addObject:^(){
            ModelBtn * modelBase = [ModelBtn new];
            modelBase.title = @"审核状态";
            modelBase.subTitle = [self fetchAuditState:item.state];
            return modelBase;
        }()];
        if (item.state == 10) {
            [aryMu addObject:^(){
                ModelBtn * modelBase = [ModelBtn new];
                modelBase.title = @"审核意见";
                modelBase.subTitle = item.iDPropertyDescription;
                return modelBase;
            }()];
        }
        if (![aryDatas.lastObject isEqual:item]) {
            [aryMu addObject:^(){
                ModelBtn * modelBase = [ModelBtn new];
                modelBase.isHide = true;
                return modelBase;
            }()];
        }
    }
    CGFloat bottom =  [AuditDao addDetailSubView:aryMu inView:self title:@"审核记录"];
    //设置总高度
    self.height = bottom;
}

- (void)resetViewWithAuditDriverAryModels:(NSArray *)aryDatas{
    [self removeAllSubViews];//移除线
    //重置视图坐标
    NSMutableArray * aryMu = [NSMutableArray new];
    for (ModelAuditDriverRecordItem * item in aryDatas) {
        
        if (item.submitTime) {
            [aryMu addObject:^(){
                ModelBtn * modelBase = [ModelBtn new];
                modelBase.title = @"提交时间";
                modelBase.subTitle = [GlobalMethod exchangeTimeWithStamp:item.submitTime andFormatter:TIME_SEC_SHOW];
                return modelBase;
            }()];
        }
        if (item.reviewTime &&(item.status!=2)) {
            [aryMu addObject:^(){
                ModelBtn * modelBase = [ModelBtn new];
                modelBase.title = @"审核时间";
                modelBase.subTitle = [GlobalMethod exchangeTimeWithStamp:item.reviewTime andFormatter:TIME_SEC_SHOW];
                return modelBase;
            }()];
        }
        [aryMu addObject:^(){
            ModelBtn * modelBase = [ModelBtn new];
            modelBase.title = @"审核状态";
            modelBase.subTitle = [self fetchAuditState:item.status];
            return modelBase;
        }()];
        if (item.status == 10) {
            [aryMu addObject:^(){
                ModelBtn * modelBase = [ModelBtn new];
                modelBase.title = @"审核意见";
                modelBase.subTitle = item.explain;
                return modelBase;
            }()];
        }
        if (![aryDatas.lastObject isEqual:item]) {
            [aryMu addObject:^(){
                ModelBtn * modelBase = [ModelBtn new];
                modelBase.isHide = true;
                return modelBase;
            }()];
        }
    }
    CGFloat bottom =  [AuditDao addDetailSubView:aryMu inView:self title:@"审核记录"];
    //设置总高度
    self.height = bottom;
}

#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];//背景色
        self.width = SCREEN_WIDTH;//默认宽度
    }
    return self;
}
- (NSString *)fetchAuditState:(int)state{
    switch (state) {
        case 2:
            return @"待审核";
            break;
        case 3:
            return @"审核通过";
            break;
        case 10:
            return  @"审核未通过";
            break;
    }
    return @"";
}
@end
