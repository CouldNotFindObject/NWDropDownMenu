//
//  ViewController.m
//  NWDropDownMenu
//
//  Created by 佟锡杰 on 16/4/27.
//  Copyright © 2016年 tongxijie. All rights reserved.
//

#import "ViewController.h"
#import "NWDropDownMenu.h"

@interface ViewController () <NWDropDownMenuDelegate>
@property (nonatomic,strong)NWDropDownMenu *menu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional    // Do any additional setup after  setup after loading the view, typically from a nib.loading the view, typically from a nib.
    self.menu = [[NWDropDownMenu alloc] initWithDelegate:self];

}
- (void)NWDropDownMenu:(NWDropDownMenu *)menu willHide:(UIButton *)btn
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)show:(id)sender {
    [_menu showOrHide];
}

@end
