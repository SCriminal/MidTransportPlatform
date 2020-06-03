//
//  AuditCarDetailView.h
//  Motorcade
//
//  Created by 隋林栋 on 2019/12/3.
//Copyright © 2019 ping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuditCompanyDetailView : UIView

#pragma mark 刷新view
- (void)resetViewWithModel:(ModelAuditCompany *)model;

@end



@interface AuditDetailAccountView : UIView
@property (nonatomic, strong) NSArray *aryDatas;

#pragma mark 刷新view
- (void)resetViewWithAryModels:(NSArray *)aryDatas;

@end
