//
//  BBConfig.h
//  BurningBarrageDemo
//
//  Created by i mac on 16/3/3.
//  Copyright © 2016年 金小白. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BBConfig : NSObject

/**default is 17.*/
@property (strong, nonatomic) UIFont  *font;

/**default is blackColor.*/
@property (strong, nonatomic) UIColor *textColor;

/**default is clearClolor.*/
@property (strong, nonatomic) UIColor *backgroundColor;

/**animationDuration default is 5.0.*/
@property (assign, nonatomic) CGFloat duration;

/**show underLine or not. default is NO.*/
@property (assign, nonatomic, getter=isShowUnderLine) BOOL showUnderLine;

@end


@interface BBHighlightedConfig : BBConfig

/**the heightLighted area, it's normally used to show the name of the barrage owner.*/
@property (assign, nonatomic) NSRange  highlightedRange;

/**the heightLighted font in the highlightedRange*/
@property (strong, nonatomic) UIFont  *highlightedFont;

/**the heightLighted text color in the highlightedRange*/
@property (strong, nonatomic) UIColor *highlightedTextColor;

/**the heightLighted background color in the highlightedRange*/
@property (strong, nonatomic) UIColor *highlightedBackgroundColor;

@end