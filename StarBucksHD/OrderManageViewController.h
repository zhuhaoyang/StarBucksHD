//
//  OrderManageViewController.h
//  StarBucksHD
//
//  Created by 浩洋 朱 on 12-5-28.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "serviceGetOrderData.h"
#import "Global.h"
#import "serviceModifyOrderData.h"

@interface OrderManageViewController : UIViewController
<serviceGetOrderDataCallBackDelegate>{
    UITableView *__weak m_tableView;
    UISegmentedControl *segmented;
    serviceGetOrderData *m_serviceGetOrderData;
    serviceModifyOrderData *m_serviceModifyOrderData;
    NSMutableArray *arrUnPickup;
    NSMutableArray *arrPickuped;
    NSInteger nuPickup;
}

@property(nonatomic,weak) IBOutlet UITableView *m_tableView;
@property(nonatomic,strong)UISegmentedControl *segmented;
@property(nonatomic,strong)serviceGetOrderData *m_serviceGetOrdeData;
@property(nonatomic,strong)serviceModifyOrderData *m_serviceModifyOrderData;
@end
