//
//  ModelAuditDriver.h
//
//  Created by 林栋 隋 on 2019/12/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ModelAuditDriver : NSObject

@property (nonatomic, strong) NSString *account;
@property (nonatomic, assign) double birthday;
@property (nonatomic, assign) double userStatus;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *contactPhone;
@property (nonatomic, strong) NSString *realName;
@property (nonatomic, assign) double reviewTime;
@property (nonatomic, assign) double countyId;
@property (nonatomic, strong) NSString *headUrl;
@property (nonatomic, assign) double gender;
@property (nonatomic, assign) double iDProperty;
@property (nonatomic, strong) NSString *countyName;
@property (nonatomic, strong) NSString *idNumber;
@property (nonatomic, assign) double submitTime;
@property (nonatomic, strong) NSString *provinceName;
@property (nonatomic, strong) NSString *explain;
@property (nonatomic, assign) double reviewStatus;
@property (nonatomic, assign) double provinceId;
@property (nonatomic, assign) double cityId;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *wxNumber;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *introduce;
@property (nonatomic, strong) NSString *driverAgency;
@property (nonatomic, assign) double driverClass;
@property (nonatomic, strong) NSString *driverPhone;
@property (nonatomic, strong) NSString *roadTransportNumber;
//logical
@property (nonatomic, strong) NSString *stateShow;
@property (nonatomic, strong) UIColor *stateColorShow;
@property (nonatomic, strong) NSString *timeShow;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
