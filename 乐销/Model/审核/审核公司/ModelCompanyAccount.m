//
//  ModelCompanyAccount.m
//
//  Created by 林栋 隋 on 2019/12/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "ModelCompanyAccount.h"


NSString *const kModelCompanyAccountId = @"id";
NSString *const kModelCompanyAccountBankAccount = @"bankAccount";
NSString *const kModelCompanyAccountPhone = @"phone";
NSString *const kModelCompanyAccountBankName = @"bankName";
NSString *const kModelCompanyAccountCountyName = @"countyName";
NSString *const kModelCompanyAccountSrc = @"src";
NSString *const kModelCompanyAccountCityName = @"cityName";
NSString *const kModelCompanyAccountCountyId = @"countyId";
NSString *const kModelCompanyAccountCreateTime = @"createTime";
NSString *const kModelCompanyAccountAddrDetail = @"addrDetail";
NSString *const kModelCompanyAccountObjectId = @"objectId";
NSString *const kModelCompanyAccountProvinceId = @"provinceId";
NSString *const kModelCompanyAccountProvinceName = @"provinceName";
NSString *const kModelCompanyAccountCityId = @"cityId";
NSString *const kModelCompanyAccountName = @"name";
NSString *const kModelCompanyAccountTaxNumber = @"taxNumber";


@interface ModelCompanyAccount ()
@end

@implementation ModelCompanyAccount

@synthesize iDProperty = _iDProperty;
@synthesize bankAccount = _bankAccount;
@synthesize phone = _phone;
@synthesize bankName = _bankName;
@synthesize countyName = _countyName;
@synthesize src = _src;
@synthesize cityName = _cityName;
@synthesize countyId = _countyId;
@synthesize createTime = _createTime;
@synthesize addrDetail = _addrDetail;
@synthesize objectId = _objectId;
@synthesize provinceId = _provinceId;
@synthesize provinceName = _provinceName;
@synthesize cityId = _cityId;
@synthesize name = _name;
@synthesize taxNumber = _taxNumber;


- (void)exchangeData{
    self.addressShow = [NSString stringWithFormat:@"%@%@%@%@",UnPackStr(self.provinceName),[self.provinceName isEqualToString:self.cityName]?@"":UnPackStr(self.cityName),UnPackStr(self.countyName),UnPackStr(self.addrDetail)];
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
            self.iDProperty = [dict doubleValueForKey:kModelCompanyAccountId];
            self.bankAccount = [dict stringValueForKey:kModelCompanyAccountBankAccount];
            self.phone = [dict stringValueForKey:kModelCompanyAccountPhone];
            self.bankName = [dict stringValueForKey:kModelCompanyAccountBankName];
            self.countyName = [dict stringValueForKey:kModelCompanyAccountCountyName];
            self.src = [dict doubleValueForKey:kModelCompanyAccountSrc];
            self.cityName = [dict stringValueForKey:kModelCompanyAccountCityName];
            self.countyId = [dict doubleValueForKey:kModelCompanyAccountCountyId];
            self.createTime = [dict doubleValueForKey:kModelCompanyAccountCreateTime];
            self.addrDetail = [dict stringValueForKey:kModelCompanyAccountAddrDetail];
            self.objectId = [dict doubleValueForKey:kModelCompanyAccountObjectId];
            self.provinceId = [dict doubleValueForKey:kModelCompanyAccountProvinceId];
            self.provinceName = [dict stringValueForKey:kModelCompanyAccountProvinceName];
            self.cityId = [dict doubleValueForKey:kModelCompanyAccountCityId];
            self.name = [dict stringValueForKey:kModelCompanyAccountName];
            self.taxNumber = [dict stringValueForKey:kModelCompanyAccountTaxNumber];
//logical
        [self exchangeData];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iDProperty] forKey:kModelCompanyAccountId];
    [mutableDict setValue:self.bankAccount forKey:kModelCompanyAccountBankAccount];
    [mutableDict setValue:self.phone forKey:kModelCompanyAccountPhone];
    [mutableDict setValue:self.bankName forKey:kModelCompanyAccountBankName];
    [mutableDict setValue:self.countyName forKey:kModelCompanyAccountCountyName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.src] forKey:kModelCompanyAccountSrc];
    [mutableDict setValue:self.cityName forKey:kModelCompanyAccountCityName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.countyId] forKey:kModelCompanyAccountCountyId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kModelCompanyAccountCreateTime];
    [mutableDict setValue:self.addrDetail forKey:kModelCompanyAccountAddrDetail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.objectId] forKey:kModelCompanyAccountObjectId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.provinceId] forKey:kModelCompanyAccountProvinceId];
    [mutableDict setValue:self.provinceName forKey:kModelCompanyAccountProvinceName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cityId] forKey:kModelCompanyAccountCityId];
    [mutableDict setValue:self.name forKey:kModelCompanyAccountName];
    [mutableDict setValue:self.taxNumber forKey:kModelCompanyAccountTaxNumber];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}


@end
