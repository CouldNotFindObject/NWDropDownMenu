//
//  NWDropDownMenu.h
//  NWDropDownMenu
//
//  Created by  on 16/4/27.
//  Copyright © 2016年 . All rights reserved.
//

#import <UIKit/UIKit.h>
@class NWDropDownMenu;
@protocol NWDropDownMenuDelegate <NSObject>
@optional
- (void)didNWDropDownMenuButtonClick:(NWDropDownMenu *)NWDropDownMenu andType:(NSString *)type;
- (void)NWDropDownMenuIsShown:(BOOL)status;
@end

@interface NWDropDownMenu : UIView
@property (nonatomic, weak)id<NWDropDownMenuDelegate> delegate;
- (instancetype)initWithDelegate:(id<NWDropDownMenuDelegate> )delegate;
- (void)showOrHide;
- (void)hide;

@end
