//
//  AQMViewController.m
//  AQMBundledUser
//
//  Created by kaiinui on 2014/08/13.
//  Copyright (c) 2014年 Aquamarine. All rights reserved.
//

#import "AQMViewController.h"
#import "../Classes/AQMBundledUser.h"

@interface AQMViewController ()

@end

@implementation AQMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@", [[AQMBundledUser currentUser] userToken]);
    NSLog(@"%@", [[AQMBundledUser currentUser] secretKey]);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
