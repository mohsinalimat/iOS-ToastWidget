//
//  GZViewController.m
//  Toast
//
//  Created by zy.zhao on 08/16/2016.
//  Copyright (c) 2016 zy.zhao. All rights reserved.
//

#import "GZViewController.h"
#import <GZToast/GZToast-umbrella.h>

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
    [[GZToastView toastWithText:@"toast style 1"] showForDuration:4
                                                     onCompletion:^{
                                                      NSLog(@"Toast complete");
                                                     }];
}

- (IBAction)toastStyle2:(id)sender {
    NSLog(@"Displaying toastStyle2");
    
    [[GZToastView toastWithText:@"toast style 2: icon with corresponding toast description. Adding the long desc to see the overall layout."
                          icon:[UIImage imageNamed:@"Icon.png"]]
     showForDuration:4
        onCompletion:^{
            NSLog(@"Toast complete");
     }];
}

- (IBAction)toastStyle3:(id)sender {
    NSLog(@"Displaying toastStyle3");
    
    [[GZToastView toastWithText:@"toast style 3: icon with corresponding toast description. Adding the long desc to see the overall layout."
                          icon:[UIImage imageNamed:@"Icon.png"]
                         title:@"Title"]
     showForDuration:4
     onCompletion:^{
         NSLog(@"Toast complete");
     }];
}

- (IBAction)customitzedToast:(id)sender {
    NSLog(@"Displaying customizedToast");
    
    UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.frame = CGRectMake(0, 0, 55, 55);
    [indicator startAnimating];
    [[GZToastView toastWithCustomizedContent:indicator] showForDuration:4
                                                           onCompletion:^{
                                                               NSLog(@"Toast complete");
                                                               [indicator stopAnimating];
                                                           }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
