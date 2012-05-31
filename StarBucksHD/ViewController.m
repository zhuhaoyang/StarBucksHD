//
//  ViewController.m
//  StarBucksHD
//
//  Created by 浩洋 朱 on 12-5-23.
//  Copyright (c) 2012年 首正. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize navigation = _navigation;
@synthesize m_HomePageViewController = _m_HomePageViewController;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    m_HomePageViewController = [[HomePageViewController alloc]initWithNibName:@"HomePageViewController" bundle:[NSBundle mainBundle]];
    navigation = [[UINavigationController alloc]initWithRootViewController:m_HomePageViewController];
    [navigation.view setFrame:CGRectMake(0, -20, 768, 1024)];
    navigation.navigationBar.tintColor = [UIColor colorWithRed:0.3098 green:0.5569 blue:0.1059 alpha:1];
    [self.view addSubview:navigation.view];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
