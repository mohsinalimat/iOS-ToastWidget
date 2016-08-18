//
//  GZViewController.m
//  Toast
//
//  Created by zy.zhao on 08/16/2016.
//  Copyright (c) 2016 zy.zhao. All rights reserved.
//

#import "GZViewController.h"
#import <Toast/Toast-umbrella.h>

@interface GZViewController ()

@end

@implementation GZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)toastStyle1:(id)sender {
    NSLog(@"Displaying toastStyle1");
}

- (IBAction)toastStyle2:(id)sender {
    NSLog(@"Displaying toastStyle2");
}

- (IBAction)toastStyle3:(id)sender {
    NSLog(@"Displaying toastStyle3");
}

- (IBAction)customitzedToast:(id)sender {
    NSLog(@"Displaying customizedToast");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
