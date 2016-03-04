//
//  BBEngine.h
//  BurningBarrageDemo
//
//  Created by i mac on 16/3/4.
//  Copyright © 2016年 金小白. All rights reserved.
//  弹幕处理引擎，用于处理弹幕数据逻辑

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BBBarrage.h"

@interface BBEngine : NSObject

- (instancetype)initWithTrackHeight:(CGFloat)height renderSize:(CGSize)size;

- (void)addBarragr:(BBBarrage *)barrage handle:(void(^)(CABasicAnimation *animation))handle;

- (void)pause;

- (void)resume;

@end

@interface BBTrack : NSObject

@property (assign, nonatomic) CGFloat lastSpeed;
@property (assign, nonatomic) CGFloat lastWidth;
@property (assign, nonatomic) NSTimeInterval timInterVal;

@end
