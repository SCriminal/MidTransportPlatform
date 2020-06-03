//
//  AuditCompanyListVC.m
//  Driver
//
//  Created by 隋林栋 on 2019/4/11.
//Copyright © 2019 ping. All rights reserved.
//

#import "AuditCompanyListVC.h"
//cell
#import "AuditCompanyListCell.h"
//request
#import "RequestApi+Company.h"
//detail
#import "AuditCompanyDetailVC.h"

@interface AuditCompanyListVC ()

@end

@implementation AuditCompanyListVC
@synthesize noResultView = _noResultView;
#pragma mark noresult view
- (BOOL)isShowNoResult{
    return true;
}
- (NoResultView *)noResultView{
    if (!_noResultView) {
        _noResultView = [NoResultView new];
        [_noResultView resetWithImageName:@"empty_motorcade_default" title:@"暂无审核信息"];
    }
    return _noResultView;
}

#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableBackgroundView.backgroundColor = [UIColor clearColor];
    //notice
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshHeaderAll) name:NOTICE_AUDIT_COMPANY object:nil];

    //table
    [self.tableView registerClass:[AuditCompanyListCell class] forCellReuseIdentifier:@"AuditCompanyListCell"];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.backgroundColor = [UIColor clearColor];
    [self addRefreshHeader];
    [self addRefreshFooter];
    //request
    [self requestList];
}

#pragma mark UITableViewDelegate
//row num
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.aryDatas.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AuditCompanyListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AuditCompanyListCell"];
    ModelAuditCompany * model = self.aryDatas[indexPath.row];
    [cell resetCellWithModel:model];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ModelAttaceedCompany * model = self.aryDatas[indexPath.row];
    return [AuditCompanyListCell fetchHeight:model];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AuditCompanyDetailVC * detail = [AuditCompanyDetailVC new];
    detail.modelCompany = self.aryDatas[indexPath.row];
    [GB_Nav pushViewController:detail animated:true];
}
#pragma mark request
- (void)requestList{
    [RequestApi requestAuditCompanyListWithQualificationState:self.qualificationStates page:self.pageNum count:50 delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        self.pageNum ++;
        NSMutableArray  * aryRequest = [GlobalMethod exchangeDic:response toAryWithModelName:@"ModelAuditCompany"];
        if (self.isRemoveAll) {
            [self.aryDatas removeAllObjects];
        }
        if (!isAry(aryRequest)) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        [self.aryDatas addObjectsFromArray:aryRequest];
        [self.tableView reloadData];
    } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
}
@end
