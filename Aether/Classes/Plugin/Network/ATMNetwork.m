//
//  ATMNetwork.m
//  Aether
//
//  Created by Felix on 2019/10/9.
//

#import "ATMNetwork.h"
#import "ATMNWRecord.h"

#import "ATMNetworkController.h"
#import "ATMNWLayout.h"

static NSString * AFNetworkingTaskDidCompleteNotification = @"com.alamofire.networking.task.complete";

@interface ATMNetwork ()

@property (nonatomic, strong) NSMutableArray<ATMNWRecord *> *recordList;

@end

@implementation ATMNetwork

- (NSString *)titleForPlugin {
    return @"Network";
}

- (NSString *)valueForPlugin {
    return [NSString stringWithFormat:@"Total: %lu", (unsigned long)self.recordList.count];
}

- (void)performSelect:(__kindof UIViewController *)viewController {
    
    ATMNetworkController *listVC = [[ATMNetworkController alloc] initWithCollectionViewLayout:[ATMNWLayout new]];
    UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:listVC];
    
    listVC.recordList = self.recordList;
    [viewController presentViewController:vc animated:true completion:nil];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserverForName:AFNetworkingTaskDidCompleteNotification
                                                          object:nil
                                                           queue:nil
                                                      usingBlock:^(NSNotification * _Nonnull note) {
            
            NSURLSessionTask *task = note.object;
            NSAssert([task isKindOfClass:[NSURLSessionTask class]], @"ATM::Network::NotyObject type error");
            
            ATMNWRecord *record = [ATMNWRecord record:task userInfo:note.userInfo];
            [self.recordList insertObject:record atIndex:0];
            if (self.recordList.count > 101) {
                [self.recordList removeLastObject];
            }
        }];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Getter

- (NSMutableArray<ATMNWRecord *> *)recordList {
    if (!_recordList) {
        _recordList = [NSMutableArray<ATMNWRecord *> arrayWithCapacity:101];
    }
    return _recordList;
}


@end
