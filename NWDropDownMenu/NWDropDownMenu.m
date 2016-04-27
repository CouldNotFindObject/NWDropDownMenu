//
//  NWDropDownMenu.m
//  NWDropDownMenu
//
//  Created by 佟锡杰 on 16/4/27.
//  Copyright © 2016年 tongxijie. All rights reserved.
//

#import "NWDropDownMenu.h"

@interface NWDropDownMenu ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, assign) BOOL isShown;
@property (nonatomic, assign) BOOL animating;
@end

@implementation NWDropDownMenu

- (instancetype)initWithDelegate:(id<NWDropDownMenuDelegate>)delegate
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"NWDropDownMenu" owner:self options:nil] objectAtIndex:0];
        self.frame = CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, 0);
        [self layoutIfNeeded];
        self.delegate = delegate;
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        self.backView.backgroundColor = [UIColor blackColor];
        self.backView.alpha = 0.4;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOrHide)];
        [self.backView addGestureRecognizer:tap];
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)showOrHide
{
    if (_animating == YES) {
        return ;
    }
    if (_isShown) {
        __weak NWDropDownMenu *weakSelf = self;
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.frame = CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, 0);
        } completion:^(BOOL finished) {
            if (finished) {
                _isShown = NO;
                _animating = NO;
                [weakSelf.backView removeFromSuperview];
                [weakSelf removeFromSuperview];
            }
        }];
        _animating = YES;
    } else {
        self.frame = CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, 0);
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self.backView];
        [window addSubview:self];
        __weak NWDropDownMenu *weakSelf = self;
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.frame = CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, 157);
        } completion:^(BOOL finished) {
            if (finished) {
                _isShown = YES;
                _animating = NO;
            }
        }];
        _animating = YES;
    }
}
- (IBAction)leftAction:(id)sender {
    NSLog(@"一万以下");
}
- (IBAction)centerAction:(id)sender {
    NSLog(@"一万以shang");
}
- (IBAction)rightAction:(id)sender {
    NSLog(@"quanbu");
}
- (IBAction)bottomAction:(id)sender {
    NSLog(@"完成");
}

@end
