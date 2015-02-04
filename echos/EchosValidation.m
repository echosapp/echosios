//
//  EchosValidation.m
//  echos
//
//  Created by Niraj Khandekar on 1/29/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosValidation.h"

@implementation EchosValidation


-(NSURLSessionDataTask *)validateUserWithuserName:(NSString *)userName password:(NSString *)password phone:(NSString *)phone countryCode:(NSString *)countryCode apiKey:(NSString *)apiKey completion:(void (^)(NSMutableDictionary *, NSError *))completion
{
    NSDictionary *param = @{@"username":userName,
                            @"password":password,
                            @"phone":phone,
                            @"countryCode":countryCode,
                            @"apiKey":apiKey};
    NSURLSessionDataTask *task = [
                                  [ EchosClient sharedClient ] POST:@"validation/"
                                  parameters:param
                                  success:^(NSURLSessionDataTask *task, id responseObject)
                                  {
                                      NSLog(@"%@", responseObject);
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          //NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                                          //NSLog(@"Response: %@", response);
                                          //NSLog(@"Response: %@", error);
                                          completion(responseObject, nil);
                                      });

                                       //[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                                      /*
                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
                                       if (httpResponse.statusCode == 200) {
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               //NSDictionary* res = (NSDictionary *)responseObject;
                                               //NSLog(@"Received: %@", res);
                                               
                                               completion( nil, nil);
                                               //completion(responseObject[@"results"], nil);
                                           });
                                       } else {
                                           //NSLog(@"Received: %@", responseObject);
                                           //NSLog(@"Received HTTP %ld", (long)httpResponse.statusCode);
                                           dispatch_async(dispatch_get_main_queue(), ^{
                                               completion(nil, nil);
                                           });
                                           
                                       }
                                       */
                                       
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
