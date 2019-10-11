//
//  ATMAppBundle.m
//  Aether
//
//  Created by Felix on 2019/10/9.
//

#import "ATMAppBundle.h"

@implementation ATMAppBundle

- (NSString *)titleForPlugin {
    return @"BundleName";
}

- (NSString *)valueForPlugin {
    NSDictionary *infoDictionary = [[NSBundle mainBundle]infoDictionary];
    NSString *bundleName = infoDictionary[(NSString *)kCFBundleNameKey];
    return bundleName;
}

@end
