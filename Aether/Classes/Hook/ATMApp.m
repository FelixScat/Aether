//
//  ATMApp.m
//  Aether
//
//  Created by Felix on 2019/10/8.
//

#import "ATMApp.h"
#import "ATMWindow.h"
#import "ATManager.h"

#import <AppSplitKit/AppSplitKit.h>

@interface ATMApp () <ASAppProtocol>

@end

@implementation ATMApp


+ (void)load {
    [ASManager registClass:self];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions {
    
    // init ATM
    ATMWindow *window = [[ATMWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    [[ATManager manager] setWindow:window];
    
    return YES;
}
@end
