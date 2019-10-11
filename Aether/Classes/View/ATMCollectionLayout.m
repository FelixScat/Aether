//
//  ATMCollectionLayout.m
//  Aether
//
//  Created by Felix on 2019/10/8.
//

#import "ATMCollectionLayout.h"

@implementation ATMCollectionLayout

- (instancetype)init {
    self = [super init];
    
    if (self) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        self.itemSize = CGSizeMake(screenSize.width/2, screenSize.width/2);
        self.minimumLineSpacing = .0f;
        self.minimumInteritemSpacing = .0f;
    }
    
    return self;
}

@end
