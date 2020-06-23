//
//  RequestApi+Company.h
//  Platform
//
//  Created by 隋林栋 on 2019/12/26.
//  Copyright © 2019 ping. All rights reserved.
//

#import "RequestApi.h"

NS_ASSUME_NONNULL_BEGIN

@interface RequestApi (Company)
/**
 企业列表（用户）
 */
+(void)requestCompanyListWithDelegate:(id <RequestDelegate>)delegate
                              success:(void (^)(NSDictionary * response, id mark))success
                              failure:(void (^)(NSString * errorStr, id mark))failure;

/**
 企业详情
 */
+(void)requestCompanyDetailWithId:(double)identity
                         delegate:(id <RequestDelegate>)delegate
                          success:(void (^)(NSDictionary * response, id mark))success
                          failure:(void (^)(NSString * errorStr, id mark))failure;

/**
 获取车辆审核列表
 */
+(void)requestAuditCarListWithQualificationState:(double)qualificationState
                                            page:(double)page
                                           count:(double)count
                                        delegate:(id <RequestDelegate>)delegate
                                         success:(void (^)(NSDictionary * response, id mark))success
                                         failure:(void (^)(NSString * errorStr, id mark))failure;
/**
 获取车辆审核详情
 */
+(void)requestAuditCarDetailWithID:(double)identity
                             entId:(double)entId
                          delegate:(id <RequestDelegate>)delegate
                           success:(void (^)(NSDictionary * response, id mark))success
                           failure:(void (^)(NSString * errorStr, id mark))failure;
/**
 获取车辆审核记录
 */
+(void)requestAuditCarRecordWithID:(double)vehicleId
                          delegate:(id <RequestDelegate>)delegate
                           success:(void (^)(NSDictionary * response, id mark))success
                           failure:(void (^)(NSString * errorStr, id mark))failure;

/**
 获取车辆审核记录
 */
+(void)requestAuditCarWithID:(double)identity
                             entId:(double)entId
                              type:(double)type
                       description:(NSString *)description
                          delegate:(id <RequestDelegate>)delegate
                           success:(void (^)(NSDictionary * response, id mark))success
                           failure:(void (^)(NSString * errorStr, id mark))failure;

/**
 获取企业审核列表
 */
+(void)requestAuditCompanyListWithQualificationState:(double)qualificationState
                                                page:(double)page
                                               count:(double)count
                                            delegate:(id <RequestDelegate>)delegate
                                             success:(void (^)(NSDictionary * response, id mark))success
                                             failure:(void (^)(NSString * errorStr, id mark))failure;

//获取企业上传的文件
+(void)requestAuditCompanyInfoWithEntId:(double)entId
                               delegate:(id <RequestDelegate>)delegate
                                success:(void (^)(NSDictionary * response, id mark))success
                                failure:(void (^)(NSString * errorStr, id mark))failure;

//获取企业审核记录
+(void)requestAuditCompanyRecordWithEntId:(double)entId
                                 delegate:(id <RequestDelegate>)delegate
                                  success:(void (^)(NSDictionary * response, id mark))success
                                  failure:(void (^)(NSString * errorStr, id mark))failure;

/**
 审核公司
 */
+(void)requestAuditCompanyWithID:(double)identity
                            type:(double)type
                          reason:(NSString *)reason
                        delegate:(id <RequestDelegate>)delegate
                         success:(void (^)(NSDictionary * response, id mark))success
                         failure:(void (^)(NSString * errorStr, id mark))failure;

//查询账户列表
+(void)requestAuditCompanyAccountListWithEntId:(double)entId
                                      delegate:(id <RequestDelegate>)delegate
                                       success:(void (^)(NSDictionary * response, id mark))success
                                       failure:(void (^)(NSString * errorStr, id mark))failure;

/**
 获取司机审核列表
 */
+(void)requestAuditDriverListWithQualificationState:(double)reviewStatus
                                               page:(double)page
                                              count:(double)count
realName:(NSString *)realName
                                           delegate:(id <RequestDelegate>)delegate
                                            success:(void (^)(NSDictionary * response, id mark))success
                                            failure:(void (^)(NSString * errorStr, id mark))failure;

/**
 获取司机审核信息
 */
+(void)requestAuditDriverInfo:(double)identity
                     delegate:(id <RequestDelegate>)delegate
                      success:(void (^)(NSDictionary * response, id mark))success
                      failure:(void (^)(NSString * errorStr, id mark))failure;

//司机审核同意或者拒绝
+(void)requestAuditDriverWithID:(double)identity
                   reviewStatus:(double)reviewStatus
                       realname:(NSString *)realname
                       idNumber:(NSString *)idNumber
                         remark:(NSString *)remark
                       delegate:(id <RequestDelegate>)delegate
                        success:(void (^)(NSDictionary * response, id mark))success
                        failure:(void (^)(NSString * errorStr, id mark))failure;
@end

NS_ASSUME_NONNULL_END
