//
//  ModelAuditDriverRecordItem.m
//
//  Created by 林栋 隋 on 2019/12/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "ModelAuditDriverRecordItem.h"


NSString *const kModelAuditDriverRecordItemStatus = @"status";
NSString *const kModelAuditDriverRecordItemUserId = @"userId";
NSString *const kModelAuditDriverRecordItemReviewTime = @"reviewTime";
NSString *const kModelAuditDriverRecordItemId = @"id";
NSString *const kModelAuditDriverRecordItemExplain = @"explain";
NSString *const kModelAuditDriverRecordItemSubmitTime = @"submitTime";
NSString *const kModelAuditDriverRecordItemReviewId = @"reviewId";


@interface ModelAuditDriverRecordItem ()
@end

@implementation ModelAuditDriverRecordItem

@synthesize status = _status;
@synthesize userId = _userId;
@synthesize reviewTime = _reviewTime;
@synthesize iDProperty = _iDProperty;
@synthesize explain = _explain;
@synthesize submitTime = _submitTime;
@synthesize reviewId = _reviewId;


#pragma mark init
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [dict doubleValueForKey:kModelAuditDriverRecordItemStatus];
            self.userId = [dict doubleValueForKey:kModelAuditDriverRecordItemUserId];
            self.reviewTime = [dict doubleValueForKey:kModelAuditDriverRecordItemReviewTime];
            self.iDProperty = [dict doubleValueForKey:kModelAuditDriverRecordItemId];
            self.explain = [dict stringValueForKey:kModelAuditDriverRecordItemExplain];
            self.submitTime = [dict doubleValueForKey:kModelAuditDriverRecordItemSubmitTime];
            self.reviewId = [dict doubleValueForKey:kModelAuditDriverRecordItemReviewId];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kModelAuditDriverRecordItemStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kModelAuditDriverRecordItemUserId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reviewTime] forKey:kModelAuditDriverRecordItemReviewTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iDProperty] forKey:kModelAuditDriverRecordItemId];
    [mutableDict setValue:self.explain forKey:kModelAuditDriverRecordItemExplain];
    [mutableDict setValue:[NSNumber numberWithDouble:self.submitTime] forKey:kModelAuditDriverRecordItemSubmitTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reviewId] forKey:kModelAuditDriverRecordItemReviewId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}


@end
