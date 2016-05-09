//
//  RSSDeckViewController.h
//  DrawerView
//
//  Created by ycd006 on 16/5/9.
//  Copyright © 2016年 闰尚松. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSDeckViewController : UIViewController

#pragma mark - vc -

/** 中心视图 */
@property (nonatomic, strong) UIViewController *centerVC;
/** 左视图 */
@property (nonatomic, strong) UIViewController *leftVC;
/** 右视图 */
@property (nonatomic, strong) UIViewController *rightVC;

#pragma mark - size -

/** 中心视图的宽度 */
@property (nonatomic, assign) CGFloat centerViewWidth;

@end


#pragma mark - UIViewController category -

@interface UIViewController (UIViewDeckItem)

/** 返回一个RSSDeckViewController类型的属性，用以调用该类中的方法 */
@property (nonatomic, strong) RSSDeckViewController *deckViewController;

@end
