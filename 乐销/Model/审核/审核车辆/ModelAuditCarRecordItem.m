//
//  ModelAuditCarRecordItem.m
//
//  Created by 林栋 隋 on 2019/12/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "ModelAuditCarRecordItem.h"


NSString *const kModelAuditCarRecordItemSubmitterName = @"submitterName";
NSString *const kModelAuditCarRecordItemState = @"state";
NSString *const kModelAuditCarRecordItemReviewTime = @"reviewTime";
NSString *const kModelAuditCarRecordItemId = @"id";
NSString *const kModelAuditCarRecordItemSubmitTime = @"submitTime";
NSString *const kModelAuditCarRecordItemSubmitterId = @"submitterId";
NSString *const kModelAuditCarRecordItemDescription = @"description";
NSString *const kModelAuditCarRecordItemVehicleId = @"vehicleId";
NSString *const kModelAuditCarRecordItemReviewerId = @"reviewerId";
NSString *const kModelAuditCarRecordItemCreateTime = @"createTime";


@interface ModelAuditCarRecordItem ()
@end

@implementation ModelAuditCarRecordItem

@synthesize submitterName = _submitterName;
@synthesize state = _state;
@synthesize reviewTime = _reviewTime;
@synthesize iDProperty = _iDProperty;
@synthesize submitTime = _submitTime;
@synthesize submitterId = _submitterId;
@synthesize iDPropertyDescription = _iDPropertyDescription;
@synthesize vehicleId = _vehicleId;
@synthesize reviewerId = _reviewerId;
@synthesize createTime = _createTime;


#pragma mark init
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.submitterName = [dict stringValueForKey:kModelAuditCarRecordItemSubmitterName];
            self.state = [dict doubleValueForKey:kModelAuditCarRecordItemState];
            self.reviewTime = [dict doubleValueForKey:kModelAuditCarRecordItemReviewTime];
            self.iDProperty = [dict doubleValueForKey:kModelAuditCarRecordItemId];
            self.submitTime = [dict doubleValueForKey:kModelAuditCarRecordItemSubmitTime];
            self.submitterId = [dict doubleValueForKey:kModelAuditCarRecordItemSubmitterId];
            self.iDPropertyDescription = [dict stringValueForKey:kModelAuditCarRecordItemDescription];
            self.vehicleId = [dict doubleValueForKey:kModelAuditCarRecordItemVehicleId];
            self.reviewerId = [dict doubleValueForKey:kModelAuditCarRecordItemReviewerId];
            self.createTime = [dict doubleValueForKey:kModelAuditCarRecordItemCreateTime];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.submitterName forKey:kModelAuditCarRecordItemSubmitterName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.state] forKey:kModelAuditCarRecordItemState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reviewTime] forKey:kModelAuditCarRecordItemReviewTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iDProperty] forKey:kModelAuditCarRecordItemId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.submitTime] forKey:kModelAuditCarRecordItemSubmitTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.submitterId] forKey:kModelAuditCarRecordItemSubmitterId];
    [mutableDict setValue:self.iDPropertyDescription forKey:kModelAuditCarRecordItemDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vehicleId] forKey:kModelAuditCarRecordItemVehicleId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reviewerId] forKey:kModelAuditCarRecordItemReviewerId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createTime] forKey:kModelAuditCarRecordItemCreateTime];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}


@end
