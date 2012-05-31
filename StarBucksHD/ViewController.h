//
//  ViewController.h
//  StarBucksHD
//
//  Created by 浩洋 朱 on 12-5-23.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageViewController.h"

@interface ViewController : UIViewController{
    UINavigationController *navigation;
    HomePageViewController *m_HomePageViewController;

}
@property(nonatomic,strong) UINavigationController *navigation;
@property(nonatomic,strong) HomePageViewController *m_HomePageViewController;
@end
