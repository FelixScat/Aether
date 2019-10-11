//
//  ATMNWRecord.m
//  Aether
//
//  Created by Felix on 2019/10/10.
//

#import "ATMNWRecord.h"

static NSString * AFNetworkingTaskDidCompleteResponseDataKey = @"com.alamofire.networking.complete.finish.responsedata";

@implementation ATMNWRecord

+ (instancetype)record:(NSURLSessionTask *)task userInfo:(NSDictionary *)userInfo {
    ATMNWRecord *obj = [[self alloc] init];
    
    NSURLRequest *request = task.originalRequest;
    NSURL *url = request.URL;
    
    obj.method = request.HTTPMethod;
    
    if (url.query) {
        obj.url = [url.absoluteString stringByReplacingOccurrencesOfString:[@"?" stringByAppendingString:url.query] withString:@""];
    }else {
        obj.url = url.absoluteString;
    }
    
    if (request.allHTTPHeaderFields) {
        obj.requestHeader = [request.allHTTPHeaderFields description];
    }
    
    if (url.query) {
        NSURLComponents *c = [NSURLComponents componentsWithString:url.absoluteString];
        NSMutableDictionary *querys = [NSMutableDictionary dictionaryWithCapacity:c.queryItems.count];
        for (NSURLQueryItem *item in c.queryItems) {
            querys[item.name] = item.value;
        }
        obj.query = [querys description];
    }
    
    if (request.HTTPBody) {
        NSString *body = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
        obj.requestBody = body;
        NSArray *pairs = [body componentsSeparatedByString:@"&"];
        if (pairs.count) {
            NSMutableDictionary *paramsDic = [NSMutableDictionary dictionaryWithCapacity:pairs.count];
            for (NSString *pair in pairs) {
                NSArray *kv = [pair componentsSeparatedByString:@"="];
                if (2 == kv.count) {
                    paramsDic[kv.firstObject] = kv.lastObject;
                }
            }
            if (paramsDic) {
                obj.requestBody = [paramsDic description];
            }
        }
    }
    
    if ([userInfo.allKeys containsObject:AFNetworkingTaskDidCompleteResponseDataKey]) {
        NSData *data = userInfo[AFNetworkingTaskDidCompleteResponseDataKey];
        NSString *response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        if (response) {
            obj.response = response;
        }
        
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        if (json) {
            obj.response = [json description];
        }
    }
    
    return obj;
}

@end
