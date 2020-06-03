//
//  AuditCarListVC.m
//  Driver
//
//  Created by 隋林栋 on 2019/4/11.
//Copyright © 2019 ping. All rights reserved.
//

#import "AuditCarListVC.h"
//cell
#import "AuditCarListCell.h"
//request
#import "RequestApi+Company.h"
//detail
#import "AuditCarDetailVC.h"

@interface AuditCarListVC ()

@end

@implementation AuditCarListVC
@synthesize noResultView = _noResultView;
#pragma mark noresult view
- (BOOL)isShowNoResult{
    return true;
}
- (NoResultView *)noResultView{
    if (!_noResultView) {
        _noResultView = [NoResultView new];
        [_noResultView resetWithImageName:@"empty_audit_list" title:@"暂无审核信息"];
    }
    return _noResultView;
}

#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableBackgroundView.backgroundColor = [UIColor clearColor];
    //table
    [self.tableView registerClass:[AuditCarListCell class] forCellReuseIdentifier:@"AuditCarListCell"];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.backgroundColor = [UIColor clearColor];
    [self addRefreshHeader];
    [self addRefreshFooter];
    //notice
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshHeaderAll) name:NOTICE_AUDIT_CAR object:nil];
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
    AuditCarListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AuditCarListCell"];
    ModelAuditCar * model = self.aryDatas[indexPath.row];
    [cell resetCellWithModel:model];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ModelAttaceedCompany * model = self.aryDatas[indexPath.row];
    return [AuditCarListCell fetchHeight:model];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AuditCarDetailVC * detailVC = [AuditCarDetailVC new];
    detailVC.modelCar = self.aryDatas[indexPath.row];
    [GB_Nav pushViewController:detailVC animated:true];
}
#pragma mark request
- (void)requestList{
    [RequestApi requestAuditCarListWithQualificationState:self.qualificationStates page:self.pageNum count:50 delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        self.pageNum ++;
        NSMutableArray  * aryRequest = [GlobalMethod exchangeDic:[response arrayValueForKey:@"list"] toAryWithModelName:@"ModelAuditCar"];
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
