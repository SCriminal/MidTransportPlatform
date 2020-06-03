//
//  AuditDao.h
//  Platform
//
//  Created by 隋林栋 on 2019/12/27.
//Copyright © 2019 ping. All rights reserved.

#import <Foundation/Foundation.h>

@interface AuditDao : NSObject

+ (CGFloat)addDetailSubView:(NSArray *)aryBtns inView:(UIView *)viewSuper title:(NSString *)title;

@end


@interface AuditDetailImageView : UIView
@property (nonatomic, strong) NSArray *aryImages;

#pragma mark 刷新view
- (void)resetViewWithAryModels:(NSArray *)aryImages;
@end


@interface AuditDetailBottomView : UIView
//属性
@property (strong, nonatomic) UIButton *btnReject;
@property (strong, nonatomic) UIButton *btnAgree;
@property (nonatomic, strong) void (^blockReject)(void);
@property (nonatomic, strong) void (^blockAgree)(void);

@end

@interface AuditDetailRecordView : UIView
@property (nonatomic, strong) NSArray *aryDatas;

#pragma mark 刷新view
- (void)resetViewWithAuditCarAryModels:(NSArray *)aryDatas;
- (void)resetViewWithAuditDriverAryModels:(NSArray *)aryDatas;

@end
