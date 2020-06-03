//
//  ModelUser.m
//
//  Created by sld s on 2019/5/17
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "ModelUser.h"


NSString *const kModelUserAccount = @"account";
NSString *const kModelUserUserId = @"userId";
NSString *const kModelUserHeadUrl = @"headUrl";
NSString *const kModelUserUserStatus = @"userStatus";
NSString *const kModelUserRealName = @"realName";
NSString *const kModelUserToken = @"token";
NSString *const kModelUserUserType = @"userType";
NSString *const kModelUserNickName = @"nickName";
NSString *const kModelUserAuthStatus = @"authStatus";
NSString *const kModelUserIntroduce = @"introduce";


@interface ModelUser ()
@end

@implementation ModelUser

@synthesize account = _account;
@synthesize userId = _userId;
@synthesize headUrl = _headUrl;
@synthesize userStatus = _userStatus;
@synthesize realName = _realName;
@synthesize token = _token;
@synthesize userType = _userType;
@synthesize nickName = _nickName;

#pragma mark logical show
- (NSString *)authStatusShow{
    switch ((int)self.authStatus) {
        case 1:
            return @"未审核";
            break;
        case 2:
            return @"审核中";
            break;
        case 3:
            return @"审核成功";
            break;
        case 10:
            return @"审核拒绝";
            break;
        default:
            break;
    }
    return @"";
}



#pragma mark initint
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.account = [dict stringValueForKey:kModelUserAccount];
        self.userId = [dict doubleValueForKey:kModelUserUserId];
        self.headUrl = [dict stringValueForKey:kModelUserHeadUrl];
        self.userStatus = [dict doubleValueForKey:kModelUserUserStatus];
        self.realName = [dict stringValueForKey:kModelUserRealName];
        self.token = [dict stringValueForKey:kModelUserToken];
        self.userType = [dict doubleValueForKey:kModelUserUserType];
        self.nickName = [dict stringValueForKey:kModelUserNickName];
        self.authStatus = [dict doubleValueForKey:kModelUserAuthStatus];
        self.introduce = [dict stringValueForKey:kModelUserIntroduce];

        //logical
        self.nickName = isStr(self.nickName)?UnPackStr(self.nickName):UnPackStr(self.account);
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.account forKey:kModelUserAccount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kModelUserUserId];
    [mutableDict setValue:self.headUrl forKey:kModelUserHeadUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userStatus] forKey:kModelUserUserStatus];
    [mutableDict setValue:self.realName forKey:kModelUserRealName];
    [mutableDict setValue:self.token forKey:kModelUserToken];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userType] forKey:kModelUserUserType];
    [mutableDict setValue:self.nickName forKey:kModelUserNickName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.authStatus] forKey:kModelUserAuthStatus];
    [mutableDict setValue:self.introduce forKey:kModelUserIntroduce];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}


@end
