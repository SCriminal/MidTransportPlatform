//
//  RequestApi+Company.m
//  Platform
//
//  Created by 隋林栋 on 2019/12/26.
//  Copyright © 2019 ping. All rights reserved.
//

#import "RequestApi+Company.h"

@implementation RequestApi (Company)

/**
 企业列表（用户）
 */
+(void)requestCompanyListWithDelegate:(id <RequestDelegate>)delegate
                              success:(void (^)(NSDictionary * response, id mark))success
                              failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{};
    [self getUrl:@"/zhongcheyun/ent/list/option" delegate:delegate parameters:dic success:success failure:failure];
}


/**
 企业详情
 */
+(void)requestCompanyDetailWithId:(double)identity
                         delegate:(id <RequestDelegate>)delegate
                          success:(void (^)(NSDictionary * response, id mark))success
                          failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity)};
    [self getUrl:@"/zhongcheyun/ent/{id}" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 获取企业审核列表
 */
+(void)requestAuditCompanyListWithQualificationState:(double)qualificationState
                                                page:(double)page
                                               count:(double)count
                                            delegate:(id <RequestDelegate>)delegate
                                             success:(void (^)(NSDictionary * response, id mark))success
                                             failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"qualificationState":NSNumber.dou(qualificationState),
                          @"page":NSNumber.dou(page),
                          @"count":NSNumber.dou(count)};
    [self getUrl:@"/zhongcheyun/ent/list" delegate:delegate parameters:dic success:success failure:failure];
}

//获取企业上传的文件
+(void)requestAuditCompanyInfoWithEntId:(double)entId
                               delegate:(id <RequestDelegate>)delegate
                                success:(void (^)(NSDictionary * response, id mark))success
                                failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"entId":NSNumber.dou(entId)};
    [self getUrl:@"/zhongcheyun/ent/1_0_10/file" delegate:delegate parameters:dic success:success failure:failure];
}

//获取企业审核记录
+(void)requestAuditCompanyRecordWithEntId:(double)entId
                                 delegate:(id <RequestDelegate>)delegate
                                  success:(void (^)(NSDictionary * response, id mark))success
                                  failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"entId":NSNumber.dou(entId)};
    [self getUrl:@"/zhongcheyun/ent/qualification/list" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 审核公司
 */
+(void)requestAuditCompanyWithID:(double)identity
                        type:(double)type
                 reason:(NSString *)reason
                    delegate:(id <RequestDelegate>)delegate
                     success:(void (^)(NSDictionary * response, id mark))success
                     failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity),
                          @"type":NSNumber.dou(type),
                          @"reason":RequestStrKey(reason)
                          };
    [self patchUrl:@"/admin/ent/1_0_20/review/{id}" delegate:delegate parameters:dic success:success failure:failure];
}


/**
 获取车辆审核列表
 */
+(void)requestAuditCarListWithQualificationState:(double)qualificationState
                                            page:(double)page
                                           count:(double)count
                                        delegate:(id <RequestDelegate>)delegate
                                         success:(void (^)(NSDictionary * response, id mark))success
                                         failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"qualificationState":NSNumber.dou(qualificationState),
                          @"page":NSNumber.dou(page),
                          @"count":NSNumber.dou(count)};
    [self getUrl:@"/zhongcheyun/vehicle/review/list/total" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 获取车辆审核详情
 */
+(void)requestAuditCarDetailWithID:(double)identity
                             entId:(double)entId
                          delegate:(id <RequestDelegate>)delegate
                           success:(void (^)(NSDictionary * response, id mark))success
                           failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity),
                          @"entId":NSNumber.dou(entId)};
    [self getUrl:@"/zhongcheyun/vehicle/1_0_10/{id}" delegate:delegate parameters:dic success:success failure:failure];
}
/**
 获取车辆审核记录
 */
+(void)requestAuditCarRecordWithID:(double)vehicleId
                          delegate:(id <RequestDelegate>)delegate
                           success:(void (^)(NSDictionary * response, id mark))success
                           failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"vehicleId":NSNumber.dou(vehicleId)};
    [self getUrl:@"/zhongcheyun/vehicle/qulification/list" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 审核车辆
 */
+(void)requestAuditCarWithID:(double)identity
                       entId:(double)entId
                        type:(double)type
                 description:(NSString *)description
                    delegate:(id <RequestDelegate>)delegate
                     success:(void (^)(NSDictionary * response, id mark))success
                     failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity),
                          @"entId":NSNumber.dou(entId),
                          @"type":NSNumber.dou(type),
                          @"description":RequestStrKey(description)
                          };
    [self patchUrl:@"/zhongcheyun/vehicle/review/{id}" delegate:delegate parameters:dic success:success failure:failure];
}




//查询账户列表
+(void)requestAuditCompanyAccountListWithEntId:(double)entId
                                 delegate:(id <RequestDelegate>)delegate
                                  success:(void (^)(NSDictionary * response, id mark))success
                                  failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"entId":NSNumber.dou(entId)};
    [self getUrl:@"/admin/invoice/ent/1_0_15/list/total" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 获取司机审核列表
 */
+(void)requestAuditDriverListWithQualificationState:(double)reviewStatus
                                               page:(double)page
                                              count:(double)count
                                           delegate:(id <RequestDelegate>)delegate
                                            success:(void (^)(NSDictionary * response, id mark))success
                                            failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"reviewStatus":NSNumber.dou(reviewStatus),
                          @"page":NSNumber.dou(page),
                          @"count":NSNumber.dou(count)};
    [self getUrl:@"/ums/user/platform/review/list" delegate:delegate parameters:dic success:success failure:failure];
}

/**
 获取司机审核信息
 */
+(void)requestAuditDriverInfo:(double)identity
                     delegate:(id <RequestDelegate>)delegate
                      success:(void (^)(NSDictionary * response, id mark))success
                      failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity)};
    [self getUrl:@"/ums/user/platform/1_8_4/review/{id}" delegate:delegate parameters:dic success:success failure:failure];
}
//司机审核同意或者拒绝
+(void)requestAuditDriverWithID:(double)identity
                   reviewStatus:(double)reviewStatus
                       realname:(NSString *)realname
                       idNumber:(NSString *)idNumber
                         remark:(NSString *)remark
                       delegate:(id <RequestDelegate>)delegate
                        success:(void (^)(NSDictionary * response, id mark))success
                        failure:(void (^)(NSString * errorStr, id mark))failure{
    NSDictionary *dic = @{@"id":NSNumber.dou(identity),
                          @"reviewStatus":NSNumber.dou(reviewStatus),
                          @"realname":RequestStrKey(realname),
                          @"idNumber":RequestStrKey(idNumber),
                          @"remark":RequestStrKey(remark)
                          };
    [self patchUrl:@"/ums/user/platform/status/review/{id}" delegate:delegate parameters:dic success:success failure:failure];
}


@end
