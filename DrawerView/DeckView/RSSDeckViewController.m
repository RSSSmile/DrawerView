//
//  RSSDeckViewController.m
//  DrawerView
//
//  Created by ycd006 on 16/5/9.
//  Copyright © 2016年 闰尚松. All rights reserved.
//

#ifndef CENTER_VIEW_WIDTH
#define CENTER_VIEW_WIDTH self.centerViewWidth > 0 ? self.centerViewWidth : CGRectGetWidth(self.view.frame) / 2
#endif

#ifndef DRAWER_ANIMATED_DURATION
#define DRAWER_ANIMATED_DURATION 0.5f
#endif

#import "RSSDeckViewController.h"
#import <objc/runtime.h>
#import "Config.h"

@interface RSSDeckViewController ()

/** 中心view */
@property (nonatomic, strong) UIView *centerView;
/** 左view */
@property (nonatomic, strong) UIView *leftView;
/** 右View */
@property (nonatomic, strong) UIView *rightView;

@end

@implementation RSSDeckViewController

#pragma mark - init -

/** 初始化一些基本的属性 */
- (void)commonInitWithCenterVC:(UIViewController *)centerVC
{
    self.centerVC = centerVC;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self commonInitWithCenterVC:nil];
    }
    return self;
}

/** 初始化中心视图 */
- (instancetype)initWithCenterVC:(UIViewController *)centerVC
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        [self commonInitWithCenterVC:centerVC];
    }
    return self;
}

- (instancetype)initWithCenterVC:(UIViewController *)centerVC leftVC:(UIViewController *)leftVC
{
    if (self = [self initWithCenterVC:centerVC]) {
        self.leftVC = leftVC;
    }
    return self;
}

#pragma mark - View lifecycle -

- (void)loadView
{
    [super loadView];
    
    if (self.leftVC) {
        self.leftView = self.leftVC.view;
    }
    
    if (self.rightVC) {
        self.rightView = self.rightVC.view;
    }
    
    self.centerView = VIEW(self.view.bounds);
    
    [self.view addSubview:self.centerView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.centerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    self.leftView.frame = CGRectMake(0, 0, 0, SCREEN_HEIGHT);
}

#pragma mark - show leftVC -

/** 左视图的开关 */
- (void)toggleLeftVCWithAnimated:(BOOL)animated
{
    [self openLeftVCWithAnimated:animated];
}

/** 开启左视图 */
- (void)openLeftVCWithAnimated:(BOOL)animated
{
    if (animated) {
        [UIView animateWithDuration:DRAWER_ANIMATED_DURATION animations:^{
            [self openLeftVC];
        }];
    } else {
        [self openLeftVC];
    }
}

/** 开启左视图 */
- (void)openLeftVC
{
    CGRect leftViewFrame = self.leftView.frame;
    CGRect centerViewFrame = self.centerView.frame;
    leftViewFrame.size.width = SCREEN_WIDTH - CENTER_VIEW_WIDTH;
    centerViewFrame.origin.x = SCREEN_WIDTH - CENTER_VIEW_WIDTH;
    centerViewFrame.size.width = CENTER_VIEW_WIDTH;
    self.leftView.frame = leftViewFrame;
    self.centerView.frame = centerViewFrame;
}

@end

#pragma mark - UIViewController category -

@implementation UIViewController (UIViewDeckItem)

@dynamic deckViewController;

static char *deckViewControllerKey = "deckViewControllerKey";

//- (RSSDeckViewController *)deckViewController
//{
//    
//}

@end
