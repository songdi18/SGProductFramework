//
//  SGViewController.m
//  Bubble
//
//  Created by 宋迪 on 15/3/12.
//  Copyright (c) 2015年 SNG. All rights reserved.
//

#import "SGViewController.h"
#import "MBProgressHUD.h"

@interface SGViewController ()
@property(nonatomic,assign) UIStatusBarStyle statusBarStyle;
@property(nonatomic,assign) BOOL statusBarHidden;
@property(nonatomic,assign) BOOL changeStatusBarAnimated;
@property(nonatomic,strong) MBProgressHUD* LoadingHUD;
@end

@implementation SGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainRequest=[SGRequest request];
    self.mainRequest.maxOperationsCount=1;
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    
}

-(void)setIsExtendLayout:(BOOL)isExtendLayout{
    if (!isExtendLayout) {
        [self initializeSelfVCSetting];
    }
}

-(void)initializeSelfVCSetting{
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
    }
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout=UIRectEdgeNone;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return self.statusBarStyle;
}
- (BOOL)prefersStatusBarHidden{
    return self.statusBarHidden;
}

-(void)changeStatusBarStyle:(UIStatusBarStyle)statusBarStyle
            statusBarHidden:(BOOL)statusBarHidden
    changeStatusBarAnimated:(BOOL)animated{
    self.statusBarStyle=statusBarStyle;
    self.statusBarHidden=statusBarHidden;
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            [self setNeedsStatusBarAppearanceUpdate];
        }];
    }
    else{
        [self setNeedsStatusBarAppearanceUpdate];
    }
}

-(void)hideNavigationBar:(BOOL)isHide
                animated:(BOOL)animated{
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            self.navigationController.navigationBarHidden=isHide;
        }];
    }
    else{
        self.navigationController.navigationBarHidden=isHide;
    }
}

-(void)layoutNavigationBar:(UIImage*)backGroundImage
                titleColor:(UIColor*)titleColor
                 titleFont:(UIFont*)titleFont
         leftBarButtonItem:(UIBarButtonItem*)leftItem
        rightBarButtonItem:(UIBarButtonItem*)rightItem{
    if (backGroundImage) {
        [self.navigationController.navigationBar setBackgroundImage:backGroundImage forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    }
    if (titleColor&&titleFont) {
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor,NSFontAttributeName:titleFont}];
    }
    else if (titleFont) {
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:titleFont}];
    }
    else if (titleColor){
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
    }
    if (leftItem) {
        self.navigationItem.leftBarButtonItem=leftItem;
    }
    if (rightItem) {
        self.navigationItem.rightBarButtonItem=rightItem;
    }
    
}

-(void)showMessage:(NSString*)message
        afterDelay:(CGFloat)delay{
    MBProgressHUD* messageHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if (!self.isExtendLayout) {
        messageHUD.yOffset=-64;
    }
    if (message) {
        messageHUD.mode=MBProgressHUDModeText;
        messageHUD.labelText=message;
    }
    else{
        messageHUD.mode=MBProgressHUDModeIndeterminate;
    }
    [messageHUD hide:YES afterDelay:delay];
}

-(void)showLoadingView:(BOOL)isShow{
    if (isShow) {
        self.LoadingHUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        if (!self.isExtendLayout) {
            self.LoadingHUD.yOffset=-64;
        }
        [self.LoadingHUD show:YES];
    }
    else{
        [self.LoadingHUD hide:YES];
    }
}


@end
