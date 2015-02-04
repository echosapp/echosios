//
//  EchosValidation.m
//  echos
//
//  Created by Niraj Khandekar on 1/29/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosValidation.h"

@implementation EchosValidation

+ (EchosValidation* )sharedClient {
    static EchosValidation *_sharedClient = nil;
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

-(NSURLSessionDataTask *)validateUserWithuserName:(NSString *)userName password:(NSString *)password phone:(NSString *)phone countryCode:(NSString *)countryCode apiKey:(NSString *)apiKey completion:(void (^)(NSMutableDictionary *, NSError *))completion
{
    NSDictionary *param = @{@"username":userName,
                            @"password":password,
                            @"phone":phone,
                            @"countryCode":countryCode,
                            @"apiKey":apiKey};
    NSURLSessionDataTask *task = [
                                  self POST:@"/api/v1.0/validation/"
                                  parameters:param
                                  success:^(NSURLSessionDataTask *task, id responseObject)
                                  {
                                       //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                                       NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
                                       if (httpResponse.statusCode == 200) {
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               NSDictionary* res = (NSDictionary *)responseObject;
                                               NSLog(@"Received: %@", res);
                                               completion( nil, nil);
                                               //completion(responseObject[@"results"], nil);
                                           });
                                       } else {
                                           NSLog(@"Received: %@", responseObject);
                                           NSLog(@"Received HTTP %ld", (long)httpResponse.statusCode);
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               completion(nil, nil);
                                           });
                                           
                                       }
                                       
                                   }
                                   failure:^(NSURLSessionDataTask *task, NSError *error)
                                   {
                                       dispatch_async(dispatch_get_main_queue(), ^{
                                           NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                                           NSLog(@"Response: %@", response);
                                           NSLog(@"Response: %@", error);
                                           completion(nil, error);
                                       });
                                   }
                                  ];
    return task;
    
}


@end
