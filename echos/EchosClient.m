//
//  EchosClient.m
//  echos
//
//  Created by Niraj Khandekar on 1/29/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosClient.h"

static NSString * const prodUrlString = @"https://echos-app.appspot.com/api/v1.0/";
static NSString * const testUrlString = @"http://localhost:8080/api/v1.0/";

@implementation EchosClient

+ (instancetype)sharedClient {
    static EchosClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        [config setHTTPAdditionalHeaders:@{ @"User-Agent" : @"Echos iOS 1.0"}];
        
        // init the client
        _sharedClient = [[EchosClient alloc] initWithBaseURL:[NSURL URLWithString:prodUrlString] sessionConfiguration:config];
        
        // set the serializer to custom serializer - this intercepts the failure calls and adds the response object
        _sharedClient.responseSerializer = [EchosJSONResponseSerializer serializer];
        
        // TODO: set the security policy.
        //_sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}


@end
