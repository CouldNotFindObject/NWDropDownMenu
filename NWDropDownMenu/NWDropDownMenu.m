//
//  NWDropDownMenu.m
//  NWDropDownMenu
//
//  Created by on 16/4/27.
//  Copyright © 2016年 . All rights reserved.
//

#import "NWDropDownMenu.h"

@interface NWDropDownMenu ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, assign) BOOL isShown;
@property (nonatomic, assign) BOOL animating;
@property (strong, nonatomic) IBOutlet UIButton *all;
@property (strong, nonatomic) IBOutlet UIButton *up;
@property (strong, nonatomic) IBOutlet UIButton *down;


@property (nonatomic, strong) UIButton *currentBtn;
@end

@implementation NWDropDownMenu

- (instancetype)initWithDelegate:(id<NWDropDownMenuDelegate>)delegate
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"NWDropDownMenu" owner:self options:nil] objectAtIndex:0];
        self.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 0);
        [self layoutIfNeeded];
        self.delegate = delegate;
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        self.backView.backgroundColor = [UIColor blackColor];
        self.backView.alpha = 0.6;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOrHide)];
        [self.backView addGestureRecognizer:tap];
        self.layer.masksToBounds = YES;
    }
    return self;
}

-(void)hide
{
    _isShown = YES;
    [self showOrHide];

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
            weakSelf.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 112);
        } completion:^(BOOL finished) {
            if (finished) {
                _isShown = YES;
                _animating = NO;
            }
        }];
        _animating = YES;
    }
    if([self.delegate respondsToSelector:@selector(NWDropDownMenuIsShown:)]){
        [self.delegate NWDropDownMenuIsShown:_isShown];
    }
}
- (IBAction)leftAction:(id)sender {
    PcitcLog(@"一万以下");
    [self showOrHide];
    [self changeButtonsColor:sender];
    if ([_delegate respondsToSelector:@selector(didNWDropDownMenuButtonClick:andType:)]) {
        [_delegate didNWDropDownMenuButtonClick:self andType:@"2"];
    }
}
- (IBAction)centerAction:(id)sender {
    PcitcLog(@"一万以shang");
    [self showOrHide];
    [self changeButtonsColor:sender];
    if ([_delegate respondsToSelector:@selector(didNWDropDownMenuButtonClick:andType:)]) {
        [_delegate didNWDropDownMenuButtonClick:self andType:@"1"];
    }

}
- (IBAction)rightAction:(id)sender {
    PcitcLog(@"全部");
    [self showOrHide];
    [self changeButtonsColor:sender];
    if ([_delegate respondsToSelector:@selector(didNWDropDownMenuButtonClick:andType:)]) {
        [_delegate didNWDropDownMenuButtonClick:self andType:@"0"];
    }

}

- (void)changeButtonsColor:(UIButton *)btn {
    _up.backgroundColor = [UIColor clearColor];
    [_up setTitleColor:[UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1] forState:(UIControlStateNormal)];
    _down.backgroundColor = [UIColor clearColor];
    [_down setTitleColor:[UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1] forState:(UIControlStateNormal)];
    _all.backgroundColor = [UIColor clearColor];
    [_all setTitleColor:[UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1] forState:(UIControlStateNormal)];
    _up.layer.cornerRadius = 5.0f;
    _down.layer.cornerRadius = 5.0f;
    _all.layer.cornerRadius = 5.0f;
    _currentBtn = btn;
    btn.backgroundColor = [UIColor colorWithRed:60.0 / 255 green:116.0/255 blue:229.0/255 alpha:1];
    [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
}

@end
