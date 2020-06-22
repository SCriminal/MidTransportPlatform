//
//  AuditCarDetailVC.m
//  Motorcade
//
//  Created by 隋林栋 on 2019/12/3.
//Copyright © 2019 ping. All rights reserved.
//

#import "AuditCarDetailVC.h"
//detail view
#import "AuditCarDetailView.h"
//cancel view
#import "CancelAttachView.h"
//request
#import "RequestApi+Company.h"
//audit dao
#import "AuditDao.h"


@interface AuditCarDetailVC ()
@property (nonatomic, strong) AuditCarDetailView  *topView;
@property (nonatomic, strong) AuditDetailImageView *bottomView;
@property (nonatomic, strong) AuditDetailBottomView *btnView;
@property (nonatomic, strong) AuditDetailRecordView *recordView;

@end

@implementation AuditCarDetailVC

- (AuditDetailBottomView *)btnView{
    if (!_btnView) {
        _btnView = [AuditDetailBottomView new];
        _btnView.bottom  = SCREEN_HEIGHT;
        WEAKSELF
        _btnView.blockAgree = ^{
            [weakSelf admitClick];
        };
        _btnView.blockReject = ^{
            [weakSelf rejectClick];
        };
    }
    return _btnView;
}
- (AuditCarDetailView *)topView{
    if (!_topView) {
        _topView = [AuditCarDetailView new];
    }
    return _topView;
}
- (AuditDetailImageView *)bottomView{
    if (!_bottomView) {
        _bottomView = [AuditDetailImageView new];
    }
    return _bottomView;
}
#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加导航栏
    [self addNav];
    [self.topView resetViewWithModel:self.modelCar];
    self.tableView.tableHeaderView = self.topView;
    
    if (self.modelCar.qualificationState==2) {
        [self.view addSubview:self.btnView];
    }
    self.tableView.height = SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT - (self.modelCar.qualificationState==2?self.btnView.height:0);
    //request
    [self requestInfo];
}

#pragma mark 添加导航栏
- (void)addNav{
    [self.view addSubview:[BaseNavView initNavBackTitle:@"审核详情" rightView:nil]];
}

#pragma mark request
- (void)requestInfo{
    [RequestApi requestAuditCarDetailWithID:self.modelCar.iDProperty entId:self.modelCar.entId delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        ModelAuditCar * modelDetail = [ModelAuditCar modelObjectWithDictionary:response];
        [self.bottomView resetViewWithAryModels:@[^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"行驶证主页";
            model.url = modelDetail.drivingLicenseFrontUrl;
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            
            
            return model;
        }(),^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"行驶证副页";
            
            model.url = modelDetail.drivingLicenseNegativeUrl;
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            
            return model;
        }(),^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"车辆交强险保单";
            model.url = modelDetail.vehicleInsuranceUrl;
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            
            
            return model;
        }(),^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"行驶证检验页";
            model.url = modelDetail.driving2NegativeUrl;
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            return model;
        }(),^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"车辆三者险保单";
            model.url = modelDetail.vehicleTripartiteInsuranceUrl;
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            
            return model;
        }(),^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"挂车交强险保单";
            model.url = modelDetail.trailerInsuranceUrl;
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            
            return model;
        }(),^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"挂车三者险保单";
            model.url = modelDetail.trailerTripartiteInsuranceUrl;
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            
            return model;
        }(),^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"挂车箱货险保单";
            model.url = modelDetail.trailerGoodsInsuranceUrl;
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            
            return model;
        }(),^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"行驶证机动车相片页";
            model.url = modelDetail.vehiclePhotoUrl;
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            
            return model;
        }(),^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"道路运输许可证";
            model.url = modelDetail.managementLicenseUrl;
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            
            return model;
        }()]];
//        self.tableView.tableFooterView = self.bottomView;
        [self requestRecordList];
    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
}
- (void)requestRecordList{
    [RequestApi requestAuditCarRecordWithID:self.modelCar.iDProperty delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        NSMutableArray * aryList = [GlobalMethod exchangeDic:response toAryWithModelName:@"ModelAuditCarRecordItem"];
        self.recordView = [AuditDetailRecordView new];
        [self.recordView resetViewWithAuditCarAryModels:aryList];
        self.tableView.tableFooterViews = @[self.bottomView,self.recordView];
    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
}

- (void)rejectClick{
    WEAKSELF
    CancelAttachView * cancelView = [CancelAttachView new];
    [cancelView resetViewWithModel:^(){
        ModelBaseData * modelData = [ModelBaseData new];
        modelData.placeHolderString = @"请输入不通过的原因";
        modelData.string = @"提示";
        return modelData;
    }()];
    cancelView.blockComplete = ^(NSString *reason) {
        [weakSelf requestReject:reason];
    };
    [cancelView show];
}
- (void)admitClick{
    WEAKSELF
    ModelBtn * modelDismiss = [ModelBtn modelWithTitle:@"取消" imageName:nil highImageName:nil tag:TAG_LINE color:COLOR_333];
    ModelBtn * modelConfirm = [ModelBtn modelWithTitle:@"确定" imageName:nil highImageName:nil tag:TAG_LINE color:COLOR_BLUE];
    modelConfirm.blockClick = ^(void){
        [weakSelf requestAgree];
    };
    NSString * strAuditTitle = [NSString stringWithFormat:@"企业名称:%@\n车牌号码:%@",UnPackStr(self.modelCar.entName),UnPackStr(self.modelCar.vehicleNumber)];
    [BaseAlertView initWithTitle:@"确认审核通过" content:strAuditTitle aryBtnModels:@[modelDismiss,modelConfirm] viewShow:[UIApplication sharedApplication].keyWindow];
}


- (void)requestAgree{
    [RequestApi requestAuditCarWithID:self.modelCar.iDProperty entId:self.modelCar.entId type:3 description:@"" delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        [[NSNotificationCenter defaultCenter]postNotificationName:NOTICE_AUDIT_CAR object:nil];
        [GB_Nav popViewControllerAnimated:true];
    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];

}
- (void)requestReject:(NSString *)reason{
    [RequestApi requestAuditCarWithID:self.modelCar.iDProperty entId:self.modelCar.entId type:10 description:reason delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        [[NSNotificationCenter defaultCenter]postNotificationName:NOTICE_AUDIT_CAR object:nil];
        [GB_Nav popViewControllerAnimated:true];
    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
}

@end
