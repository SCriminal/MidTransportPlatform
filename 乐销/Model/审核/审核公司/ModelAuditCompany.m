//
//  ModelAuditCompany.m
//
//  Created by 林栋 隋 on 2019/12/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "ModelAuditCompany.h"


NSString *const kModelAuditCompanyServiceFeeRate = @"serviceFeeRate";
NSString *const kModelAuditCompanyOfficePhone = @"officePhone";
NSString *const kModelAuditCompanyOfficeAddrDetail = @"officeAddrDetail";
NSString *const kModelAuditCompanyOfficeEmail = @"officeEmail";
NSString *const kModelAuditCompanyTotalvaliddriver = @"totalvaliddriver";
NSString *const kModelAuditCompanyId = @"id";
NSString *const kModelAuditCompanyBusinessLicense = @"businessLicense";
NSString *const kModelAuditCompanyCreatorId = @"creatorId";
NSString *const kModelAuditCompanyState = @"state";
NSString *const kModelAuditCompanyCreatorPhone = @"creatorPhone";
NSString *const kModelAuditCompanyOfficeProvinceName = @"officeProvinceName";
NSString *const kModelAuditCompanyManagementLicense = @"managementLicense";
NSString *const kModelAuditCompanyType = @"type";
NSString *const kModelAuditCompanySimpleName = @"simpleName";
NSString *const kModelAuditCompanyOfficeCityId = @"officeCityId";
NSString *const kModelAuditCompanyQualificationState = @"qualificationState";
NSString *const kModelAuditCompanyOfficeCountyId = @"officeCountyId";
NSString *const kModelAuditCompanyTotalVehicle = @"totalVehicle";
NSString *const kModelAuditCompanyName = @"name";
NSString *const kModelAuditCompanyCode = @"code";
NSString *const kModelAuditCompanyDataState = @"dataState";
NSString *const kModelAuditCompanyTotalScore = @"totalScore";
NSString *const kModelAuditCompanyOfficeCityName = @"officeCityName";
NSString *const kModelAuditCompanyLegalName = @"legalName";
NSString *const kModelAuditCompanyIdentityNumber = @"identityNumber";
NSString *const kModelAuditCompanySubmitTime = @"submitTime";
NSString *const kModelAuditCompanyIsEnt = @"isEnt";
NSString *const kModelAuditCompanyIsHaveFleet = @"isHaveFleet";
NSString *const kModelAuditCompanyOfficeCountyName = @"officeCountyName";
NSString *const kModelAuditCompanyTotalDriver = @"totalDriver";
NSString *const kModelAuditCompanyLogoUrl = @"logoUrl";
NSString *const kModelAuditCompanyCreateTime = @"createTime";
NSString *const kModelAuditCompanyOfficeProvinceId = @"officeProvinceId";


@interface ModelAuditCompany ()
@end

@implementation ModelAuditCompany

@synthesize serviceFeeRate = _serviceFeeRate;
@synthesize officePhone = _officePhone;
@synthesize officeAddrDetail = _officeAddrDetail;
@synthesize officeEmail = _officeEmail;
@synthesize totalvaliddriver = _totalvaliddriver;
@synthesize iDProperty = _iDProperty;
@synthesize businessLicense = _businessLicense;
@synthesize creatorId = _creatorId;
@synthesize state = _state;
@synthesize creatorPhone = _creatorPhone;
@synthesize officeProvinceName = _officeProvinceName;
@synthesize managementLicense = _managementLicense;
@synthesize type = _type;
@synthesize simpleName = _simpleName;
@synthesize officeCityId = _officeCityId;
@synthesize qualificationState = _qualificationState;
@synthesize officeCountyId = _officeCountyId;
@synthesize totalVehicle = _totalVehicle;
@synthesize name = _name;
@synthesize code = _code;
@synthesize dataState = _dataState;
@synthesize totalScore = _totalScore;
@synthesize officeCityName = _officeCityName;
@synthesize legalName = _legalName;
@synthesize identityNumber = _identityNumber;
@synthesize submitTime = _submitTime;
@synthesize isEnt = _isEnt;
@synthesize isHaveFleet = _isHaveFleet;
@synthesize officeCountyName = _officeCountyName;
@synthesize totalDriver = _totalDriver;
@synthesize logoUrl = _logoUrl;
@synthesize createTime = _createTime;
@synthesize officeProvinceId = _officeProvinceId;


- (void)transformData{
    switch ((int)self.qualificationState) {
//            case 1://未审核
        case 2:
            self.stateShow = @"待审核";
            self.stateColorShow = COLOR_ORANGE;
            break;
        case 3:
            self.stateShow = @"审核通过";
            self.stateColorShow = COLOR_GREEN;
            break;
        case 10:
            self.stateShow = @"审核未通过";
            self.stateColorShow = [UIColor redColor];
            break;
        default:
            self.stateShow = @"";
            self.stateColorShow = [UIColor redColor];
            break;
    }
    switch ((int)self.type) {
        case 11:
            self.typeShow = @"托运人";
            break;
        case 31:
            self.typeShow = @"运输公司";
            break;
        case 32:
            self.typeShow = @"个体车主";
            break;
        default:
            self.typeShow = @"";
            break;
    }
    self.timeShow = [GlobalMethod exchangeTimeWithStamp:self.submitTime andFormatter:TIME_SEC_SHOW];
    
    NSMutableArray * aryMu = [NSMutableArray new];
    if (isStr(self.officeProvinceName)) {
        [aryMu addObject:self.officeProvinceName];
    }
    if (isStr(self.officeCityName)) {
        if (![self.officeCityName isEqualToString:self.officeProvinceName]) {
            [aryMu addObject:self.officeCityName];
        }
    }
    if (isStr(self.officeCountyName)) {
        [aryMu addObject:self.officeCountyName];
    }
    if (aryMu.count) {
        self.addressShow = [aryMu componentsJoinedByString:@"/"];
    }else{
        self.addressShow = @"暂无地址";
    }
}

#pragma mark init
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.serviceFeeRate = [dict doubleValueForKey:kModelAuditCompanyServiceFeeRate];
            self.officePhone = [dict stringValueForKey:kModelAuditCompanyOfficePhone];
            self.officeAddrDetail = [dict stringValueForKey:kModelAuditCompanyOfficeAddrDetail];
            self.officeEmail = [dict stringValueForKey:kModelAuditCompanyOfficeEmail];
            self.totalvaliddriver = [dict doubleValueForKey:kModelAuditCompanyTotalvaliddriver];
            self.iDProperty = [dict doubleValueForKey:kModelAuditCompanyId];
            self.businessLicense = [dict stringValueForKey:kModelAuditCompanyBusinessLicense];
            self.creatorId = [dict doubleValueForKey:kModelAuditCompanyCreatorId];
            self.state = [dict doubleValueForKey:kModelAuditCompanyState];
            self.creatorPhone = [dict stringValueForKey:kModelAuditCompanyCreatorPhone];
            self.officeProvinceName = [dict stringValueForKey:kModelAuditCompanyOfficeProvinceName];
            self.managementLicense = [dict stringValueForKey:kModelAuditCompanyManagementLicense];
            self.type = [dict doubleValueForKey:kModelAuditCompanyType];
            self.simpleName = [dict stringValueForKey:kModelAuditCompanySimpleName];
            self.officeCityId = [dict doubleValueForKey:kModelAuditCompanyOfficeCityId];
            self.qualificationState = [dict doubleValueForKey:kModelAuditCompanyQualificationState];
            self.officeCountyId = [dict doubleValueForKey:kModelAuditCompanyOfficeCountyId];
            self.totalVehicle = [dict doubleValueForKey:kModelAuditCompanyTotalVehicle];
            self.name = [dict stringValueForKey:kModelAuditCompanyName];
            self.code = [dict stringValueForKey:kModelAuditCompanyCode];
            self.dataState = [dict doubleValueForKey:kModelAuditCompanyDataState];
            self.totalScore = [dict doubleValueForKey:kModelAuditCompanyTotalScore];
            self.officeCityName = [dict stringValueForKey:kModelAuditCompanyOfficeCityName];
            self.legalName = [dict stringValueForKey:kModelAuditCompanyLegalName];
            self.identityNumber = [dict stringValueForKey:kModelAuditCompanyIdentityNumber];
            self.submitTime = [dict doubleValueForKey:kModelAuditCompanySubmitTime];
            self.isEnt = [dict doubleValueForKey:kModelAuditCompanyIsEnt];
            self.isHaveFleet = [dict doubleValueForKey:kModelAuditCompanyIsHaveFleet];
            self.officeCountyName = [dict stringValueForKey:kModelAuditCompanyOfficeCountyName];
            self.totalDriver = [dict doubleValueForKey:kModelAuditCompanyTotalDriver];
            self.logoUrl = [dict stringValueForKey:kModelAuditCompanyLogoUrl];
            self.createTime = [dict doubleValueForKey:kModelAuditCompanyCreateTime];
            self.officeProvinceId = [dict doubleValueForKey:kModelAuditCompanyOfficeProvinceId];
            //logical
        [self transformData];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serviceFeeRate] forKey:kModelAuditCompanyServiceFeeRate];
    [mutableDict setValue:self.officePhone forKey:kModelAuditCompanyOfficePhone];
    [mutableDict setValue:self.officeAddrDetail forKey:kModelAuditCompanyOfficeAddrDetail];
    [mutableDict setValue:self.officeEmail forKey:kModelAuditCompanyOfficeEmail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalvaliddriver] forKey:kModelAuditCompanyTotalvaliddriver];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iDProperty] forKey:kModelAuditCompanyId];
    [mutableDict setValue:self.businessLicense forKey:kModelAuditCompanyBusinessLicense];
    [mutableDict setValue:[NSNumber numberWithDouble:self.creatorId] forKey:kModelAuditCompanyCreatorId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.state] forKey:kModelAuditCompanyState];
    [mutableDict setValue:self.creatorPhone forKey:kModelAuditCompanyCreatorPhone];
    [mutableDict setValue:self.officeProvinceName forKey:kModelAuditCompanyOfficeProvinceName];
    [mutableDict setValue:self.managementLicense forKey:kModelAuditCompanyManagementLicense];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kModelAuditCompanyType];
    [mutableDict setValue:self.simpleName forKey:kModelAuditCompanySimpleName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.officeCityId] forKey:kModelAuditCompanyOfficeCityId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.qualificationState] forKey:kModelAuditCompanyQualificationState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.officeCountyId] forKey:kModelAuditCompanyOfficeCountyId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalVehicle] forKey:kModelAuditCompanyTotalVehicle];
    [mutableDict setValue:self.name forKey:kModelAuditCompanyName];
    [mutableDict setValue:self.code forKey:kModelAuditCompanyCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataState] forKey:kModelAuditCompanyDataState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalScore] forKey:kModelAuditCompanyTotalScore];
    [mutableDict setValue:self.officeCityName forKey:kModelAuditCompanyOfficeCityName];
    [mutableDict setValue:self.legalName forKey:kModelAuditCompanyLegalName];
    [mutableDict setValue:self.identityNumber forKey:kModelAuditCompanyIdentityNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.submitTime] forKey:kModelAuditCompanySubmitTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isEnt] forKey:kModelAuditCompanyIsEnt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isHaveFleet] forKey:kModelAuditCompanyIsHaveFleet];
    [mutableDict setValue:self.officeCountyName forKey:kModelAuditCompanyOfficeCountyName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalDriver] forKey:kModelAuditCompanyTotalDriver];
    [mutableDict setValue:self.logoUrl forKey:kModelAuditCompanyLogoUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kModelAuditCompanyCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.officeProvinceId] forKey:kModelAuditCompanyOfficeProvinceId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}


@end
