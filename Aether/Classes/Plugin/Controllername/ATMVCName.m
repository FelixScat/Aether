//
//  ATMVCName.m
//  Aether
//
//  Created by Felix on 2019/10/9.
//

#import "ATMVCName.h"

@implementation ATMVCName

- (NSString *)titleForPlugin {
    return @"Visiable";
}

- (NSString *)valueForPlugin {
    
    return NSStringFromClass([[self topViewController] class]);
}

- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}
@end
