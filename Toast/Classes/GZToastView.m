
//
//  GZToastView.m
//  Pods
//
//  Created by zhaoy on 16/8/16.
//
//

#import "GZToastView.h"

#define GZ_Toast_Max_Relative_Width (([[UIScreen mainScreen] bounds].size.width) * 0.8)
#define GZ_Toast_Max_Width (GZ_Toast_Max_Relative_Width>400?400:GZ_Toast_Max_Relative_Width)
#define GZ_Toast_Max_Height 300

#define GZ_Toast_Icon_Size 45
#define GZ_Toast_Title_Height 20
#define GZ_Toast_Component_Margin 8
#define GZ_Toast_Inter_Padding 8

#define GZ_Toast_Corner 4

@interface GZToastView ()

@property (nonatomic, copy) void (^completion)();

@end

@implementation GZToastView

#pragma mark - Initializer

+ (GZToastView*)toastWithText:(NSString*)text
{
    if (!text.length) {
        return nil;
    }
    GZToastView* toastView = [GZToastView new];
    
    NSAttributedString* measureString = [[NSAttributedString alloc] initWithString:text
                                                                        attributes:@{NSFontAttributeName:[toastView textFont]}];
    
    CGRect rect = [measureString boundingRectWithSize:CGSizeMake(GZ_Toast_Max_Width - GZ_Toast_Inter_Padding * 2,
                                                                 GZ_Toast_Max_Height - GZ_Toast_Inter_Padding * 2)
                                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                              context:nil];
    
    UITextView* textView = [UITextView new];
    textView.frame = CGRectMake(GZ_Toast_Inter_Padding, GZ_Toast_Inter_Padding, rect.size.width, rect.size.height);
    toastView.frame = CGRectMake(0, 0, textView.frame.size.width + GZ_Toast_Inter_Padding * 2, textView.frame.size.height + GZ_Toast_Inter_Padding * 2);
    [toastView addSubview:textView];
    
    return toastView;
}

+ (GZToastView*)toastWithText:(NSString *)text
                         icon:(UIImage *)icon
{
    if (!icon && text.length) {
        return [GZToastView toastWithText:text];
    }
    
    GZToastView* toastView = [GZToastView new];
    
    // Config Icon
    UIImageView* iconView = [[UIImageView alloc] initWithImage:icon];
    iconView.contentMode = UIViewContentModeScaleAspectFit;
    iconView.frame = CGRectMake(GZ_Toast_Inter_Padding, GZ_Toast_Inter_Padding, GZ_Toast_Icon_Size, GZ_Toast_Icon_Size);
    iconView.clipsToBounds = YES;
    [toastView addSubview:iconView];
    
    // Config Text
    if (text.length) {
        
        NSAttributedString* measureString = [[NSAttributedString alloc] initWithString:text
                                                                            attributes:@{NSFontAttributeName:[toastView textFont]}];
        
        CGRect rect = [measureString boundingRectWithSize:CGSizeMake(GZ_Toast_Max_Width - GZ_Toast_Inter_Padding * 2 - GZ_Toast_Component_Margin - GZ_Toast_Icon_Size,
                                                                     GZ_Toast_Max_Height - GZ_Toast_Inter_Padding * 2)
                                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                  context:nil];
        
        UITextView* textView = [UITextView new];
        textView.frame = CGRectMake(GZ_Toast_Inter_Padding + GZ_Toast_Component_Margin + GZ_Toast_Icon_Size, GZ_Toast_Inter_Padding, rect.size.width, rect.size.height);
        [toastView addSubview:textView];
        toastView.frame = CGRectMake(0, 0, GZ_Toast_Icon_Size + GZ_Toast_Inter_Padding * 2 + GZ_Toast_Component_Margin + rect.size.width, MAX(GZ_Toast_Icon_Size, rect.size.height) + 2 * GZ_Toast_Inter_Padding);
    } else {
        toastView.frame = CGRectMake(0, 0, GZ_Toast_Icon_Size + 2* GZ_Toast_Inter_Padding, GZ_Toast_Icon_Size + 2* GZ_Toast_Inter_Padding);
    }
    
    
    return toastView;
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
           onCompletion:(void(^)())completionCallback
{
    
    self.completion = completionCallback;
    
    NSEnumerator *frontToBackWindows = [UIApplication.sharedApplication.windows reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows){
        BOOL windowOnMainScreen = window.screen == UIScreen.mainScreen;
        BOOL windowIsVisible = !window.hidden && window.alpha > 0;
        BOOL windowLevelNormal = window.windowLevel == UIWindowLevelNormal;
        
        if(windowOnMainScreen && windowIsVisible && windowLevelNormal){
            [window addSubview:self];
            break;
        }
    }
    
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:seconds];
}

- (void)dismiss
{
    [UIView animateWithDuration:0.3
                          delay:0.3
                        options:UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         self.alpha = 0.0;
                     } completion:^(BOOL finished) {
                         if (self.superview) {
                             [self removeFromSuperview];
                         }
                         
                         if (self.completion) {
                             self.completion();
                         }
                     }];
}

#pragma mark - Interal Method
- (instancetype)init
{
    self = [super init];
    self.layer.backgroundColor = [self defaultBackgrounColor].CGColor;
    self.layer.cornerRadius = GZ_Toast_Corner;
    self.clipsToBounds = YES;
    return self;
}

#pragma mark - Default Styles
- (UIFont*)textFont
{
    return [UIFont fontWithName:@"HelveticaNeue-Thin" size:12.0];
}

- (UIFont*)titleFont
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
}

- (UIColor*)defaultBackgrounColor
{
    return [[UIColor blackColor] colorWithAlphaComponent:0.6];
}

@end
