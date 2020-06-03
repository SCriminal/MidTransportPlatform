//
//  ScheduleConfirmView.h


#import <UIKit/UIKit.h>
//
#import "PlaceHolderTextView.h"

@interface CancelAttachView : UIView
@property (nonatomic, strong) UIView *viewBG;
@property (nonatomic, strong) UILabel *labelTitle;
@property (nonatomic, strong) UIImageView *ivClose;
@property (nonatomic, strong) UIView *viewBorder;
@property (nonatomic, strong) PlaceHolderTextView *tfReason;
@property (nonatomic, strong) UIButton *btnSubmit;
@property (nonatomic, strong) void (^blockComplete)(NSString*reason);
- (void)resetViewWithModel:(ModelBaseData *)model;
- (void)show;

@end

