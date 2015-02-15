//
//  EchosValidation.m
//  echos
//
//  Created by Niraj Khandekar on 1/29/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosValidation.h"

@implementation EchosValidation

-(NSURLSessionDataTask *)validateUserWithuserName:(NSString *)userName
                                         password:(NSString *)password
                                            phone:(NSString *)phone
                                      countryCode:(NSString *)countryCode
                                           apiKey:(NSString *)apiKey
                                       completion:(void (^)(NSMutableDictionary *, NSError *))completion
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
                                      // on success dispatch the response to completion handler
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          NSMutableDictionary* res = (NSMutableDictionary *)responseObject;
                                          completion(res, nil);
                                      });
                                   }
                                   failure:^(NSURLSessionDataTask *task, NSError *error)
                                   {
                                       // on failure dispatch the error to failure handler
                                       dispatch_async(dispatch_get_main_queue(), ^{
                                           completion(nil, error);
                                       });
                                   }
                                  ];
    return task;
    
}

@end
