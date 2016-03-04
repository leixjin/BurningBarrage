//
//  BBBarrageView.m
//  BurningBarrageDemo
//
//  Created by i mac on 16/3/3.
//  Copyright © 2016年 金小白. All rights reserved.
//

#import "BBBarrageView.h"
#import "BBEngine.h"

@interface BBBarrageView ()

@property (strong, nonatomic) BBEngine *engine;

@end

@implementation BBBarrageView

- (void)sendBarrage:(BBBarrage *)barrage {

    __weak __typeof(&*self)weakSelf = self;
    
    if (!self.engine) {
        self.engine = [[BBEngine alloc] initWithTrackHeight:self.trackHeight != 0 ? self.trackHeight : barrage.barrageSize.height renderSize:self.bounds.size];
    }
    
    [self.engine addBarragr:barrage handle:^(CABasicAnimation *animation) {
        [weakSelf.layer addSublayer:barrage.barrageLayer];
        [barrage.barrageLayer addAnimation:animation forKey:@""];
    }];
    
    self.barrageWorking = YES;
}

#pragma 弹幕动画控制(暂停、恢复)

- (void)pause {
    
    CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.layer.speed = 0.0;
    self.layer.timeOffset = pausedTime;
    
    self.barrageWorking = NO;
}

- (void)resume {
    
    CFTimeInterval pausedTime = [self.layer timeOffset];
    self.layer.speed = 1.0;
    self.layer.timeOffset = 0.0;
    self.layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.layer.beginTime = timeSincePause;
    
    self.barrageWorking = YES;
}

@end
