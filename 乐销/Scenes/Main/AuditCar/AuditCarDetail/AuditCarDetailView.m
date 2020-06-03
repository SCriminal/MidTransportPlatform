//
//  AuditCarDetailView.m
//  Motorcade
//
//  Created by 隋林栋 on 2019/12/3.
//Copyright © 2019 ping. All rights reserved.
//

#import "AuditCarDetailView.h"

//dao
#import "AuditDao.h"

@implementation AuditCarDetailView

#pragma mark 刷新view
- (void)resetViewWithModel:(ModelAuditCar *)modelCar{
    [self removeAllSubViews];//移除线
    //重置视图坐标
    
    CGFloat bottom =  [AuditDao addDetailSubView:@[^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"车牌号码";
        model.subTitle = UnPackStr(modelCar.vehicleNumber);
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"企业名称";
        model.subTitle = UnPackStr(modelCar.entName);
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"提交时间";
        model.subTitle = modelCar.timeShow;
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"车辆所有人";
        model.subTitle = UnPackStr(modelCar.vehicleOwner);
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"车辆类型";
        model.subTitle = UnPackStr(modelCar.carTypeShow);
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"标准载重";
        model.subTitle = [NSString stringWithFormat:@"%@吨",NSNumber.dou(modelCar.vehicleLoad)];
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"车长";
        model.subTitle = modelCar.carLengthShow;
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"车轴数";
        model.subTitle = [NSString stringWithFormat:@"%@",NSNumber.dou(modelCar.axle)];;
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"挂车号码";
        model.subTitle = UnPackStr(modelCar.trailerNumber);
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"司机姓名";
        model.subTitle = UnPackStr(modelCar.driverName);
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"司机电话";
        model.subTitle = UnPackStr(modelCar.driverPhone);
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




