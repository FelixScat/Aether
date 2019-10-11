//
//  ATMNetworkController.h
//  Aether
//
//  Created by Felix on 2019/10/10.
//

#import <UIKit/UIKit.h>
#import "ATMNWRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATMNetworkController : UICollectionViewController

@property (nonatomic, strong) NSMutableArray<ATMNWRecord *> *recordList;

@end

NS_ASSUME_NONNULL_END
