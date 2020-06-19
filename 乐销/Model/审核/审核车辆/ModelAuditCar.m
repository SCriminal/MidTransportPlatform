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

NSString *const kModelAuditCarDrivingNumber = @"drivingNumber";
NSString *const kModelAuditCarDrivingEndDate = @"drivingEndDate";
NSString *const kModelAuditCarDrivingRegisterDate = @"drivingRegisterDate";
NSString *const kModelAuditCarEnergyType = @"energyType";
NSString *const kModelAuditCarDrivingIssueDate = @"drivingIssueDate";
NSString *const kModelAuditCarWeight = @"weight";
NSString *const kModelAuditCarDriving2NegativeUrl = @"driving2NegativeUrl";
NSString *const kModelAuditCarLength = @"length";
NSString *const kModelAuditCarGrossMass = @"grossMass";
NSString *const kModelAuditCarHeight = @"height";
NSString *const kModelAuditCarRoadTransportNumber = @"roadTransportNumber";
NSString *const kModelAuditCarUseCharacter = @"useCharacter";
NSString *const kModelAuditCarDrivingAgency = @"drivingAgency";
NSString *const kModelAuditCarModel = @"model";
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
    self.carTypeShow = [ModelAuditCar exchangeVehicleType:NSNumber.dou(self.vehicleType).stringValue];
    self.timeShow = [GlobalMethod exchangeTimeWithStamp:self.submitTime andFormatter:TIME_SEC_SHOW];

}

+ (NSString *)exchangeVehicleType:(NSString *)identity{
    NSString * strPath = [[NSBundle mainBundle]pathForResource:@"CarType" ofType:@"json"];
    NSArray * ary = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:strPath] options:0 error:nil];
    for (NSDictionary * dic in ary) {
        if (identity.doubleValue == [dic doubleValueForKey:@"value"]) {
            return [dic stringValueForKey:@"label"];
        }
    }
    return nil;
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
        self.drivingNumber = [dict stringValueForKey:kModelAuditCarDrivingNumber];
        self.drivingEndDate = [dict doubleValueForKey:kModelAuditCarDrivingEndDate];
        self.drivingRegisterDate = [dict doubleValueForKey:kModelAuditCarDrivingRegisterDate];
        self.energyType = [dict doubleValueForKey:kModelAuditCarEnergyType];
        self.drivingIssueDate = [dict doubleValueForKey:kModelAuditCarDrivingIssueDate];
        self.weight = [dict doubleValueForKey:kModelAuditCarWeight];
        self.driving2NegativeUrl = [dict stringValueForKey:kModelAuditCarDriving2NegativeUrl];
        self.length = [dict doubleValueForKey:kModelAuditCarLength];
        self.grossMass = [dict doubleValueForKey:kModelAuditCarGrossMass];
        self.height = [dict doubleValueForKey:kModelAuditCarHeight];
        self.roadTransportNumber = [dict stringValueForKey:kModelAuditCarRoadTransportNumber];
        self.useCharacter = [dict stringValueForKey:kModelAuditCarUseCharacter];
        self.drivingAgency = [dict stringValueForKey:kModelAuditCarDrivingAgency];
        self.model = [dict stringValueForKey:kModelAuditCarModel];

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
    [mutableDict setValue:self.drivingNumber forKey:kModelAuditCarDrivingNumber];
       [mutableDict setValue:[NSNumber numberWithDouble:self.drivingEndDate] forKey:kModelAuditCarDrivingEndDate];
       [mutableDict setValue:[NSNumber numberWithDouble:self.drivingRegisterDate] forKey:kModelAuditCarDrivingRegisterDate];
       [mutableDict setValue:[NSNumber numberWithDouble:self.energyType] forKey:kModelAuditCarEnergyType];
       [mutableDict setValue:[NSNumber numberWithDouble:self.drivingIssueDate] forKey:kModelAuditCarDrivingIssueDate];
       [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kModelAuditCarWeight];
       [mutableDict setValue:self.driving2NegativeUrl forKey:kModelAuditCarDriving2NegativeUrl];
       [mutableDict setValue:[NSNumber numberWithDouble:self.length] forKey:kModelAuditCarLength];
       [mutableDict setValue:[NSNumber numberWithDouble:self.grossMass] forKey:kModelAuditCarGrossMass];
       [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kModelAuditCarHeight];
       [mutableDict setValue:self.roadTransportNumber forKey:kModelAuditCarRoadTransportNumber];
       [mutableDict setValue:self.useCharacter forKey:kModelAuditCarUseCharacter];
       [mutableDict setValue:self.drivingAgency forKey:kModelAuditCarDrivingAgency];
       [mutableDict setValue:self.model forKey:kModelAuditCarModel];
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}


@end
