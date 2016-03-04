//
//  BBEngine.m
//  BurningBarrageDemo
//
//  Created by i mac on 16/3/4.
//  Copyright © 2016年 金小白. All rights reserved.
//  弹幕处理引擎，用于处理弹幕数据逻辑

#import "BBEngine.h"

@interface BBEngine ()

@property (assign, nonatomic) CGFloat trackHeight;
@property (assign, nonatomic) CGSize renderLayerSize;
@property (strong, nonatomic) NSMutableArray *trackArray;
@property (strong, nonatomic) NSMutableArray *barrageTmpArray;

@end

@implementation BBEngine

- (instancetype)initWithTrackHeight:(CGFloat)height renderSize:(CGSize)size {
    if (self = [super init]) {
        _trackHeight = height;
        _renderLayerSize = size;
    }
    return self;
}

- (void)addBarragr:(BBBarrage *)barrage handle:(void (^)(CABasicAnimation *))handle {
    
    NSUInteger showTrack = [self checkTrackWithBarrage:barrage];;
    
    if (showTrack != NSUIntegerMax) {//有可用轨道
        
        //设置layer的frame
        barrage.barrageLayer.frame = CGRectMake(0, _trackHeight * showTrack, barrage.barrageSize.width, barrage.barrageSize.height);
        
        //回调
        if (handle) {
            handle([self creatAnimationWithBarrage:barrage]);
        }
        
    }else {//无可用轨道，加入缓存，开启循环检测
        
        //[self.barrageTmpArray addObject:barrage];
    }
}

//检测轨道
- (NSUInteger)checkTrackWithBarrage:(BBBarrage *)barrage {
    
    __block NSUInteger usefulTrack = NSUIntegerMax;
    
    //当前弹幕速度
    CGFloat currentBarrageSpeed = (self.renderLayerSize.width + barrage.barrageSize.width * 2.0f) / barrage.duration;
    
    [self.trackArray enumerateObjectsUsingBlock:^(BBTrack *track, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (track.lastSpeed == 0 || track.lastSpeed > currentBarrageSpeed) {
            NSLog(@"!!!!!!!%f====%f",track.lastSpeed,currentBarrageSpeed);
            
            usefulTrack = idx;
            
            track.lastSpeed = currentBarrageSpeed;
            track.lastWidth = barrage.barrageSize.width;
            track.timInterVal = [NSDate timeIntervalSinceReferenceDate];
            
            *stop = YES;
        }
    }];
    
    return usefulTrack;
}

//创建动画
- (CABasicAnimation *)creatAnimationWithBarrage:(BBBarrage *)barrage {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.duration = barrage.duration;
    animation.fromValue = @(self.renderLayerSize.width + barrage.barrageSize.width);
    animation.toValue = @(-barrage.barrageSize.width);
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}

- (void)pause {
    
}

- (void)resume {
    
}

#pragma mark - lazy load

- (NSMutableArray *)trackArray {
    if (!_trackArray) {
        
        _trackArray = [NSMutableArray array];
        
        //计算轨道数量
        for (int i = 0; i < (_renderLayerSize.height / _trackHeight); i++) {
            [_trackArray addObject:[BBTrack new]];
        }
        
    }
    return _trackArray;
}

- (NSMutableArray *)barrageTmpArray {
    if (!_barrageTmpArray) {
        _barrageTmpArray = [NSMutableArray array];
    }
    return _barrageTmpArray;
}

@end

@implementation BBTrack

@end