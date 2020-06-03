//
//  AuditDriverListVC.m
//  Driver
//
//  Created by 隋林栋 on 2019/4/11.
//Copyright © 2019 ping. All rights reserved.
//

#import "AuditDriverListVC.h"
//cell
#import "AuditDriverListCell.h"
//request
#import "RequestApi+Company.h"
//detail
#import "AuditDriverDetailVC.h"

@interface AuditDriverListVC ()

@end

@implementation AuditDriverListVC
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
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshHeaderAll) name:NOTICE_AUDIT_DRIVER object:nil];

    //table
    [self.tableView registerClass:[AuditDriverListCell class] forCellReuseIdentifier:@"AuditDriverListCell"];
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
    AuditDriverListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AuditDriverListCell"];
    ModelAuditDriver * model = self.aryDatas[indexPath.row];
    [cell resetCellWithModel:model];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ModelAttaceedCompany * model = self.aryDatas[indexPath.row];
    return [AuditDriverListCell fetchHeight:model];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AuditDriverDetailVC * detail = [AuditDriverDetailVC new];
    detail.modelDriver = self.aryDatas[indexPath.row];
    [GB_Nav pushViewController:detail animated:true];
}
#pragma mark request
- (void)requestList{
    [RequestApi requestAuditDriverListWithQualificationState:self.qualificationStates page:self.pageNum count:50 delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
        self.pageNum ++;
        NSMutableArray  * aryRequest = [GlobalMethod exchangeDic:response toAryWithModelName:@"ModelAuditDriver"];
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
