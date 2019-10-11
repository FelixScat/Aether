//
//  ATMFPS.m
//  Aether
//
//  Created by Felix on 2019/10/8.
//

#import "ATMFPS.h"

@interface ATMFPS ()
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) CFTimeInterval lastTimestamp;
@property (nonatomic, assign) NSUInteger performTimes;
@property (nonatomic, assign) float fps;
@end

@implementation ATMFPS

- (instancetype)init {
    self = [super init];
    if (self) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction:)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)displayLinkAction:(CADisplayLink *)link {
    
    if (_lastTimestamp == 0) {
        _lastTimestamp = link.timestamp;
        return;
    }
    // 累加方法执行的次数
    _performTimes ++;
    // 记录执行的时间
    NSTimeInterval interval = link.timestamp - _lastTimestamp;
    // 当时间经过一秒的时候再计算FPS，否则计算的太过频繁
    if (interval < 1) { return; }
    _lastTimestamp = link.timestamp;
    // iOS正常刷新率为每秒60次，执行次数/时间
    float fps = _performTimes / interval;
    // 重新初始化记录值
    _performTimes = 0;
    _fps = fps;
}


#pragma mark - ATMPluginProtocol

- (NSString *)titleForPlugin {
    
    return @"FPS";
}

- (NSString *)valueForPlugin {
    
    return [NSString stringWithFormat:@"%.0f", _fps];
}

@end
