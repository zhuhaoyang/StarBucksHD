//
//  HomePageViewController.m
//  StarBucksHD
//
//  Created by 浩洋 朱 on 12-5-23.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController
@synthesize bt1 = _bt1;
@synthesize bt2 = _bt2;
@synthesize bt3 = _bt3;
@synthesize bt4 = _bt4;
@synthesize m_OrderManageViewConeroller = _m_OrderManageViewConeroller;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"首页";
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


- (IBAction)clickedBt1:(id)sender
{
    self.m_OrderManageViewConeroller = [[OrderManageViewController alloc]initWithNibName:@"OrderManageViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:self.m_OrderManageViewConeroller animated:YES];
}

- (IBAction)clickedBt2:(id)sender
{

}

- (IBAction)clickedBt3:(id)sender
{

}

- (IBAction)clickedBt4:(id)sender
{

}



@end
