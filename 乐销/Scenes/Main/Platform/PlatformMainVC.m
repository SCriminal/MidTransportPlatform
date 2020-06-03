//
//  PlatformMainVC.m
//中车运
//
//  Created by 隋林栋 on 2018/10/28.
//Copyright © 2018年 ping. All rights reserved.
//

#import "PlatformMainVC.h"

//deck view
#import "UIViewController+IIViewDeckAdditions.h"
#import "IIViewDeckController.h"
//cell
#import "PlatformCollectionCell.h"
@interface PlatformMainVC ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) BaseNavView *nav;
@property (nonatomic, strong) UIImageView *ivHead;
@property (nonatomic, strong) UIControl *conHead;
//collection view
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * aryDatas;//data
@property (nonatomic, strong) UILongPressGestureRecognizer * longPress;
@property (nonatomic, readonly) NSString * cellClassName;
@property (nonatomic, assign) CGSize cellSize;


@end

@implementation PlatformMainVC
@synthesize aryDatas = _aryDatas;

#pragma mark - 懒加载
- (NSMutableArray *)aryDatas {
    if (_aryDatas == nil) {
        _aryDatas = @[^(){
            ModelBtn * model = [ModelBtn new];
            model.imageName = @"main_icon_company";
            model.title = @"企业审核";
            model.blockClick = ^{
                [GB_Nav pushVCName:@"AuditCompanyListManagementVC" animated:true];
            };
            return model;
        }(),^(){
            ModelBtn * model = [ModelBtn new];
            model.imageName = @"main_icon_driver";
            model.title = @"司机审核";
            model.blockClick = ^{
                [GB_Nav pushVCName:@"AuditDriverListManagementVC" animated:true];
            };
            return model;
        }(),^(){
            ModelBtn * model = [ModelBtn new];
            model.imageName = @"main_icon_car";
            model.title = @"车辆审核";
            model.blockClick = ^{
                [GB_Nav pushVCName:@"AuditCarListManagementVC" animated:true];
            };
            return model;
        }()].mutableCopy;
    }
    return  _aryDatas;
}

- (NSString *)cellClassName {
    return @"PlatformCollectionCell";
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        // 1.流水布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = W(1);
        layout.minimumLineSpacing = W(10);
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.itemSize = [self fetchCollectionCellSize];
        
        //设定滚动方向，有UICollectionViewScrollDirectionVertical和UICollectionViewScrollDirectionHorizontal两个值。
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        // 6.创建UICollectionView
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, NAVIGATIONBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT- NAVIGATIONBAR_HEIGHT) collectionViewLayout:layout];
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);

        // 7.设置collectionView的背景色
        _collectionView.backgroundColor = [UIColor clearColor];
        // 8.设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = false;
        // 9.注册cell(告诉collectionView将来创建怎样的cell)
        [_collectionView registerClass:NSClassFromString(self.cellClassName) forCellWithReuseIdentifier:self.cellClassName];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"foot"];
        
//        [_collectionView addGestureRecognizer:self.longPress];
    }
    return _collectionView;
}
- (UILongPressGestureRecognizer *)longPress{
    if (!_longPress) {
        _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lonePressMoving:)];
    }
    return _longPress;
}


- (UIImageView *)ivHead{
    if (!_ivHead) {
        _ivHead = [UIImageView new];
        _ivHead.backgroundColor = [UIColor clearColor];
        _ivHead.widthHeight = XY(W(30), W(30));
        [GlobalMethod setRoundView:_ivHead color:[UIColor clearColor] numRound:_ivHead.width/2.0 width:0];
        [_ivHead sd_setImageWithURL:[NSURL URLWithString:[GlobalData sharedInstance].GB_UserModel.headUrl] placeholderImage:[UIImage imageNamed:IMAGE_HEAD_DEFAULT]];
    }
    return _ivHead;
}
- (UIControl *)conHead {
    if (!_conHead) {
        _conHead = [UIControl new];
        _conHead.frame = CGRectMake(0, STATUSBAR_HEIGHT, W(100), NAVIGATIONBAR_HEIGHT - STATUSBAR_HEIGHT);
        [_conHead addSubview:self.ivHead];
        self.ivHead.leftCenterY = XY(W(20), _conHead.height/2.0);
        [_conHead addTarget:self action:@selector(headClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _conHead;
}

- (BaseNavView *)nav{
    if (!_nav) {
        _nav = [BaseNavView initNavTitle:@"办公桌面" leftView:self.conHead rightView:nil];
        _nav.line.hidden = false;
    }
    return _nav;
}
#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewBG.backgroundColor = [UIColor whiteColor];
    //添加导航栏
    [self addNav];
    [self.view addSubview:self.collectionView];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reconfigView) name:NOTICE_SELFMODEL_CHANGE object:nil];
    //request extend token
    [GlobalMethod requestExtendToken];
}

#pragma mark refonfig view
- (void)reconfigView{
    [self.ivHead sd_setImageWithURL:[NSURL URLWithString:[GlobalData sharedInstance].GB_UserModel.headUrl] placeholderImage:[UIImage imageNamed:IMAGE_HEAD_DEFAULT]];
}
#pragma mark click
- (void)headClick{
    [self.viewDeckController openSide:IIViewDeckSideLeft animated:YES];
}

#pragma mark 添加导航栏
- (void)addNav{
    [self.view addSubview:self.nav];
}

#pragma mark status bar
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

#pragma mark - UICollectionView数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.aryDatas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ModelBtn *model = self.aryDatas[indexPath.item];
    // 1.获得cell
    PlatformCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellClassName forIndexPath:indexPath];
    [cell resetViewWithModel:model];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ModelBtn *model = self.aryDatas[indexPath.item];
    if (model.blockClick) {
        model.blockClick();
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH,  CGFLOAT_MIN);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGSize cellSize = [self fetchCollectionCellSize];
    CGFloat height =  SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT - (cellSize.height);
    return CGSizeMake(SCREEN_WIDTH,  height + W(10));
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView * view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
        return view;
    }
    UICollectionReusableView * view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"foot" forIndexPath:indexPath];
    return view;
}

- (CGSize)fetchCollectionCellSize{
    if (self.cellSize.width == 0) {
        PlatformCollectionCell * cellTest = [NSClassFromString(self.cellClassName) new];
        [cellTest resetViewWithModel:nil];
        self.cellSize = CGSizeMake(cellTest.width, cellTest.height);
    }
    return self.cellSize;
}

#pragma mark - 长按手势
- (void)lonePressMoving:(UILongPressGestureRecognizer *)longPress{
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan: {
            {
                NSIndexPath *selectIndexPath = [self.collectionView indexPathForItemAtPoint:[longPress locationInView:self.collectionView]];
                [self.collectionView beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            [self.collectionView updateInteractiveMovementTargetPosition:[longPress locationInView:longPress.view]];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            [self.collectionView endInteractiveMovement];
            break;
        }
        default: [self.collectionView cancelInteractiveMovement];
            break;
    }
}

#pragma mark move collection item
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath
{
    id objc = [self.aryDatas objectAtIndex:sourceIndexPath.item];
    //从资源数组中移除该数据
    [self.aryDatas removeObject:objc];
    //将数据插入到资源数组中的目标位置上
    [self.aryDatas insertObject:objc atIndex:destinationIndexPath.item];
    [self performSelector:@selector(reload) withObject:nil afterDelay:0.5];
}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

@end
