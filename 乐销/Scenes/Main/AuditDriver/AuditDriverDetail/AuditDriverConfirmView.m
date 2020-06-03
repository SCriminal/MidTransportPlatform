//
//  AuditDriverConfirmView.m
//  Driver
//
//  Created by 隋林栋 on 2019/4/17.
//Copyright © 2019 ping. All rights reserved.
//

#import "AuditDriverConfirmView.h"
//list view
#import "UITextField+Text.h"

@interface AuditDriverConfirmView ()<UITextFieldDelegate>
@end

@implementation AuditDriverConfirmView

#pragma mark 懒加载
- (UIView *)viewBG{
    if (_viewBG == nil) {
        _viewBG = [UIView new];
        _viewBG.backgroundColor = [UIColor whiteColor];
        [GlobalMethod setRoundView:_viewBG color:[UIColor clearColor] numRound:10 width:0];
    }
    return _viewBG;
}
- (UILabel *)labelTitle{
    if (_labelTitle == nil) {
        _labelTitle = [UILabel new];
        _labelTitle.textColor = COLOR_333;
        _labelTitle.font =  [UIFont systemFontOfSize:F(17) weight:UIFontWeightRegular];
        [_labelTitle fitTitle:@"确认审核通过" variable:0];
    }
    return _labelTitle;
}
- (UIImageView *)ivClose{
    if (_ivClose == nil) {
        _ivClose = [UIImageView new];
        _ivClose.image = [UIImage imageNamed:@"inputClose"];
        _ivClose.widthHeight = XY(W(25),W(25));
    }
    return _ivClose;
}

- (UIView *)viewNameBorder{
    if (_viewNameBorder == nil) {
        _viewNameBorder = [UIView new];
        _viewNameBorder.backgroundColor = [UIColor clearColor];
        [GlobalMethod setRoundView:_viewNameBorder color:COLOR_LINE numRound:5 width:1];
        _viewNameBorder.widthHeight = XY(W(275), W(45));
    }
    return _viewNameBorder;
}
- (UITextField *)tfName{
    if (_tfName == nil) {
        _tfName = [UITextField new];
        _tfName.font = [UIFont systemFontOfSize:F(15)];
        _tfName.textAlignment = NSTextAlignmentLeft;
        _tfName.textColor = COLOR_333;
        _tfName.borderStyle = UITextBorderStyleNone;
        _tfName.backgroundColor = [UIColor clearColor];
        _tfName.delegate = self;
        _tfName.placeholder = @"司机姓名";
        
    }
    return _tfName;
}

- (UIView *)viewNumberBorder{
    if (_viewNumberBorder == nil) {
        _viewNumberBorder = [UIView new];
        _viewNumberBorder.backgroundColor = [UIColor clearColor];
        [GlobalMethod setRoundView:_viewNumberBorder color:COLOR_LINE numRound:5 width:1];
        _viewNumberBorder.widthHeight = XY(W(275), W(45));
    }
    return _viewNumberBorder;
}
- (UITextField *)tfNumber{
    if (_tfNumber == nil) {
        _tfNumber = [UITextField new];
        _tfNumber.font = [UIFont systemFontOfSize:F(15)];
        _tfNumber.textAlignment = NSTextAlignmentLeft;
        _tfNumber.textColor = COLOR_333;
        _tfNumber.borderStyle = UITextBorderStyleNone;
        _tfNumber.backgroundColor = [UIColor clearColor];
        _tfNumber.delegate = self;
        _tfNumber.placeholder = @"驾驶证号";
        
    }
    return _tfNumber;
}

-(UIButton *)btnSubmit{
    if (_btnSubmit == nil) {
        _btnSubmit = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnSubmit.backgroundColor = [UIColor clearColor];
        _btnSubmit.titleLabel.font = [UIFont systemFontOfSize:F(15)];
        [_btnSubmit setTitle:@"确认" forState:(UIControlStateNormal)];
        [_btnSubmit setTitleColor:COLOR_BLUE forState:UIControlStateNormal];
        [_btnSubmit addTarget:self action:@selector(btnSubmitClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnSubmit;
}

#pragma mark 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.widthHeight = XY(SCREEN_WIDTH, SCREEN_HEIGHT);
        [self addSubView];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification  object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification  object:nil];
        
    }
    return self;
}
//添加subview
- (void)addSubView{
    [self addSubview:self.viewBG];
    [self.viewBG addSubview:self.labelTitle];
    [self.viewBG addSubview:self.ivClose];
    [self.viewBG addSubview:self.viewNameBorder];
    [self.viewBG addSubview:self.tfName];
    [self.viewBG addSubview:self.viewNumberBorder];
    [self.viewBG addSubview:self.tfNumber];
    [self.viewBG addSubview:self.btnSubmit];
    
}

#pragma mark 刷新view
- (void)resetViewWithName:(NSString *)name number:(NSString *)number{
    [self removeSubViewWithTag:TAG_LINE];//移除线
    //刷新view
    self.viewBG.widthHeight = XY(W(315), W(268));
    self.viewBG.centerXTop = XY(SCREEN_WIDTH/2.0,MIN(SCREEN_HEIGHT/2.0-W(203)/2.0, W(167)));
    
    self.labelTitle.centerXTop = XY(self.viewBG.width/2.0,W(25));
    
    self.ivClose.rightTop = XY(self.viewBG.width - W(16),W(21));
    [self.viewBG addControlFrame:CGRectInset(self.ivClose.frame, -W(20), -W(20)) belowView:self.ivClose target:self action:@selector(closeClick)];
    
    self.viewNameBorder.centerXTop = XY(self.viewBG.width/2.0, W(77));
    self.tfName.widthHeight = XY(self.viewNameBorder.width - W(30),self.viewNameBorder.height);
    self.tfName.leftCenterY = XY(self.viewNameBorder.left + W(15),self.viewNameBorder.centerY);
    if (isStr(name)) {
        self.tfName.text = name;
    }
    
    self.viewNumberBorder.centerXTop =  XY(self.viewBG.width/2.0,W(142));
    self.tfNumber.widthHeight = XY(self.viewNumberBorder.width - W(30),self.viewNumberBorder.height);
    self.tfNumber.leftCenterY = XY(self.viewNumberBorder.left + W(15),self.viewNumberBorder.centerY);
    if (isStr(number)) {
        self.tfNumber.text = number;
    }
    
    [self.viewBG addLineFrame:CGRectMake(0, self.viewBG.height - W(55), self.viewBG.width, 1)];
    
    self.btnSubmit.widthHeight = XY(self.viewBG.width,W(55));
    self.btnSubmit.centerXBottom = XY(self.viewBG.width/2.0,self.viewBG.height);
}
#pragma mark keyboard
- (void)keyboardShow:(NSNotification *)notice{
    [UIView animateWithDuration:0.3 animations:^{
        self.viewBG.top = MIN(SCREEN_HEIGHT/2.0-W(203)/2.0, W(107));
    }];
}

- (void)keyboardHide:(NSNotification *)notice{
    [UIView animateWithDuration:0.3 animations:^{
        self.viewBG.top = MIN(SCREEN_HEIGHT/2.0-W(203)/2.0, W(167));
    }];
}
#pragma mark text delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [GlobalMethod endEditing];
    return true;
}

#pragma mark 销毁
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma mark click
- (void)closeClick{
    [GlobalMethod endEditing];
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)show{
    self.alpha = 1;
    [GB_Nav.lastVC.view addSubview:self];
}


- (void)btnSubmitClick{
    if (self.blockComplete) {
        if (!self.tfName.text.length) {
            [GlobalMethod showAlert:@"请填写司机姓名"];
            return;
        }
        if (!self.tfNumber.text.length) {
            [GlobalMethod showAlert:@"请填写驾驶证号"];
            return;
        }
        self.blockComplete(self.tfName.text,self.tfNumber.text);
    }
    [GlobalMethod endEditing];
    [self removeFromSuperview];
}
@end
