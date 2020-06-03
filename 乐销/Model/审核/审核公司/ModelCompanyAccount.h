//
//  ModelCompanyAccount.h
//
//  Created by 林栋 隋 on 2019/12/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ModelCompanyAccount : NSObject

@property (nonatomic, assign) double iDProperty;
@property (nonatomic, strong) NSString *bankAccount;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *bankName;
@property (nonatomic, strong) NSString *countyName;
@property (nonatomic, assign) double src;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, assign) double countyId;
@property (nonatomic, assign) double createTime;
@property (nonatomic, strong) NSString *addrDetail;
@property (nonatomic, assign) double objectId;
@property (nonatomic, assign) double provinceId;
@property (nonatomic, strong) NSString *provinceName;
@property (nonatomic, assign) double cityId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *taxNumber;
//ligical
@property (nonatomic, strong) NSString *addressShow;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
