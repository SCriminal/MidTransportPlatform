//
//  ModelAuditCar.m
//
//  Created by 林栋 隋 on 2019/12/26
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "ModelAuditCar.h"


NSString *const kModelAuditCarTerminalId = @"terminalId";
NSString *const kModelAuditCarTrailerNumber = @"trailerNumber";
NSString *const kModelAuditCarLicenceType = @"licenceType";
NSString *const kModelAuditCarVehicleNumber = @"vehicleNumber";
NSString *const kModelAuditCarVehicleLength = @"vehicleLength";
NSString *const kModelAuditCarAxle = @"axle";
NSString *const kModelAuditCarEntName = @"entName";
NSString *const kModelAuditCarVin = @"vin";
NSString *const kModelAuditCarDriverUserId = @"driverUserId";
NSString *const kModelAuditCarDriverId = @"driverId";
NSString *const kModelAuditCarVehicleOwner = @"vehicleOwner";
NSString *const kModelAuditCarId = @"id";
NSString *const kModelAuditCarEngineNumber = @"engineNumber";
NSString *const kModelAuditCarDate = @"date";
NSString *const kModelAuditCarSubmitDate = @"submitDate";
NSString *const kModelAuditCarVehicleType = @"vehicleType";
NSString *const kModelAuditCarDriverName = @"driverName";
NSString *const kModelAuditCarEntId = @"entId";
NSString *const kModelAuditCarSubmitTime = @"submitTime";
NSString *const kModelAuditCarDriverPhone = @"driverPhone";
NSString *const kModelAuditCarQualificationState = @"qualificationState";
NSString *const kModelAuditCarCreateTime = @"createTime";
NSString *const kModelAuditCarVehicleLoad = @"vehicleLoad";
NSString *const kModelAuditCarVehicleLicense = @"vehicleLicense";
NSString *const kModelAuditCarTruckNumber = @"truckNumber";
NSString *const kModelAuditCarDrivingLicenseFrontUrl = @"drivingLicenseFrontUrl";
NSString *const kModelAuditCarTrailerGoodsInsuranceUrl = @"trailerGoodsInsuranceUrl";
NSString *const kModelAuditCarVehiclePhotoUrl = @"vehiclePhotoUrl";
NSString *const kModelAuditCarManagementLicenseUrl = @"managementLicenseUrl";
NSString *const kModelAuditCarTrailerInsuranceUrl = @"trailerInsuranceUrl";
NSString *const kModelAuditCarTrailerTripartiteInsuranceUrl = @"trailerTripartiteInsuranceUrl";
NSString *const kModelAuditCarDrivingLicenseNegativeUrl = @"drivingLicenseNegativeUrl";
NSString *const kModelAuditCarVehicleInsuranceUrl = @"vehicleInsuranceUrl";
NSString *const kModelAuditCarVehicleTripartiteInsuranceUrl = @"vehicleTripartiteInsuranceUrl";

@interface ModelAuditCar ()
@end

@implementation ModelAuditCar

@synthesize terminalId = _terminalId;
@synthesize trailerNumber = _trailerNumber;
@synthesize licenceType = _licenceType;
@synthesize vehicleNumber = _vehicleNumber;
@synthesize vehicleLength = _vehicleLength;
@synthesize axle = _axle;
@synthesize entName = _entName;
@synthesize vin = _vin;
@synthesize driverUserId = _driverUserId;
@synthesize driverId = _driverId;
@synthesize vehicleOwner = _vehicleOwner;
@synthesize iDProperty = _iDProperty;
@synthesize engineNumber = _engineNumber;
@synthesize date = _date;
@synthesize submitDate = _submitDate;
@synthesize vehicleType = _vehicleType;
@synthesize driverName = _driverName;
@synthesize entId = _entId;
@synthesize submitTime = _submitTime;
@synthesize driverPhone = _driverPhone;
@synthesize qualificationState = _qualificationState;
@synthesize createTime = _createTime;
@synthesize vehicleLoad = _vehicleLoad;
@synthesize vehicleLicense = _vehicleLicense;
@synthesize truckNumber = _truckNumber;

- (void)transformData{
//    item.getQualificationState()==2?"待审核":item.getQualificationState()==3?"审核通过":item.getQualificationState()==10?"审核未通过":""
    switch ((int)self.qualificationState) {
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
    self.carTypeShow = [self getCarType:self.vehicleType];
    self.carLengthShow = [self getCarLength:self.vehicleType];
    self.timeShow = [GlobalMethod exchangeTimeWithStamp:self.submitTime andFormatter:TIME_SEC_SHOW];

}

- (NSString *)getCarType:(int)vehicleType{
    switch (vehicleType) {
        case 1:
            return @"普通货车";
        case 2:
            return @"厢式货车";
        case 3:
            return @"罐式货车";
        case 4:
            return @"牵引车";
        case 5:
            return @"普通挂车";
        case 6:
            return @"罐式挂车";
        case 7:
            return @"集装箱挂车";
        case 8:
            return @"仓栅式货车";
        case 9:
            return @"封闭货车";
        case 10:
            return @"平板货车";
        case 11:
            return @"集装箱车";
        case 12:
            return @"自卸货车";
        case 13:
            return @"特殊结构货车";
        case 14:
            return @"专项作业车";
        case 15:
            return @"厢式挂车";
        case 16:
            return @"仓栅式挂车";
        case 17:
            return @"平板挂车";
        case 18:
            return @"自卸挂车";
        case 19:
            return @"专项作业挂车";
        case 20:
            return @"车辆运输车";
        case 21:
            return @"车辆运输车（单排）";
            
    }
    return @"";
}

- (NSString *)getCarLength:(int)vehicleType{
    switch (vehicleType) {
        case 1:
            return @"6.8米";
        case 2:
            return @"6.6米";
        case 3:
            return @"7.8米";
        case 4:
            return @"9.6米";
        case 5:
            return @"13米";
        case 6:
            return @"1.8米";
        case 7:
            return @"2.7米";
        case 8:
            return @"3.8米";
        case 9:
            return @"4.2米";
        case 10:
            return @"5米";
        case 11:
            return @"6.2米";
        case 12:
            return @"7.7米";
        case 13:
            return @"8.2米";
        case 14:
            return @"8.7米";
        case 15:
            return @"11.7米";
        case 16:
            return @"12.5米";
        case 17:
            return @"15米";
        case 18:
            return @"16米";
        case 19:
            return @"17.5米";
        case 20:
            return @"11米";
    }
    return @"";
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
            self.terminalId = [dict doubleValueForKey:kModelAuditCarTerminalId];
            self.trailerNumber = [dict stringValueForKey:kModelAuditCarTrailerNumber];
            self.licenceType = [dict doubleValueForKey:kModelAuditCarLicenceType];
            self.vehicleNumber = [dict stringValueForKey:kModelAuditCarVehicleNumber];
            self.vehicleLength = [dict doubleValueForKey:kModelAuditCarVehicleLength];
            self.axle = [dict doubleValueForKey:kModelAuditCarAxle];
            self.entName = [dict stringValueForKey:kModelAuditCarEntName];
            self.vin = [dict stringValueForKey:kModelAuditCarVin];
            self.driverUserId = [dict doubleValueForKey:kModelAuditCarDriverUserId];
            self.driverId = [dict doubleValueForKey:kModelAuditCarDriverId];
            self.vehicleOwner = [dict stringValueForKey:kModelAuditCarVehicleOwner];
            self.iDProperty = [dict doubleValueForKey:kModelAuditCarId];
            self.engineNumber = [dict stringValueForKey:kModelAuditCarEngineNumber];
            self.date = [dict doubleValueForKey:kModelAuditCarDate];
            self.submitDate = [dict doubleValueForKey:kModelAuditCarSubmitDate];
            self.vehicleType = [dict doubleValueForKey:kModelAuditCarVehicleType];
            self.driverName = [dict stringValueForKey:kModelAuditCarDriverName];
            self.entId = [dict doubleValueForKey:kModelAuditCarEntId];
            self.submitTime = [dict doubleValueForKey:kModelAuditCarSubmitTime];
            self.driverPhone = [dict stringValueForKey:kModelAuditCarDriverPhone];
            self.qualificationState = [dict doubleValueForKey:kModelAuditCarQualificationState];
            self.createTime = [dict doubleValueForKey:kModelAuditCarCreateTime];
            self.vehicleLoad = [dict doubleValueForKey:kModelAuditCarVehicleLoad];
            self.vehicleLicense = [dict stringValueForKey:kModelAuditCarVehicleLicense];
            self.truckNumber = [dict stringValueForKey:kModelAuditCarTruckNumber];
        self.drivingLicenseFrontUrl = [dict stringValueForKey:kModelAuditCarDrivingLicenseFrontUrl];
        self.trailerGoodsInsuranceUrl = [dict stringValueForKey:kModelAuditCarTrailerGoodsInsuranceUrl];
        self.vehiclePhotoUrl = [dict stringValueForKey:kModelAuditCarVehiclePhotoUrl];
        self.managementLicenseUrl = [dict stringValueForKey:kModelAuditCarManagementLicenseUrl];
        self.trailerInsuranceUrl = [dict stringValueForKey:kModelAuditCarTrailerInsuranceUrl];
        self.trailerTripartiteInsuranceUrl = [dict stringValueForKey:kModelAuditCarTrailerTripartiteInsuranceUrl];
        self.drivingLicenseNegativeUrl = [dict stringValueForKey:kModelAuditCarDrivingLicenseNegativeUrl];
        self.vehicleInsuranceUrl = [dict stringValueForKey:kModelAuditCarVehicleInsuranceUrl];
        self.vehicleTripartiteInsuranceUrl = [dict stringValueForKey:kModelAuditCarVehicleTripartiteInsuranceUrl];
        //logical
        [self transformData];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.terminalId] forKey:kModelAuditCarTerminalId];
    [mutableDict setValue:self.trailerNumber forKey:kModelAuditCarTrailerNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.licenceType] forKey:kModelAuditCarLicenceType];
    [mutableDict setValue:self.vehicleNumber forKey:kModelAuditCarVehicleNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vehicleLength] forKey:kModelAuditCarVehicleLength];
    [mutableDict setValue:[NSNumber numberWithDouble:self.axle] forKey:kModelAuditCarAxle];
    [mutableDict setValue:self.entName forKey:kModelAuditCarEntName];
    [mutableDict setValue:self.vin forKey:kModelAuditCarVin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.driverUserId] forKey:kModelAuditCarDriverUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.driverId] forKey:kModelAuditCarDriverId];
    [mutableDict setValue:self.vehicleOwner forKey:kModelAuditCarVehicleOwner];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iDProperty] forKey:kModelAuditCarId];
    [mutableDict setValue:self.engineNumber forKey:kModelAuditCarEngineNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.date] forKey:kModelAuditCarDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.submitDate] forKey:kModelAuditCarSubmitDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vehicleType] forKey:kModelAuditCarVehicleType];
    [mutableDict setValue:self.driverName forKey:kModelAuditCarDriverName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.entId] forKey:kModelAuditCarEntId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.submitTime] forKey:kModelAuditCarSubmitTime];
    [mutableDict setValue:self.driverPhone forKey:kModelAuditCarDriverPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.qualificationState] forKey:kModelAuditCarQualificationState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kModelAuditCarCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vehicleLoad] forKey:kModelAuditCarVehicleLoad];
    [mutableDict setValue:self.vehicleLicense forKey:kModelAuditCarVehicleLicense];
    [mutableDict setValue:self.truckNumber forKey:kModelAuditCarTruckNumber];
    [mutableDict setValue:self.drivingLicenseFrontUrl forKey:kModelAuditCarDrivingLicenseFrontUrl];
    [mutableDict setValue:self.trailerGoodsInsuranceUrl forKey:kModelAuditCarTrailerGoodsInsuranceUrl];
    [mutableDict setValue:self.vehiclePhotoUrl forKey:kModelAuditCarVehiclePhotoUrl];
    [mutableDict setValue:self.managementLicenseUrl forKey:kModelAuditCarManagementLicenseUrl];
    [mutableDict setValue:self.trailerInsuranceUrl forKey:kModelAuditCarTrailerInsuranceUrl];
    [mutableDict setValue:self.trailerTripartiteInsuranceUrl forKey:kModelAuditCarTrailerTripartiteInsuranceUrl];
    [mutableDict setValue:self.drivingLicenseNegativeUrl forKey:kModelAuditCarDrivingLicenseNegativeUrl];
    [mutableDict setValue:self.vehicleInsuranceUrl forKey:kModelAuditCarVehicleInsuranceUrl];
    [mutableDict setValue:self.vehicleTripartiteInsuranceUrl forKey:kModelAuditCarVehicleTripartiteInsuranceUrl];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}


@end
