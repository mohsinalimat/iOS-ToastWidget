//
//  GZToastConfig.h
//  Pods
//
//  Created by zhaoy on 16/8/16.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, GZToastViewLocation) {
    /**
     *  Default toast location
     */
    GZ_Toast_In_Middle,
    /**
     *  Bottom toast location
     */
    GZ_Toast_Bottom,
};

typedef NS_ENUM(NSUInteger, GZToastViewAnimation) {
    /**
     * Default toast animation
     */
    GZ_TOAST_ANIMATION_FADING,
    /**
     *  Toast animation sliding from left
     */
    GZ_TOAST_ANIMATION_SLIDING_FROM_LEFT,
    /**
     *  Toast animation poping from bottom
     */
    GZ_TOAST_ANIMATION_POPING_FROM_BOTTOM,
};

@interface GZToastConfig : NSObject

/**
 *  Singleton conrol
 *
 *  @return configuration singleton
 */
+ (instancetype)sharedInstance;

/**
 *  Text color
 */
@property UIColor* textColor;

/**
 *  Background color
 */
@property UIColor* backgroundColor;

/**
 *  Text font
 */
@property UIFont* textFont;

/**
 *  Toast location
 */
@property GZToastViewLocation location;

/**
 *  Toast animation
 */
@property GZToastViewAnimation animation;

@end
