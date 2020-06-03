//
//  ModelAuditCar.h
//
//  Created by 林栋 隋 on 2019/12/26
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ModelAuditCar : NSObject

@property (nonatomic, assign) double terminalId;
@property (nonatomic, strong) NSString *trailerNumber;
@property (nonatomic, assign) double licenceType;
@property (nonatomic, strong) NSString *vehicleNumber;
@property (nonatomic, assign) double vehicleLength;
@property (nonatomic, assign) double axle;
@property (nonatomic, strong) NSString *entName;
@property (nonatomic, strong) NSString *vin;
@property (nonatomic, assign) double driverUserId;
@property (nonatomic, assign) double driverId;
@property (nonatomic, strong) NSString *vehicleOwner;
@property (nonatomic, assign) double iDProperty;
@property (nonatomic, strong) NSString *engineNumber;
@property (nonatomic, assign) double date;
@property (nonatomic, assign) double submitDate;
@property (nonatomic, assign) double vehicleType;
@property (nonatomic, strong) NSString *driverName;
@property (nonatomic, assign) double entId;
@property (nonatomic, assign) double submitTime;
@property (nonatomic, strong) NSString *driverPhone;
@property (nonatomic, assign) double qualificationState;
@property (nonatomic, assign) double createTime;
@property (nonatomic, assign) double vehicleLoad;
@property (nonatomic, strong) NSString *vehicleLicense;
@property (nonatomic, strong) NSString *truckNumber;
@property (nonatomic, strong) NSString *drivingLicenseFrontUrl;
@property (nonatomic, strong) NSString *trailerGoodsInsuranceUrl;
@property (nonatomic, strong) NSString *vehiclePhotoUrl;
@property (nonatomic, strong) NSString *managementLicenseUrl;
@property (nonatomic, strong) NSString *trailerInsuranceUrl;
@property (nonatomic, strong) NSString *trailerTripartiteInsuranceUrl;
@property (nonatomic, strong) NSString *drivingLicenseNegativeUrl;
@property (nonatomic, strong) NSString *vehicleInsuranceUrl;
@property (nonatomic, strong) NSString *vehicleTripartiteInsuranceUrl;
//logical
@property (nonatomic, strong) NSString *stateShow;
@property (nonatomic, strong) UIColor *stateColorShow;
@property (nonatomic, strong) NSString *carTypeShow;
@property (nonatomic, strong) NSString *carLengthShow;
@property (nonatomic, strong) NSString *timeShow;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
