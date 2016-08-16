//
//  GZToastView.h
//
//  Created by zhaoy on 16/8/16.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  Highly customizable toast view for iOS
 *  1) Support 3 different ways of default layout: pure toast; toast + image; toast + toast title + image
 *  2) Provide isolated toast container, user can put any sort of subview in toast.
 *  3) Screen rotation supported.
 */
@interface GZToastView : NSObject

#pragma mark - Initializer

+ (GZToastView*)toastWithText:(NSString*)text;

+ (GZToastView*)toastWithText:(NSString *)text
                         icon:(UIImage *)icon;

+ (GZToastView*)toastWithText:(NSString *)text
                         icon:(UIImage*)icon
                        title:(NSString*)title;

+ (GZToastView*)toastWithCustomizedContent:(UIView*)customizedContent;

#pragma mark - Control

- (void)showForDuration:(float)seconds
 withCompletionCallback:(void(^)())completionCallback;

- (void)dismiss;

#pragma mark - Customizable Property

@property (strong) UIView* backgroudView;

@end