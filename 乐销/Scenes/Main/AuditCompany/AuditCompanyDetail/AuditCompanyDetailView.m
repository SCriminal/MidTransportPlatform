//
//  AuditCompanyDetailView.m
//  Motorcade
//
//  Created by 隋林栋 on 2019/12/3.
//Copyright © 2019 ping. All rights reserved.
//

#import "AuditCompanyDetailView.h"

//dao
#import "AuditDao.h"

@implementation AuditCompanyDetailView

#pragma mark 刷新view
- (void)resetViewWithModel:(ModelAuditCompany *)modelCompany{
    [self removeAllSubViews];//移除线
    //重置视图坐标
    CGFloat bottom = 0;
    switch ((int)modelCompany.type) {
        case 11://@"托运人";
        {
            bottom =  [AuditDao addDetailSubView:@[^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"企业名称";
                model.subTitle = UnPackStr(modelCompany.name);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"企业ID";
                model.subTitle = strDotF(modelCompany.iDProperty);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"企业码";
                model.subTitle = UnPackStr(modelCompany.code);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"提交时间";
                model.subTitle = UnPackStr(modelCompany.timeShow);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"信用代码";
                model.subTitle = UnPackStr(modelCompany.businessLicense);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"法人姓名";
                model.subTitle = UnPackStr(modelCompany.legalName);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"身份证号";
                model.subTitle = UnPackStr(modelCompany.identityNumber);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"办公电话";
                model.subTitle = UnPackStr(modelCompany.officePhone);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"办公邮箱";
                model.subTitle = UnPackStr(modelCompany.officeEmail);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"办公地址";
                model.subTitle = UnPackStr(modelCompany.addressShow);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"详细地址";
                model.subTitle = UnPackStr(modelCompany.officeAddrDetail);
                return model;
            }()] inView:self title:@"基本信息"];
        }
            break;
        case 31://@"运输公司"
        {
            bottom =  [AuditDao addDetailSubView:@[^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"企业名称";
                model.subTitle = UnPackStr(modelCompany.name);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"企业ID";
                model.subTitle = strDotF(modelCompany.iDProperty);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"企业码";
                model.subTitle = UnPackStr(modelCompany.code);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"提交时间";
                model.subTitle = UnPackStr(modelCompany.timeShow);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"信用代码";
                model.subTitle = UnPackStr(modelCompany.businessLicense);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"道路经营许可证";
                model.subTitle = UnPackStr(modelCompany.managementLicense);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"法人姓名";
                model.subTitle = UnPackStr(modelCompany.legalName);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"身份证号";
                model.subTitle = UnPackStr(modelCompany.identityNumber);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"办公电话";
                model.subTitle = UnPackStr(modelCompany.officePhone);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"办公邮箱";
                model.subTitle = UnPackStr(modelCompany.officeEmail);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"办公地址";
                model.subTitle = UnPackStr(modelCompany.addressShow);
                return model;
            }(),^(){
                ModelBtn * model = [ModelBtn new];
                model.title = @"详细地址";
                model.subTitle = UnPackStr(modelCompany.officeAddrDetail);
                return model;
            }()] inView:self title:@"基本信息"];
        }
            break;
        case 32://@"个体车主"
        {
                bottom =  [AuditDao addDetailSubView:@[^(){
                    ModelBtn * model = [ModelBtn new];
                    model.title = @"企业ID";
                    model.subTitle = strDotF(modelCompany.iDProperty);
                    return model;
                }(),^(){
                    ModelBtn * model = [ModelBtn new];
                    model.title = @"企业码";
                    model.subTitle = UnPackStr(modelCompany.code);
                    return model;
                }(),^(){
                    ModelBtn * model = [ModelBtn new];
                    model.title = @"提交时间";
                    model.subTitle = UnPackStr(modelCompany.timeShow);
                    return model;
                }(),^(){
                    ModelBtn * model = [ModelBtn new];
                    model.title = @"真实姓名";
                    model.subTitle = UnPackStr(modelCompany.legalName);
                    return model;
                }(),^(){
                    ModelBtn * model = [ModelBtn new];
                    model.title = @"身份证号";
                    model.subTitle = UnPackStr(modelCompany.identityNumber);
                    return model;
                }()] inView:self title:@"基本信息"];
        }
            break;
            
        default:
            break;
    }

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





@implementation AuditDetailAccountView

#pragma mark 刷新view
- (void)resetViewWithAryModels:(NSArray *)aryDatas{
    [self removeAllSubViews];//移除线
    //重置视图坐标
    NSMutableArray * aryMu = [NSMutableArray new];
    for (ModelCompanyAccount * item in aryDatas) {
        
        [aryMu addObject:^(){
            ModelBtn * modelBase = [ModelBtn new];
            modelBase.title = @"企业名称";
            modelBase.subTitle = UnPackStr(item.name);
            return modelBase;
        }()];
        [aryMu addObject:^(){
            ModelBtn * modelBase = [ModelBtn new];
            modelBase.title = @"统一税号";
            modelBase.subTitle = UnPackStr(item.taxNumber);
            return modelBase;
        }()];
        [aryMu addObject:^(){
            ModelBtn * modelBase = [ModelBtn new];
            modelBase.title = @"开户银行";
            modelBase.subTitle = UnPackStr(item.bankName);
            return modelBase;
        }()];
        [aryMu addObject:^(){
            ModelBtn * modelBase = [ModelBtn new];
            modelBase.title = @"银行账户";
            modelBase.subTitle = UnPackStr(item.bankAccount);
            return modelBase;
        }()];
        [aryMu addObject:^(){
            ModelBtn * modelBase = [ModelBtn new];
            modelBase.title = @"地址";
            modelBase.subTitle = UnPackStr(item.addressShow);
            return modelBase;
        }()];
        if (![aryDatas.lastObject isEqual:item]) {
            [aryMu addObject:^(){
                ModelBtn * modelBase = [ModelBtn new];
                modelBase.isHide = true;
                return modelBase;
            }()];
        }
    }
    CGFloat bottom =  [AuditDao addDetailSubView:aryMu inView:self title:@"账户列表"];
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
