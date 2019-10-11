//
//  ATManager.m
//  Aether
//
//  Created by Felix on 2019/10/8.
//

#import "ATManager.h"
#import "ATMFPS.h"
#import "ATMMemory.h"
#import "ATMCPU.h"
#import "ATMNetwork.h"
#import "ATMAppVersion.h"
#import "ATMAppBuild.h"
#import "ATMAppBundle.h"
#import "ATMVCName.h"


@implementation ATManager

static ATManager *_instance = nil;

+ (instancetype)manager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

#pragma mark - Getter

- (NSMutableArray<ATMPluginProtocol> *)plugins {
    if (!_plugins) {
        _plugins = [NSMutableArray<ATMPluginProtocol> arrayWithCapacity:7];
        [_plugins addObject:[ATMFPS new]];
        [_plugins addObject:[ATMMemory new]];
        [_plugins addObject:[ATMCPU new]];
        [_plugins addObject:[ATMNetwork new]];
        
        [_plugins addObject:[ATMAppVersion new]];
        [_plugins addObject:[ATMAppBuild new]];
        [_plugins addObject:[ATMAppBundle new]];
        [_plugins addObject:[ATMVCName new]];
    }
    return _plugins;
}

@end
