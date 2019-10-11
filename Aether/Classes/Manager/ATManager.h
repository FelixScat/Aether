//
//  ATManager.h
//  Aether
//
//  Created by Felix on 2019/10/8.
//

#import <Foundation/Foundation.h>
#import "ATMWindow.h"
#import "ATMPluginProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ATManager : NSObject

@property (nonatomic, strong) ATMWindow *window;
@property (nonatomic, strong) NSMutableArray<ATMPluginProtocol> *plugins;


+ (instancetype)manager;

@end

NS_ASSUME_NONNULL_END
