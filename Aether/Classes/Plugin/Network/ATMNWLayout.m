//
//  ATMNWLayout.m
//  Aether
//
//  Created by Felix on 2019/10/10.
//

#import "ATMNWLayout.h"

@implementation ATMNWLayout

- (instancetype)init {
    self = [super init];
    
    if (self) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        self.itemSize = CGSizeMake(screenSize.width, screenSize.width/2);
        self.minimumLineSpacing = .0f;
        self.minimumInteritemSpacing = .0f;
    }
    
    return self;
}


@end
