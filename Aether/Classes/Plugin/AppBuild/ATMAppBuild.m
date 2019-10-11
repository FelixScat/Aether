//
//  ATMAppBuild.m
//  Aether
//
//  Created by Felix on 2019/10/9.
//

#import "ATMAppBuild.h"

@implementation ATMAppBuild

- (NSString *)titleForPlugin {
    return @"Build";
}

- (NSString *)valueForPlugin {
    NSDictionary *infoDictionary = [[NSBundle mainBundle]infoDictionary];
    NSString *build = infoDictionary[(NSString*)kCFBundleVersionKey];
    return build;
}

@end
