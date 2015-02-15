//
//  EchosSession.m
//  echos
//
//  Created by Niraj Khandekar on 1/31/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosSession.h"

@implementation EchosSession

- (NSURLSessionDataTask *) createSessionWithloginCredentials: (NSString*) loginName
                                                   password : (NSString*) password
                                                     apiKey : (NSString*) apiKey
                                                  completion:( void (^)(NSMutableDictionary *result, NSError *error) )completion
{
    // TODO: Change the username param to loginName - since we will let users login using their phone numbers
    NSDictionary *param = @{@"username":loginName,
                            @"password":password,
                            @"apiKey":apiKey};
    NSURLSessionDataTask *task = [
                                  [ EchosClient sharedClient ] POST:@"session/"
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
