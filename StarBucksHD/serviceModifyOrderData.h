//
//  serviceModifyOrderData.h
//  StarBucks
//
//  Created by 浩洋 朱 on 12-5-29.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "serviceInterface.h"

@protocol serviceModifyOrderDataCallBackDelegate <NSObject>

@optional
- (void)serviceModifyOrderDataCallBack:(NSDictionary *)dicCallBack withErrorMessage:(Error *)error;


@end

@interface serviceModifyOrderData : serviceInterface{
    
}

@property(nonatomic,weak)id <serviceModifyOrderDataCallBackDelegate>m_delegate;

- (id)initWithDelegate:(id<serviceModifyOrderDataCallBackDelegate>)aDelegate requestMode:(TRequestMode)mode;

@end
