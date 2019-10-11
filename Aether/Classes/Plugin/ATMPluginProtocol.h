//
//  ATMPluginProtocol.h
//  Aether
//
//  Created by Felix on 2019/10/8.
//

#import <Foundation/Foundation.h>

@protocol ATMPluginProtocol <NSObject>

@required

/// return the plugin title
- (NSString *)titleForPlugin;
/// return the plugin value (The Managet Will Problemly trigger this method once per second, so notice the performance)
- (NSString *)valueForPlugin;

@optional

/// user did select this item
/// @param viewController currentViewController
- (void)performSelect:(__kindof UIViewController *)viewController;

@end
