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
        model.title = @"关联司机";
        
        model.subTitle =isStr(modelCar.driverName)||isStr(modelCar.driverPhone)? [NSString stringWithFormat:@"%@ %@",modelCar.driverName,modelCar.driverPhone]:@"暂无关联司机";
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"核定载质量";
        model.subTitle = modelCar.vehicleLoad?[strDotF(modelCar.vehicleLoad) stringByAppendingString:@"吨"]:@"暂无";
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"车拥有人";
        model.subTitle = modelCar.vehicleOwner;
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"车辆类型";
        model.subTitle = modelCar.carTypeShow;
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"牌照类型";
        model.subTitle = [AuditCarDetailView exchangeLicenseType:strDotF(modelCar.licenceType)];
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"档案编号";
        model.subTitle = modelCar.drivingNumber;
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"运输证号";
        model.subTitle = modelCar.roadTransportNumber;
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"总质量";
        model.subTitle = modelCar.grossMass?[NSNumber.dou(modelCar.grossMass).stringValue stringByAppendingString:@"kg"]:@"暂无";
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"车辆长度";
        NSString * strLength = modelCar.length?[NSNumber.dou(modelCar.length).stringValue stringByAppendingString:@"mm "]:@"";
        NSString * strWidth = modelCar.weight?[NSNumber.dou(modelCar.weight).stringValue stringByAppendingString:@"mm "]:@"";
        NSString * strHeight = modelCar.height?[NSNumber.dou(modelCar.height).stringValue stringByAppendingString:@"mm"]:@"";
        
        NSString * strAll = [NSString stringWithFormat:@"%@%@%@",strLength,strWidth,strHeight];
        model.subTitle = (modelCar.length==0&&modelCar.weight==0&&modelCar.height==0)?@"暂无":strAll;
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"车轴数";
        model.subTitle = modelCar.axle?NSNumber.dou(modelCar.axle).stringValue:@"暂无";
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"识别代码";
        model.subTitle = modelCar.vin;
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"发动机号";
        model.subTitle = modelCar.engineNumber;
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"品牌型号";
        model.subTitle = modelCar.model;
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"使用性质";
        model.subTitle = modelCar.useCharacter;
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"能源类型";
        model.subTitle = [AuditCarDetailView exchangeEnergeyType:strDotF(modelCar.energyType)];
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"挂车号码";
        model.subTitle = modelCar.trailerNumber;
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"发证机关";
        model.subTitle = modelCar.drivingAgency;
        
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"注册日期";
        model.subTitle = [GlobalMethod exchangeTimeWithStamp:modelCar.drivingRegisterDate andFormatter:TIME_DAY_SHOW];
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"发证日期";
        model.subTitle = [GlobalMethod exchangeTimeWithStamp:modelCar.drivingIssueDate andFormatter:TIME_DAY_SHOW];
        return model;
    }(),^(){
        ModelBtn * model = [ModelBtn new];
        model.title = @"有效日期";
        model.subTitle = [GlobalMethod exchangeTimeWithStamp:modelCar.drivingEndDate andFormatter:TIME_DAY_SHOW];
        return model;
    }()] inView:self title:@"基本信息"];
    //设置总高度
    self.height = [self addLineFrame:CGRectMake(W(15), bottom, SCREEN_WIDTH - W(30), 1)];
}

+ (NSString *)exchangeLicenseType:(NSString *)identity{
    NSString * strPath = [[NSBundle mainBundle]pathForResource:@"LicenseType" ofType:@"json"];
    NSArray * ary = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:strPath] options:0 error:nil];
    for (NSDictionary * dic in ary) {
        if (identity.doubleValue == [dic doubleValueForKey:@"value"]) {
            return [dic stringValueForKey:@"label"];
        }
    }
    return nil;
}
+ (NSString *)exchangeEnergeyType:(NSString *)identity{
    NSString * strPath = [[NSBundle mainBundle]pathForResource:@"EnergyType" ofType:@"json"];
    NSArray * ary = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:strPath] options:0 error:nil];
    for (NSDictionary * dic in ary) {
        if (identity.doubleValue == [dic doubleValueForKey:@"value"]) {
            return [dic stringValueForKey:@"label"];
        }
    }
    return nil;
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




