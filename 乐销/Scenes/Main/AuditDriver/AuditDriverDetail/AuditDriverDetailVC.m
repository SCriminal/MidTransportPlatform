//
//  AuditDriverDetailVC.m
//  Motorcade
//
//  Created by 隋林栋 on 2019/12/3.
//Copyright © 2019 ping. All rights reserved.
//

#import "AuditDriverDetailVC.h"
//detail view
#import "AuditDriverDetailView.h"
//cancel view
#import "CancelAttachView.h"
//request
#import "RequestApi+Company.h"
//audit dao
#import "AuditDao.h"
//confirm view
#import "AuditDriverConfirmView.h"

@interface AuditDriverDetailVC ()
@property (nonatomic, strong) AuditDriverDetailView  *topView;
@property (nonatomic, strong) AuditDetailImageView *bottomView;
@property (nonatomic, strong) AuditDetailBottomView *btnView;
@property (nonatomic, strong) AuditDetailRecordView *recordView;
@property (nonatomic, strong) AuditDriverConfirmView *confirmView;

@end

@implementation AuditDriverDetailVC

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
- (AuditDriverConfirmView *)confirmView{
    if (!_confirmView) {
        _confirmView = [AuditDriverConfirmView new];
        [_confirmView resetViewWithName:self.modelDriver.realName number:self.modelDriver.idNumber];
        WEAKSELF
        _confirmView.blockComplete = ^(NSString *name, NSString *identity) {
            [weakSelf requestAgree:name number:identity];
        };
    }
    return _confirmView;
}
- (AuditDriverDetailView *)topView{
    if (!_topView) {
        _topView = [AuditDriverDetailView new];
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
    [self.topView resetViewWithModel:self.modelDriver];
    self.tableView.tableHeaderView = self.topView;
    
    if (self.modelDriver.reviewStatus==2) {
        [self.view addSubview:self.btnView];
    }
    self.tableView.height = SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT - (self.modelDriver.reviewStatus==2?self.btnView.height:0);
    //request
    [self requestInfo];
}

#pragma mark 添加导航栏
- (void)addNav{
    [self.view addSubview:[BaseNavView initNavBackTitle:@"审核详情" rightView:nil]];
}

#pragma mark request
- (void)requestInfo{
    [RequestApi requestAuditDriverInfo:self.modelDriver.iDProperty delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        [self.bottomView resetViewWithAryModels:@[^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"身份证人像面";
            model.url = [response stringValueForKey:@"idCardFrontUrl"];
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            return model;
        }(),^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"身份证国徽面";
            model.url = [response stringValueForKey:@"idCardBackUrl"];
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            return model;
        }(),^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"手持身份证人像面";
            model.url = [response stringValueForKey:@"idCardHandelUrl"];
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            return model;
        }(),^(){
            ModelImage * model = [ModelImage new];
            model.desc = @"驾驶证";
            model.url = [response stringValueForKey:@"driverLicenseUrl"];
            model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
            return model;
        }()]];

        NSMutableArray * aryList = [GlobalMethod exchangeDic:[response arrayValueForKey:@"qualificationList"] toAryWithModelName:@"ModelAuditDriverRecordItem"];
        self.recordView = [AuditDetailRecordView new];
        [self.recordView resetViewWithAuditDriverAryModels:aryList];
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
    if (isStr(self.modelDriver.realName)&&isStr(self.modelDriver.idNumber)) {
        WEAKSELF
        ModelBtn * modelDismiss = [ModelBtn modelWithTitle:@"取消" imageName:nil highImageName:nil tag:TAG_LINE color:COLOR_333];
        ModelBtn * modelConfirm = [ModelBtn modelWithTitle:@"确定" imageName:nil highImageName:nil tag:TAG_LINE color:COLOR_BLUE];
        modelConfirm.blockClick = ^(void){
            [weakSelf requestAgree:weakSelf.modelDriver.realName number:weakSelf.modelDriver.idNumber];
        };
        NSString * strAuditTitle = [NSString stringWithFormat:@"司机姓名:%@\n驾驶证号:%@",UnPackStr(self.modelDriver.realName),UnPackStr(self.modelDriver.idNumber)];
        [BaseAlertView initWithTitle:@"确认审核通过" content:strAuditTitle aryBtnModels:@[modelDismiss,modelConfirm] viewShow:[UIApplication sharedApplication].keyWindow];

    }else{
        [self.confirmView show];
    }
}


- (void)requestAgree:(NSString *)name number:(NSString *)number{
    [RequestApi requestAuditDriverWithID:self.modelDriver.iDProperty reviewStatus:1 realname:name idNumber:number remark:@"" delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
                [[NSNotificationCenter defaultCenter]postNotificationName:NOTICE_AUDIT_DRIVER object:nil];
                [GB_Nav popViewControllerAnimated:true];

    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
}
- (void)requestReject:(NSString *)reason{
    [RequestApi requestAuditDriverWithID:self.modelDriver.iDProperty reviewStatus:0 realname:self.modelDriver.realName idNumber:self.modelDriver.idNumber remark:reason delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        [[NSNotificationCenter defaultCenter]postNotificationName:NOTICE_AUDIT_DRIVER object:nil];
        [GB_Nav popViewControllerAnimated:true];

    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
}

@end
