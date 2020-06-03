//
//  ModelAuditCompany.h
//
//  Created by 林栋 隋 on 2019/12/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ModelAuditCompany : NSObject

@property (nonatomic, assign) double serviceFeeRate;
@property (nonatomic, strong) NSString *officePhone;
@property (nonatomic, strong) NSString *officeAddrDetail;
@property (nonatomic, strong) NSString *officeEmail;
@property (nonatomic, assign) double totalvaliddriver;
@property (nonatomic, assign) double iDProperty;
@property (nonatomic, strong) NSString *businessLicense;
@property (nonatomic, assign) double creatorId;
@property (nonatomic, assign) double state;
@property (nonatomic, strong) NSString *creatorPhone;
@property (nonatomic, strong) NSString *officeProvinceName;
@property (nonatomic, strong) NSString *managementLicense;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *simpleName;
@property (nonatomic, assign) double officeCityId;
@property (nonatomic, assign) double qualificationState;
@property (nonatomic, assign) double officeCountyId;
@property (nonatomic, assign) double totalVehicle;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) double dataState;
@property (nonatomic, assign) double totalScore;
@property (nonatomic, strong) NSString *officeCityName;
@property (nonatomic, strong) NSString *legalName;
@property (nonatomic, strong) NSString *identityNumber;
@property (nonatomic, assign) double submitTime;
@property (nonatomic, assign) double isEnt;
@property (nonatomic, assign) double isHaveFleet;
@property (nonatomic, strong) NSString *officeCountyName;
@property (nonatomic, assign) double totalDriver;
@property (nonatomic, strong) NSString *logoUrl;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double officeProvinceId;

//logical
@property (nonatomic, strong) NSString *stateShow;
@property (nonatomic, strong) UIColor *stateColorShow;
@property (nonatomic, strong) NSString *typeShow;
@property (nonatomic, strong) NSString *timeShow;
@property (nonatomic, strong) NSString *addressShow;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
