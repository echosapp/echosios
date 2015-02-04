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

/*
+ (instancetype)sharedClient {
    static EchosClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"https://echos-app.appspot.com/api/v1.0/"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        [config setHTTPAdditionalHeaders:@{@"User-Agent" : @"Echos iOS 1.0"}];
        
        _sharedClient = [ [ self alloc ] initWithBaseURL:baseURL sessionConfiguration:config ];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.responseSerializer.acceptableContentTypes = [ NSSet setWithObjects:@"application/json", nil ];
        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];

    });
    
    return _sharedClient;
}
*/

+ (instancetype)sharedClient {
    static EchosClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[EchosClient alloc] initWithBaseURL:[NSURL URLWithString:prodUrlString]];
        //_sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}


@end
