//
//  ATMWindow.m
//  Aether
//
//  Created by Felix on 2019/10/8.
//

#import "ATMWindow.h"
#import "ATMCollectionLayout.h"
#import "ATMViewController.h"

static CGFloat KATMWindowLevel = 2019;

@implementation ATMWindow

- (BOOL)_canBecomeKeyWindow {
    return false;
}

- (BOOL)_canAffectStatusBarAppearance
{
    return NO;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.windowLevel = UIWindowLevelStatusBar + KATMWindowLevel;
        self.backgroundColor = [UIColor clearColor];
        self.hidden = false;
        UICollectionViewFlowLayout *layout = [[ATMCollectionLayout alloc] init];
        ATMViewController *atmVC = [[ATMViewController alloc] initWithCollectionViewLayout:layout];
        self.rootViewController = atmVC;
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return [(ATMViewController *)self.rootViewController shouldHandlerPoint:point];
}

@end
