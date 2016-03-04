//
//  BBBarrage.h
//  BurningBarrageDemo
//
//  Created by i mac on 16/3/3.
//  Copyright © 2016年 金小白. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface BBBarrage : NSObject

/**此条弹幕尺寸*/
@property (assign, nonatomic) CGSize barrageSize;

/**此条弹幕显示时长*/
@property (assign, nonatomic) CGFloat duration;

/**弹幕layer*/
@property (strong, nonatomic) CATextLayer *barrageLayer;

/**
 *  初始化一个弹幕对象
 *
 *  @param content 弹幕内容
 *  @param config  弹幕配置
 *
 *  @return 弹幕对象
 */
- (instancetype)initWithContent:(NSString *)content config:(BBConfig *)config;

@end

NS_ASSUME_NONNULL_END