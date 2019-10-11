//
//  ATMNWRecord.h
//  Aether
//
//  Created by Felix on 2019/10/10.
//

#import <Foundation/Foundation.h>
#import "ATMNWRequest.h"
#import "ATMNWResponse.h"

NS_ASSUME_NONNULL_BEGIN

static NSString *ATMNWKey = @"ATMNWKey";
static NSString *ATMNWValue = @"ATMNWValue";

@interface ATMNWRecord : NSObject

/// descrip url
@property (nonatomic, copy) NSString *url;

/// request headers
@property (nonatomic, copy) NSString *requestHeader;
/// queryParams
@property (nonatomic, copy) NSString *query;
/// JTTP Method
@property (nonatomic, copy) NSString *method;

@property (nonatomic, copy) NSString *requestBody;

/// response Body
@property (nonatomic, copy) NSString *response;

+ (instancetype)record:(NSURLSessionTask *)task userInfo:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
