//
//  ModelAuditCarRecordItem.h
//
//  Created by 林栋 隋 on 2019/12/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ModelAuditCarRecordItem : NSObject

@property (nonatomic, strong) NSString *submitterName;
@property (nonatomic, assign) double state;
@property (nonatomic, assign) double reviewTime;
@property (nonatomic, assign) double iDProperty;
@property (nonatomic, assign) double submitTime;
@property (nonatomic, assign) double submitterId;
@property (nonatomic, strong) NSString *iDPropertyDescription;
@property (nonatomic, assign) double vehicleId;
@property (nonatomic, assign) double reviewerId;
@property (nonatomic, assign) double createTime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
