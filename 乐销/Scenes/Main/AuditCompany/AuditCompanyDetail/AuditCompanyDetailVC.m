//
//  AuditCompanyDetailVC.m
//  Motorcade
//
//  Created by 隋林栋 on 2019/12/3.
//Copyright © 2019 ping. All rights reserved.
//

#import "AuditCompanyDetailVC.h"
//detail view
#import "AuditCompanyDetailView.h"
//cancel view
#import "CancelAttachView.h"
//request
#import "RequestApi+Company.h"
//audit dao
#import "AuditDao.h"


@interface AuditCompanyDetailVC ()
@property (nonatomic, strong) AuditCompanyDetailView  *topView;
@property (nonatomic, strong) AuditDetailImageView *bottomView;
@property (nonatomic, strong) AuditDetailBottomView *btnView;
@property (nonatomic, strong) AuditDetailRecordView *recordView;

@end

@implementation AuditCompanyDetailVC

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
- (AuditCompanyDetailView *)topView{
    if (!_topView) {
        _topView = [AuditCompanyDetailView new];
    }
    return _topView;
}

#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加导航栏
    [self addNav];
    [self.topView resetViewWithModel:self.modelCompany];
    self.tableView.tableHeaderView = self.topView;
    
    if (self.modelCompany.qualificationState==2) {
        [self.view addSubview:self.btnView];
    }
    self.tableView.height = SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT - (self.modelCompany.qualificationState==2?self.btnView.height:0);
    //request
    [self requestInfo];
}

#pragma mark 添加导航栏
- (void)addNav{
    [self.view addSubview:[BaseNavView initNavBackTitle:@"审核详情" rightView:nil]];
}

#pragma mark request
- (void)requestInfo{
    [RequestApi requestAuditCompanyInfoWithEntId:self.modelCompany.iDProperty delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        self.bottomView = [AuditDetailImageView new];
        switch ((int)self.modelCompany.type) {
            case 11://@"托运人";
            case 31://@"运输公司"
            {
                [self.bottomView resetViewWithAryModels:@[^(){
                    ModelImage * model = [ModelImage new];
                    model.desc =@"营业执照";
                    model.url = [response stringValueForKey:@"businessLicenseUrl"];
                    model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
                    
                    return model;
                }() ,^(){
                    ModelImage * model = [ModelImage new];
                    model.desc =@"道路运输许可证";
                    model.url = [response stringValueForKey:@"managementLicenseUrl"];
                    model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
                    
                    return model;
                }(),^(){
                    ModelImage * model = [ModelImage new];
                    model.desc =@"法人身份证人像面";
                    model.url = [response stringValueForKey:@"idCardFrontUrl"];
                    model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
                    return model;
                }(),^(){
                    ModelImage * model = [ModelImage new];
                    model.desc =@"法人身份证国徽面";
                    model.url = [response stringValueForKey:@"idCardNegativeUrl"];
                    model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
                    return model;
                }(),^(){
                    ModelImage * model = [ModelImage new];
                    model.desc =@"企业LOGO";
                    model.url = self.modelCompany.logoUrl;
                    model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
                    return model;
                }()]];
            }
                break;
            case 32://@"个体车主"
                {
                    [self.bottomView resetViewWithAryModels:@[^(){
                        ModelImage * model = [ModelImage new];
                        model.desc = @"身份证人像面";
                        model.url = [response stringValueForKey:@"idCardFrontUrl"];
                        model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
                        return model;
                    }(),^(){
                        ModelImage * model = [ModelImage new];
                        model.desc = @"身份证国徽面";
                        model.url = [response stringValueForKey:@"idCardNegativeUrl"];
                        model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
                        return model;
                    }(),^(){
                        ModelImage * model = [ModelImage new];
                        model.desc = @"手持身份证人像面";
                        model.url = [response stringValueForKey:@"idCardHandheldUrl"];
                        model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
                        return model;
                    }(),^(){
                        ModelImage * model = [ModelImage new];
                        model.desc = @"驾驶证";
                        model.url = [response stringValueForKey:@"driverLicenseUrl"];
                        model.image = [BaseImage imageWithImage:[UIImage imageNamed:IMAGE_BIG_DEFAULT] url:[NSURL URLWithString:model.url]];
                        return model;
                    }()]];
                }
                break;
                
            default:
                break;
        }
        [self requestRecordList];
    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];


}
- (void)requestRecordList{
    [RequestApi requestAuditCompanyRecordWithEntId:self.modelCompany.iDProperty delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        NSMutableArray * aryList = [GlobalMethod exchangeDic:response toAryWithModelName:@"ModelAuditCarRecordItem"];
        self.recordView = [AuditDetailRecordView new];
        [self.recordView resetViewWithAuditCarAryModels:aryList];
        [self requestAccountList];
    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];

}

- (void)requestAccountList{
    [RequestApi requestAuditCompanyAccountListWithEntId:self.modelCompany.iDProperty delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        NSMutableArray * aryList = [GlobalMethod exchangeDic:[response arrayValueForKey:@"list"] toAryWithModelName:@"ModelCompanyAccount"];
        if (isAry(aryList)) {
            AuditDetailAccountView * accountView = [AuditDetailAccountView new];
            [accountView resetViewWithAryModels:aryList];
            self.tableView.tableFooterViews = @[self.bottomView,self.recordView,accountView];
        }else{
            self.tableView.tableFooterViews = @[self.bottomView,self.recordView];
        }
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
    NSString * strAuditTitle = [NSString stringWithFormat:@"公司名称:%@\n信用代码:%@",UnPackStr(self.modelCompany.name),UnPackStr(self.modelCompany.businessLicense)];
    [BaseAlertView initWithTitle:@"确认审核通过" content:strAuditTitle aryBtnModels:@[modelDismiss,modelConfirm] viewShow:[UIApplication sharedApplication].keyWindow];
}


- (void)requestAgree{
    [RequestApi requestAuditCompanyWithID:self.modelCompany.iDProperty type:3 reason:@"" delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        [[NSNotificationCenter defaultCenter]postNotificationName:NOTICE_AUDIT_COMPANY object:nil];
        [GB_Nav popViewControllerAnimated:true];
    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
}
- (void)requestReject:(NSString *)reason{
    [RequestApi requestAuditCompanyWithID:self.modelCompany.iDProperty type:10 reason:reason delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        [[NSNotificationCenter defaultCenter]postNotificationName:NOTICE_AUDIT_COMPANY object:nil];
        [GB_Nav popViewControllerAnimated:true];
    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
}

@end
