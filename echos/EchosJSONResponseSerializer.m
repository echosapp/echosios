//
//  EchosJSONResponseSerializer.m
//  echos
//
//  Created by Niraj Khandekar on 2/5/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosJSONResponseSerializer.h"

@implementation EchosJSONResponseSerializer

-(id) responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error
{
    id JSONObject = [super responseObjectForResponse:response data:data error:error];
    if (*error != nil) {
        NSMutableDictionary *userInfo = [(*error).userInfo mutableCopy];
        if (data == nil) {
            userInfo[JSONErrorResponseKey] = @"";
        } else {
            userInfo[JSONErrorResponseKey] = [ [NSString alloc] initWithData:data encoding:NSUTF8StringEncoding ];
        }
        NSError *newError = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
        (*error) = newError;
    }
    
    return (JSONObject);
}

@end
