//
//  GZToastConfig.m
//  Pods
//
//  Created by zhaoy on 16/8/16.
//

#import "GZToastConfig.h"

@implementation GZToastConfig

+ (instancetype)sharedInstance
{
    static GZToastConfig* toastUtils;
    static dispatch_once_t dispatch_token;
    dispatch_once(&dispatch_token, ^{
        toastUtils = [GZToastConfig new];
    });
  
    return toastUtils;
}

@end
