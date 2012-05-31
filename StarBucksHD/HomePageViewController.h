//
//  HomePageViewController.h
//  StarBucksHD
//
//  Created by 浩洋 朱 on 12-5-23.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderManageViewController.h"

@interface HomePageViewController : UIViewController{
    UIButton *__weak bt1;
    UIButton *__weak bt2;
    UIButton *__weak bt3;
    UIButton *__weak bt4;
    OrderManageViewController *m_OrderManageVIewController;
}
@property(nonatomic,weak) IBOutlet UIButton *bt1;
@property(nonatomic,weak) IBOutlet UIButton *bt2;
@property(nonatomic,weak) IBOutlet UIButton *bt3;
@property(nonatomic,weak) IBOutlet UIButton *bt4;
@property(nonatomic,strong) OrderManageViewController *m_OrderManageViewConeroller;

- (IBAction)clickedBt1:(id)sender;
- (IBAction)clickedBt2:(id)sender;
- (IBAction)clickedBt3:(id)sender;
- (IBAction)clickedBt4:(id)sender;


@end
