//
//  ViewController.m
//  BurningBarrageDemo
//
//  Created by i mac on 16/3/3.
//  Copyright © 2016年 金小白. All rights reserved.
//

#import "ViewController.h"
#import "BBBarrageView.h"

@interface ViewController ()

@property (strong, nonatomic) BBBarrageView *bbView;
@property (strong, nonatomic) BBHighlightedConfig *config;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BBBarrageView *bbView = [[BBBarrageView alloc] initWithFrame:self.view.bounds];
    bbView.trackHeight = 30;
    [self.view addSubview:bbView];
    self.bbView = bbView;
    
    BBHighlightedConfig *config = [[BBHighlightedConfig alloc] init];
    self.config = config;
    config.font = [UIFont systemFontOfSize:22];
    config.textColor = [UIColor orangeColor];
    config.backgroundColor = [UIColor redColor];
    config.showUnderLine = YES;
    
    config.highlightedRange = NSMakeRange(0, 4);
    config.highlightedFont = [UIFont systemFontOfSize:30];
    config.highlightedTextColor = [UIColor redColor];
    config.highlightedBackgroundColor = [UIColor blueColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    if (self.bbView.isBarrageWorking) {
//        [self.bbView pause];
//    }else {
//        [self.bbView resume];
//    }
    
    NSString *string = [NSString stringWithFormat:@"金小白:我是弹幕啊我是弹幕啊我是弹幕啊%d",arc4random() % 10000000];
    BBBarrage *barrage = [[BBBarrage alloc] initWithContent:string config:self.config];
    [self.bbView sendBarrage:barrage];
}

@end
