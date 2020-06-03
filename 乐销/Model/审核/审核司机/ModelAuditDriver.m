//
//  ModelAuditDriver.m
//
//  Created by 林栋 隋 on 2019/12/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "ModelAuditDriver.h"


NSString *const kModelAuditDriverAccount = @"account";
NSString *const kModelAuditDriverBirthday = @"birthday";
NSString *const kModelAuditDriverUserStatus = @"userStatus";
NSString *const kModelAuditDriverNickname = @"nickname";
NSString *const kModelAuditDriverContactPhone = @"contactPhone";
NSString *const kModelAuditDriverRealName = @"realName";
NSString *const kModelAuditDriverReviewTime = @"reviewTime";
NSString *const kModelAuditDriverCountyId = @"countyId";
NSString *const kModelAuditDriverHeadUrl = @"headUrl";
NSString *const kModelAuditDriverGender = @"gender";
NSString *const kModelAuditDriverId = @"id";
NSString *const kModelAuditDriverCountyName = @"countyName";
NSString *const kModelAuditDriverIdNumber = @"idNumber";
NSString *const kModelAuditDriverSubmitTime = @"submitTime";
NSString *const kModelAuditDriverProvinceName = @"provinceName";
NSString *const kModelAuditDriverExplain = @"explain";
NSString *const kModelAuditDriverReviewStatus = @"reviewStatus";
NSString *const kModelAuditDriverProvinceId = @"provinceId";
NSString *const kModelAuditDriverCityId = @"cityId";
NSString *const kModelAuditDriverEmail = @"email";
NSString *const kModelAuditDriverWxNumber = @"wxNumber";
NSString *const kModelAuditDriverCityName = @"cityName";
NSString *const kModelAuditDriverAddress = @"address";
NSString *const kModelAuditDriverIntroduce = @"introduce";


@interface ModelAuditDriver ()
@end

@implementation ModelAuditDriver

@synthesize account = _account;
@synthesize birthday = _birthday;
@synthesize userStatus = _userStatus;
@synthesize nickname = _nickname;
@synthesize contactPhone = _contactPhone;
@synthesize realName = _realName;
@synthesize reviewTime = _reviewTime;
@synthesize countyId = _countyId;
@synthesize headUrl = _headUrl;
@synthesize gender = _gender;
@synthesize iDProperty = _iDProperty;
@synthesize countyName = _countyName;
@synthesize idNumber = _idNumber;
@synthesize submitTime = _submitTime;
@synthesize provinceName = _provinceName;
@synthesize explain = _explain;
@synthesize reviewStatus = _reviewStatus;
@synthesize provinceId = _provinceId;
@synthesize cityId = _cityId;
@synthesize email = _email;
@synthesize wxNumber = _wxNumber;
@synthesize cityName = _cityName;
@synthesize address = _address;
@synthesize introduce = _introduce;



- (void)transformData{
    switch ((int)self.reviewStatus) {
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

    self.timeShow = [GlobalMethod exchangeTimeWithStamp:self.submitTime andFormatter:TIME_SEC_SHOW];

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
            self.account = [dict stringValueForKey:kModelAuditDriverAccount];
            self.birthday = [dict doubleValueForKey:kModelAuditDriverBirthday];
            self.userStatus = [dict doubleValueForKey:kModelAuditDriverUserStatus];
            self.nickname = [dict stringValueForKey:kModelAuditDriverNickname];
            self.contactPhone = [dict stringValueForKey:kModelAuditDriverContactPhone];
            self.realName = [dict stringValueForKey:kModelAuditDriverRealName];
            self.reviewTime = [dict doubleValueForKey:kModelAuditDriverReviewTime];
            self.countyId = [dict doubleValueForKey:kModelAuditDriverCountyId];
            self.headUrl = [dict stringValueForKey:kModelAuditDriverHeadUrl];
            self.gender = [dict doubleValueForKey:kModelAuditDriverGender];
            self.iDProperty = [dict doubleValueForKey:kModelAuditDriverId];
            self.countyName = [dict stringValueForKey:kModelAuditDriverCountyName];
            self.idNumber = [dict stringValueForKey:kModelAuditDriverIdNumber];
            self.submitTime = [dict doubleValueForKey:kModelAuditDriverSubmitTime];
            self.provinceName = [dict stringValueForKey:kModelAuditDriverProvinceName];
            self.explain = [dict stringValueForKey:kModelAuditDriverExplain];
            self.reviewStatus = [dict doubleValueForKey:kModelAuditDriverReviewStatus];
            self.provinceId = [dict doubleValueForKey:kModelAuditDriverProvinceId];
            self.cityId = [dict doubleValueForKey:kModelAuditDriverCityId];
            self.email = [dict stringValueForKey:kModelAuditDriverEmail];
            self.wxNumber = [dict stringValueForKey:kModelAuditDriverWxNumber];
            self.cityName = [dict stringValueForKey:kModelAuditDriverCityName];
            self.address = [dict stringValueForKey:kModelAuditDriverAddress];
            self.introduce = [dict stringValueForKey:kModelAuditDriverIntroduce];
        //logical
        [self transformData];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.account forKey:kModelAuditDriverAccount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.birthday] forKey:kModelAuditDriverBirthday];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userStatus] forKey:kModelAuditDriverUserStatus];
    [mutableDict setValue:self.nickname forKey:kModelAuditDriverNickname];
    [mutableDict setValue:self.contactPhone forKey:kModelAuditDriverContactPhone];
    [mutableDict setValue:self.realName forKey:kModelAuditDriverRealName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reviewTime] forKey:kModelAuditDriverReviewTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.countyId] forKey:kModelAuditDriverCountyId];
    [mutableDict setValue:self.headUrl forKey:kModelAuditDriverHeadUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gender] forKey:kModelAuditDriverGender];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iDProperty] forKey:kModelAuditDriverId];
    [mutableDict setValue:self.countyName forKey:kModelAuditDriverCountyName];
    [mutableDict setValue:self.idNumber forKey:kModelAuditDriverIdNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.submitTime] forKey:kModelAuditDriverSubmitTime];
    [mutableDict setValue:self.provinceName forKey:kModelAuditDriverProvinceName];
    [mutableDict setValue:self.explain forKey:kModelAuditDriverExplain];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reviewStatus] forKey:kModelAuditDriverReviewStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.provinceId] forKey:kModelAuditDriverProvinceId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cityId] forKey:kModelAuditDriverCityId];
    [mutableDict setValue:self.email forKey:kModelAuditDriverEmail];
    [mutableDict setValue:self.wxNumber forKey:kModelAuditDriverWxNumber];
    [mutableDict setValue:self.cityName forKey:kModelAuditDriverCityName];
    [mutableDict setValue:self.address forKey:kModelAuditDriverAddress];
    [mutableDict setValue:self.introduce forKey:kModelAuditDriverIntroduce];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}


@end
