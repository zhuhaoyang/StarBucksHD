//
//  OrderManageViewController.m
//  StarBucksHD
//
//  Created by 浩洋 朱 on 12-5-28.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "OrderManageViewController.h"

@interface OrderManageViewController ()

@end

@implementation OrderManageViewController
@synthesize m_tableView = _m_tableView;
@synthesize segmented = _segmented;
@synthesize m_serviceGetOrdeData = _m_serviceGetOrdeData;
@synthesize m_serviceModifyOrderData = _m_serviceModifyOrderData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        m_serviceGetOrderData = [[serviceGetOrderData alloc]initWithDelegate:self requestMode:TRequestMode_Asynchronous];
        [m_serviceGetOrderData sendRequestWithData:@"OrderId=" addr:@"GetAllOrderData"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    arrPickuped = [[NSMutableArray alloc]init];
    arrUnPickup = [[NSMutableArray alloc]init];
    
        
    
    NSArray *array = [[NSArray alloc]initWithObjects:@"订单列表",@"历史订单",nil];	
	self.segmented = [[UISegmentedControl alloc]initWithItems:array];
	self.segmented.segmentedControlStyle = UISegmentedControlStyleBar;
	[self.segmented addTarget:self action:@selector(changeSegmented) forControlEvents:UIControlEventValueChanged];
	self.segmented.selectedSegmentIndex = 0;
    self.segmented.frame = CGRectMake(0, 0, 300, 30); 
	self.navigationItem.titleView = self.segmented;
}

- (void)changeSegmented
{
    [self.m_tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)pickUp:(id)sender
{
    UIButton *bt = sender;
    NSLog(@"%i",bt.tag);
    nuPickup = bt.tag;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"是否确认提货?" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认",@"取消", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"确认提货");
        m_serviceModifyOrderData = [[serviceModifyOrderData alloc]initWithDelegate:self requestMode:TRequestMode_Asynchronous];
        [m_serviceModifyOrderData sendRequestWithData:[NSString stringWithFormat:@"OrderId=%@",[[arrUnPickup objectAtIndex:nuPickup]objectForKey:@"OrderId"]] addr:@"ModifyOrderData"];
    }else if(buttonIndex == 1){
        NSLog(@"取消提货");
    }
}


#pragma Mark -
#pragma tableView delegate;

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  100;
}
#pragma Mark -
#pragma tableView data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    NSInteger n;
    if (self.segmented.selectedSegmentIndex == 0){
        n = [arrUnPickup count];
    }else if(self.segmented.selectedSegmentIndex == 1){
        n = [arrPickuped count];
    }
    return  n;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    NSDictionary *dic;
    if (self.segmented.selectedSegmentIndex == 0 && [arrUnPickup count] != 0) {
        dic = [arrUnPickup objectAtIndex:[indexPath row]];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, 60, 30)];
        label.text = @"订单号:";
        [cell addSubview:label];
        
        UILabel *numOfOrder = [[UILabel alloc]initWithFrame:CGRectMake(80, 35, 100, 30)];
        numOfOrder.text = [dic objectForKey:@"OrderId"];
        [cell addSubview:numOfOrder];
        
        UILabel *order = [[UILabel alloc]initWithFrame:CGRectMake(190, 30, 300, 40)];
        order.text = [NSString stringWithFormat:@"%@ * %@",[dic objectForKey:@"ProductName"],[dic objectForKey:@"Number"]];
        order.font = [UIFont systemFontOfSize:40];
        [cell addSubview:order];
        
        UILabel *date = [[UILabel alloc]initWithFrame:CGRectMake(500, 35, 150, 30)];
        date.text = [dic objectForKey:@"CreateTime"];
        [cell addSubview:date];
        
        UIButton *btPickUp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btPickUp.frame = CGRectMake(660, 30, 80, 40);
        [btPickUp setTitle:@"确认提货" forState:UIControlStateNormal];
        [btPickUp addTarget:self action:@selector(pickUp:) forControlEvents:UIControlEventTouchUpInside];
        btPickUp.tag = [indexPath row];
        [cell addSubview:btPickUp];
    }else if(self.segmented.selectedSegmentIndex == 1 && [arrPickuped count] != 0){
        dic = [arrPickuped objectAtIndex:[indexPath row]];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 35, 60, 30)];
        label.text = @"订单号:";
        [cell addSubview:label];
        
        UILabel *numOfOrder = [[UILabel alloc]initWithFrame:CGRectMake(80, 35, 100, 30)];
        numOfOrder.text = [dic objectForKey:@"OrderId"];
        [cell addSubview:numOfOrder];
        
        UILabel *order = [[UILabel alloc]initWithFrame:CGRectMake(190, 30, 300, 40)];
        order.text = [NSString stringWithFormat:@"%@ * %@",[dic objectForKey:@"ProductName"],[dic objectForKey:@"Number"]];
        order.font = [UIFont systemFontOfSize:40];
        [cell addSubview:order];
        
        UILabel *date = [[UILabel alloc]initWithFrame:CGRectMake(500, 35, 150, 30)];
        date.text = [dic objectForKey:@"CreateTime"];
        [cell addSubview:date];
        
        UILabel *pickUp = [[UILabel alloc]initWithFrame:CGRectMake(680, 30, 80, 40)];
        pickUp.text = @"已提货";
        [cell addSubview:pickUp];

    }
    
        
    return cell;
}

#pragma mark -
#pragma serviceCallBack
-(void)serviceGetOrderDataCallBack:(NSDictionary*)dicCallBack withErrorMessage:(Error*)error
{
    NSLog(@"%@",dicCallBack);
    Global *global = [Global sharedGlobal];
    NSLog(@"%@",global.arrOrder);
    if (dicCallBack != nil) {
        [arrPickuped removeAllObjects];
        [arrUnPickup removeAllObjects];
        NSMutableArray *arr = [dicCallBack objectForKey:@"Orders"];
        [global.arrOrder removeAllObjects];
        for (NSMutableDictionary *dic in arr) {
            if ([[dic objectForKey:@"OrderStates"] isEqualToString:@"未提货"]) {
                [arrUnPickup addObject:dic];
            }else if([[dic objectForKey:@"OrderStates"] isEqualToString:@"已提货"]){
                [arrPickuped addObject:dic];
            }
        }
    }
    [self.m_tableView reloadData];

}

-(void)serviceModifyOrderDataCallBack:(NSDictionary*)dicCallBack withErrorMessage:(Error*)error
{
    NSLog(@"%@",dicCallBack);
    if ([[dicCallBack objectForKey:@"boolean"] isEqualToString:@"true"]) {
        [arrPickuped addObject:[arrUnPickup objectAtIndex:nuPickup]];
        [arrUnPickup removeObjectAtIndex:nuPickup];
        [self.m_tableView reloadData];
    }

}


@end
