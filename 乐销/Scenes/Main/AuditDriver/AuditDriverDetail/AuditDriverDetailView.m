//
//  AuditDriverDetailView.m
//  Motorcade
//
//  Created by 隋林栋 on 2019/12/3.
//Copyright © 2019 ping. All rights reserved.
//

#import "AuditDriverDetailView.h"

//dao
#import "AuditDao.h"

@implementation AuditDriverDetailView

#pragma mark 刷新view
- (void)resetViewWithModel:(ModelAuditDriver *)modelDriver{
    [self removeAllSubViews];//移除线
    //重置视图坐标
    CGFloat bottom =  [AuditDao addDetailSubView:@[^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"司机ID";
        model.subTitle = strDotF(modelDriver.iDProperty);
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"提交时间";
        model.subTitle = UnPackStr(modelDriver.timeShow);
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"真实姓名";
        model.subTitle = UnPackStr(modelDriver.realName);
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"驾驶证号";
        model.subTitle = UnPackStr(modelDriver.idNumber);
        return model;
    }()] inView:self title:@"基本信息"];
    //设置总高度
    self.height = [self addLineFrame:CGRectMake(W(15), bottom, SCREEN_WIDTH - W(30), 1)];
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
@end




