
//
//  GZToastView.m
//  Pods
//
//  Created by zhaoy on 16/8/16.
//
//

#import "GZToastView.h"
#import "GZToastConfig.h"

#define GZ_Toast_Max_Relative_Width (([[UIScreen mainScreen] bounds].size.width) * 0.6)
#define GZ_Toast_Max_Width (GZ_Toast_Max_Relative_Width>200?200:GZ_Toast_Max_Relative_Width)
#define GZ_Toast_Max_Height 300

#define GZ_Toast_Icon_Size 45
#define GZ_Toast_Title_Height 20
#define GZ_Toast_Component_Margin 8
#define GZ_Toast_Inter_Padding 8

#define GZ_Toast_Window_Botton_Padding 80

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
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                              context:nil];
    
    UILabel* toastText = [UILabel new];
    toastText.font = [toastView textFont];
    toastText.text = text;
    toastText.contentMode = UIViewContentModeCenter;
    toastText.backgroundColor = [UIColor clearColor];
    toastText.numberOfLines = 0;
    toastText.textColor = [toastView textColor];

    toastText.frame = CGRectMake(GZ_Toast_Inter_Padding, GZ_Toast_Inter_Padding, rect.size.width, rect.size.height);
    toastView.frame = CGRectMake(0, 0, toastText.frame.size.width + GZ_Toast_Inter_Padding * 2, toastText.frame.size.height + GZ_Toast_Inter_Padding * 2);
    [toastView addSubview:toastText];
    
    return toastView;
}

+ (GZToastView*)toastWithText:(NSString *)text
                         icon:(UIImage *)icon
{
    if (!icon) {
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
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                                  context:nil];
        
        UILabel* toastText = [UILabel new];
        toastText.font = [toastView textFont];
        toastText.text = text;
        toastText.textColor = [toastView textColor];
        toastText.backgroundColor = [UIColor clearColor];
        toastText.numberOfLines = 0;
        toastView.frame = CGRectMake(0, 0, GZ_Toast_Icon_Size + GZ_Toast_Inter_Padding * 2 + GZ_Toast_Component_Margin + rect.size.width, MAX(GZ_Toast_Icon_Size, rect.size.height) + 2 * GZ_Toast_Inter_Padding);
        
        toastText.frame = CGRectMake(GZ_Toast_Inter_Padding + GZ_Toast_Component_Margin + GZ_Toast_Icon_Size, (toastView.frame.size.height - rect.size.height)/2 , rect.size.width, rect.size.height);
        [toastView addSubview:toastText];
        
    } else {
        toastView.frame = CGRectMake(0, 0, GZ_Toast_Icon_Size + 2* GZ_Toast_Inter_Padding, GZ_Toast_Icon_Size + 2* GZ_Toast_Inter_Padding);
    }
    
    
    return toastView;
}

+ (GZToastView*)toastWithText:(NSString *)text
                         icon:(UIImage*)icon
                        title:(NSString*)title
{
    if (!title.length) {
        return [GZToastView toastWithText:text
                                     icon:icon];
    }
    
    GZToastView* toastView = [GZToastView new];
    
    BOOL hasIcon = icon != nil;
    BOOL hasText = text.length > 0;
    CGSize contentSize = CGSizeMake(0, 0);
    
    // Config Icon
    if (hasIcon) {
        UIImageView* iconView = [[UIImageView alloc] initWithImage:icon];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        iconView.frame = CGRectMake(GZ_Toast_Inter_Padding, GZ_Toast_Inter_Padding, GZ_Toast_Icon_Size, GZ_Toast_Icon_Size);
        iconView.clipsToBounds = YES;
        [toastView addSubview:iconView];
        
        contentSize.width = GZ_Toast_Inter_Padding * 2 + GZ_Toast_Icon_Size;
        contentSize.height = GZ_Toast_Inter_Padding * 2 + GZ_Toast_Icon_Size;
    }
    
    // Config Text & Title
    NSAttributedString* titleString = [[NSAttributedString alloc] initWithString:title
                                                                        attributes:@{NSFontAttributeName:[toastView titleFont]}];
    
    CGRect titleRect = [titleString boundingRectWithSize:CGSizeMake(GZ_Toast_Max_Width - GZ_Toast_Inter_Padding * 2 - GZ_Toast_Component_Margin - GZ_Toast_Icon_Size,
                                                                 GZ_Toast_Max_Height - GZ_Toast_Inter_Padding * 2)
                                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                              context:nil];
    
    UILabel* toastTitle = [UILabel new];
    toastTitle.font = [toastView titleFont];
    toastTitle.text = title;
    toastTitle.textColor = [toastView textColor];
    toastTitle.backgroundColor = [UIColor clearColor];
    toastTitle.numberOfLines = 0;
    toastTitle.frame = CGRectMake(GZ_Toast_Inter_Padding + GZ_Toast_Icon_Size + GZ_Toast_Component_Margin,
                                 GZ_Toast_Inter_Padding,
                                 titleRect.size.width,
                                 titleRect.size.height);
    [toastView addSubview:toastTitle];
    
    contentSize.width += GZ_Toast_Component_Margin + titleRect.size.width;
    contentSize.height = MAX(contentSize.height, titleRect.size.height + 2 * GZ_Toast_Inter_Padding);
    
    if (hasText) {
        
        NSAttributedString* measureString = [[NSAttributedString alloc] initWithString:text
                                                                            attributes:@{NSFontAttributeName:[toastView textFont]}];
        
        CGRect rect = [measureString boundingRectWithSize:CGSizeMake(GZ_Toast_Max_Width - GZ_Toast_Inter_Padding * 2 - GZ_Toast_Component_Margin - GZ_Toast_Icon_Size,
                                                                     GZ_Toast_Max_Height - GZ_Toast_Inter_Padding * 2)
                                                  options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                  context:nil];
        
        UILabel* toastText = [UILabel new];
        toastText.font = [toastView textFont];
        toastText.text = text;
        toastText.textColor = [toastView textColor];
        toastText.numberOfLines = 0;
        toastText.backgroundColor = [UIColor clearColor];
        toastText.frame = CGRectMake(GZ_Toast_Inter_Padding + GZ_Toast_Component_Margin + GZ_Toast_Icon_Size,
                                    GZ_Toast_Inter_Padding + GZ_Toast_Component_Margin + titleRect.size.height,
                                    rect.size.width,
                                    rect.size.height);
        [toastView addSubview:toastText];
        
        contentSize.width  = MAX(contentSize.width, GZ_Toast_Inter_Padding * 2 + GZ_Toast_Component_Margin + rect.size.width + GZ_Toast_Icon_Size);
        contentSize.height = MAX(contentSize.height, titleRect.size.height + 2 * GZ_Toast_Inter_Padding + rect.size.height + GZ_Toast_Component_Margin);
    }
   
    toastView.frame = CGRectMake(0, 0, contentSize.width, contentSize.height);
    return toastView;
}

+ (GZToastView*)toastWithCustomizedContent:(UIView*)customizedContent
{
    GZToastView* toastView = [GZToastView new];
    [toastView addSubview:customizedContent];
    customizedContent.frame = CGRectMake(GZ_Toast_Inter_Padding, GZ_Toast_Inter_Padding, customizedContent.frame.size.width, customizedContent.frame.size.height);
    toastView.frame = CGRectMake(0, 0, customizedContent.frame.size.width + 2 * GZ_Toast_Inter_Padding, customizedContent.frame.size.height + 2 * GZ_Toast_Inter_Padding);
    return toastView;
}

- (void)adjustToastPosition
{
    
    if ([GZToastConfig sharedInstance].location == GZ_Toast_In_Middle) {
        
        UIWindow* window = self.window;
        float windowWidth = window.bounds.size.width;
        float windowHeight= window.bounds.size.height;
        float toastOriginX = (windowWidth - self.frame.size.width) / 2;
        float toastOriginY = (windowHeight - self.frame.size.height) / 2;
        
        self.frame = CGRectMake(toastOriginX,
                                toastOriginY,
                                self.frame.size.width,
                                self.frame.size.height);
        
    } else if ([GZToastConfig sharedInstance].location == GZ_Toast_Bottom) {
        
        UIWindow* window = self.window;
        float windowWidth = window.bounds.size.width;
        float windowHeight= window.bounds.size.height;
        float toastOriginX = (windowWidth - self.frame.size.width) / 2;
        float toastOriginY = (windowHeight - self.frame.size.height) - GZ_Toast_Window_Botton_Padding;
        
        self.frame = CGRectMake(toastOriginX,
                                toastOriginY,
                                self.frame.size.width,
                                self.frame.size.height);
        
    }
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
            
            [self displayInWindow:window];
//            [self adjustToastPosition];

            break;
        }
    }
    
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:seconds];
}


- (void)displayInWindow:(UIWindow*)window
{
    [window addSubview:self];
    self.alpha = 0.0;
    [self adjustToastPosition];
    
    if ([GZToastConfig sharedInstance].animation == GZ_TOAST_ANIMATION_FADING) {
        
        [UIView animateWithDuration:0.3
                              delay:0.3
                            options:UIViewAnimationOptionAllowAnimatedContent
                         animations:^{
                             self.alpha = 1.0;
                         } completion:nil];
        
    } else if ([GZToastConfig sharedInstance].animation == GZ_TOAST_ANIMATION_SLIDING_FROM_LEFT) {
       
        float finalCenterX = self.window.bounds.size.width/2;
        float initialCenterX = -self.frame.size.width/2;
        self.center = CGPointMake(initialCenterX, self.center.y);
        self.alpha = 1.0;
        
        [UIView animateWithDuration:0.3
                              delay:0.3
                            options:UIViewAnimationOptionAllowAnimatedContent
                         animations:^{
                             self.center = CGPointMake(finalCenterX, self.center.y);
                         } completion:nil];
        
        
    } else if ([GZToastConfig sharedInstance].animation == GZ_TOAST_ANIMATION_POPING_FROM_BOTTOM) {
        
        float finalCenterY = self.center.y;
        float initialCenterY = (self.window.frame.size.height + self.frame.size.height);
        self.center = CGPointMake(self.center.x, initialCenterY);
        self.alpha = 1.0;
        
        [UIView animateWithDuration:0.3
                              delay:0.3
                            options:UIViewAnimationOptionAllowAnimatedContent
                         animations:^{
                             self.center = CGPointMake(self.center.x, finalCenterY);
                         }
                         completion:nil];
        
    }
}

- (void)dismiss
{
    
    if ([GZToastConfig sharedInstance].animation == GZ_TOAST_ANIMATION_FADING) {
        
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
                             
                             [[NSNotificationCenter defaultCenter] removeObserver:self];
                         }];

        
    } else if ([GZToastConfig sharedInstance].animation == GZ_TOAST_ANIMATION_SLIDING_FROM_LEFT) {
        
        
        float initialCenterX = self.window.bounds.size.width/2;
        float finalCenterX = -self.frame.size.width/2;
        
        [UIView animateWithDuration:0.3
                              delay:0.3
                            options:UIViewAnimationOptionAllowAnimatedContent
                         animations:^{
                             self.center = CGPointMake(finalCenterX, self.center.y);
                         } completion:^(BOOL finished) {
                             if (self.superview) {
                                 [self removeFromSuperview];
                             }
                             
                             if (self.completion) {
                                 self.completion();
                             }
                             
                             [[NSNotificationCenter defaultCenter] removeObserver:self];
                         }];
        
    } else if ([GZToastConfig sharedInstance].animation == GZ_TOAST_ANIMATION_POPING_FROM_BOTTOM) {
        
        float initialCenterY = self.center.y;
        float finalCenterY = (self.window.frame.size.height + self.frame.size.height);
        
        [UIView animateWithDuration:0.3
                              delay:0.3
                            options:UIViewAnimationOptionAllowAnimatedContent
                         animations:^{
                             self.center = CGPointMake(self.center.x, finalCenterY);
                         }
                         completion:^(BOOL finished) {
                             if (self.superview) {
                                 [self removeFromSuperview];
                             }
                             
                             if (self.completion) {
                                 self.completion();
                             }
                             
                             [[NSNotificationCenter defaultCenter] removeObserver:self];
                         }];
        
    }
}

#pragma mark - Interal Method
- (instancetype)init
{
    self = [super init];
    self.layer.backgroundColor = [self defaultBackgrounColor].CGColor;
    self.layer.cornerRadius = GZ_Toast_Corner;
    self.clipsToBounds = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    
    return self;
}

#pragma mark - Default Styles
- (UIFont*)textFont
{
    if ([GZToastConfig sharedInstance].textFont) {
        return [GZToastConfig sharedInstance].textFont;
    }
    
    return [UIFont fontWithName:@"HelveticaNeue" size:10.0];
}

- (UIFont*)titleFont
{
    if ([GZToastConfig sharedInstance].textFont) {
        return [GZToastConfig sharedInstance].textFont;
    }
    
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
}

- (UIColor*)textColor
{
    if ([GZToastConfig sharedInstance].textColor) {
        return [GZToastConfig sharedInstance].textColor;
    }
    
    return [UIColor whiteColor];
}

- (UIColor*)defaultBackgrounColor
{
    if ([GZToastConfig sharedInstance].backgroundColor) {
        return [GZToastConfig sharedInstance].backgroundColor;
    }
    
    return [[UIColor blackColor] colorWithAlphaComponent:0.9];
}

#pragma mark - Orientation Change
- (void)orientationChanged:(NSNotification *)notification{
    [self adjustToastPosition];
}


@end
