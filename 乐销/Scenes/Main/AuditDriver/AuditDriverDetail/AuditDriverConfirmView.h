//
//  ScheduleConfirmView.h


#import <UIKit/UIKit.h>

@interface AuditDriverConfirmView : UIView

@property (nonatomic, strong) UIView *viewBG;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UIImageView *ivClose;
@property (nonatomic, strong) UIView *viewNameBorder;
@property (nonatomic, strong) UITextField *tfName;
@property (nonatomic, strong) UIView *viewNumberBorder;
@property (nonatomic, strong) UITextField *tfNumber;
@property (nonatomic, strong) UIButton *btnSubmit;
@property (nonatomic, strong) void (^blockComplete)(NSString *name,NSString*identity);
@property (nonatomic, strong) NSMutableArray *aryDatas;


#pragma mark 刷新view
- (void)resetViewWithName:(NSString *)name number:(NSString *)number;
- (void)show;

@end

