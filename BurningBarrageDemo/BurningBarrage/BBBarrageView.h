//
//  BBBarrageView.h
//  BurningBarrageDemo
//
//  Created by i mac on 16/3/3.
//  Copyright © 2016年 金小白. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBBarrage.h"

@interface BBBarrageView : UIView

/**the height of the track. default is barrage height.*/
@property (assign, nonatomic) CGFloat trackHeight;

@property (assign, nonatomic, getter=isBarrageWorking) BOOL barrageWorking;

- (void)sendBarrage:(BBBarrage *)barrage;

- (void)pause;

- (void)resume;

@end
