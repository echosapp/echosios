//
//  EchosClient.m
//  echos
//
//  Created by Niraj Khandekar on 1/29/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosClient.h"

@implementation EchosClient

+ (instancetype)sharedClient {
    static EchosClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"https://echos-app.appspot.com/"];
        [NSURL URLWithString:@"/api/v1.0/" relativeToURL:baseURL];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        [config setHTTPAdditionalHeaders:@{@"User-Agent" : @"Echos ios 1.0"}];
        
       // NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
       //                                                   diskCapacity:50 * 1024 * 1024
       //                                                       diskPath:nil];
        
       // [config setURLCache:cache];
        
        // AFNetworking Client
        _sharedClient = [ [ self alloc] initWithBaseURL:baseURL ];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
        _sharedClient.requestSerializer = [AFJSONRequestSerializer serializer];


    });
    
    return _sharedClient;
}

@end
