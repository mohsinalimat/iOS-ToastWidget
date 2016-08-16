
//
//  GZToastView.m
//  Pods
//
//  Created by zhaoy on 16/8/16.
//
//

#import "GZToastView.h"

@implementation GZToastView


#pragma mark - Initializer

+ (GZToastView*)toastWithText:(NSString*)text
{
    return nil;
}

+ (GZToastView*)toastWithText:(NSString *)text
                         icon:(UIImage *)icon
{
    return nil;
}

+ (GZToastView*)toastWithText:(NSString *)text
                         icon:(UIImage*)icon
                        title:(NSString*)title
{
    return nil;
}

+ (GZToastView*)toastWithCustomizedContent:(UIView*)customizedContent
{
    return nil;
}

#pragma mark - Control

- (void)showForDuration:(float)seconds
 withCompletionCallback:(void(^)())completionCallback
{
    
}

- (void)dismiss
{
    
}

#pragma mark - Customizable Method

- (UIView*)buildBackgroundView
{
    
}

@end
