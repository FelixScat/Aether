//
//  ATMViewCell.h
//  Aether
//
//  Created by Felix on 2019/10/8.
//

#import <UIKit/UIKit.h>
#import "ATMPluginProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATMViewCell : UICollectionViewCell

- (void)configCell:(id<ATMPluginProtocol>)model;

@end

NS_ASSUME_NONNULL_END
