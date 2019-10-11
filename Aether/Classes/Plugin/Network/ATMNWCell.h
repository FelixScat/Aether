//
//  ATMNWCell.h
//  Aether
//
//  Created by Felix on 2019/10/10.
//

#import <UIKit/UIKit.h>

@class ATMNWRecord;

NS_ASSUME_NONNULL_BEGIN

@interface ATMNWCell : UICollectionViewCell

- (void)config:(ATMNWRecord *)record;

@end

NS_ASSUME_NONNULL_END
