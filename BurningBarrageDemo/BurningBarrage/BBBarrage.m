//
//  BBBarrage.m
//  BurningBarrageDemo
//
//  Created by i mac on 16/3/3.
//  Copyright © 2016年 金小白. All rights reserved.
//

#import "BBBarrage.h"

@interface BBBarrage ()

@end

@implementation BBBarrage

- (instancetype)initWithContent:(NSString *)content config:(BBConfig *)config {
    
    if (self = [super init]) {
        
        content = content ? : @"";
        
        NSRange range = NSMakeRange(0, content.length);
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:content];
        [attStr addAttribute:NSFontAttributeName value:config.font range:range];
        [attStr addAttribute:NSForegroundColorAttributeName value:config.textColor range:range];
        [attStr addAttribute:NSBackgroundColorAttributeName value:config.backgroundColor range:range];
        
        if (config.isShowUnderLine) {
            [attStr addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:range];
        }
        
        if (![config isMemberOfClass:[BBConfig class]]) {
            BBHighlightedConfig *hightConfig = (BBHighlightedConfig *)config;
            [attStr addAttribute:NSFontAttributeName value:hightConfig.highlightedFont range:hightConfig.highlightedRange];
            [attStr addAttribute:NSForegroundColorAttributeName value:hightConfig.highlightedTextColor range:hightConfig.highlightedRange];
            [attStr addAttribute:NSBackgroundColorAttributeName value:hightConfig.highlightedBackgroundColor range:hightConfig.highlightedRange];
            
            if (hightConfig.isShowUnderLine) {
                [attStr addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:range];
            }
        }
        
        self.duration = config.duration;
        self.barrageSize = [attStr size];
        self.barrageLayer.string = attStr;
        self.barrageLayer.contentsScale = [UIScreen mainScreen].scale;
    }
    return self;
}

- (CATextLayer *)barrageLayer {
    if (!_barrageLayer) {
        _barrageLayer = [CATextLayer layer];
    }
    return _barrageLayer;
}

@end
