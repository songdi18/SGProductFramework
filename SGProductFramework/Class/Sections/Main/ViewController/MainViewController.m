//
//  MainViewController.m
//  SGProductTemplate
//
//  Created by 宋迪 on 15/3/13.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import "MainViewController.h"
#import "SubViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)showMessageAction:(id)sender {
    [self showMessage:@"提示信息" afterDelay:2];
}

- (IBAction)showLoadingAction:(id)sender {
    [self showLoadingView:YES];
    [self performSelector:@selector(hideLoadingAction) withObject:self afterDelay:2];
}

- (IBAction)pushRequestVCAction:(id)sender {
    SubViewController* subVC=[[SubViewController alloc]initWithNibName:@"SubViewController" bundle:nil];
    [self.navigationController pushViewController:subVC animated:YES];
}


- (void)hideLoadingAction{
    [self showLoadingView:NO];
}

@end
