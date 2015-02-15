//
//  EchosSession.h
//  echos
//
//  Created by Niraj Khandekar on 1/31/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EchosClient.h"

@interface EchosSession : NSObject

- (NSURLSessionDataTask *) createSessionWithloginCredentials: (NSString*) loginName
                                         password : (NSString*) password
                                           apiKey : (NSString*) apiKey
                                        completion:( void (^)(NSMutableDictionary *result, NSError *error) )completion;

@end
