//
//  ATMAppVersion.m
//  Aether
//
//  Created by Felix on 2019/10/9.
//

#import "ATMAppVersion.h"

@implementation ATMAppVersion

- (NSString *)titleForPlugin {
    return @"AppVersion";
}

- (NSString *)valueForPlugin {
    NSDictionary *infoDictionary = [[NSBundle mainBundle]infoDictionary];
    NSString *version = infoDictionary[@"CFBundleShortVersionString"];
    return version;
}

@end
