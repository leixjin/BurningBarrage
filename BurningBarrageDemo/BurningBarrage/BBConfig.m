//
//  BBConfig.m
//  BurningBarrageDemo
//
//  Created by i mac on 16/3/3.
//  Copyright © 2016年 金小白. All rights reserved.
//

#import "BBConfig.h"

@implementation BBConfig

- (instancetype)init {
    if (self = [super init]) {
        self.font = self.font ? : [UIFont systemFontOfSize:17];
        self.textColor = self.textColor ? : [UIColor blackColor];
        self.backgroundColor = self.backgroundColor ? : [UIColor clearColor];
        self.duration = self.duration != 0 ? : 5.0;
        self.showUnderLine = self.isShowUnderLine ? : NO;
    }
    return self;
}

@end

#pragma mark - Config a bullet with two different style.

@implementation BBHighlightedConfig

- (instancetype)init {
    if (self = [super init]) {
        
        NSAssert(self.highlightedRange.length == 0, @"range can't be nil.");
        
        self.highlightedFont = self.highlightedFont ? : [UIFont systemFontOfSize:17];
        self.highlightedTextColor = self.highlightedTextColor ? : [UIColor blackColor];
        self.highlightedBackgroundColor = self.highlightedBackgroundColor ? : [UIColor clearColor];
    }
    return self;
}

@end