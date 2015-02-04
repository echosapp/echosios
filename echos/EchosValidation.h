//
//  EchosValidation.h
//  echos
//
//  Created by Niraj Khandekar on 1/29/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EchosClient.h"

@interface EchosValidation : NSObject

- (NSURLSessionDataTask *)validateUserWithuserName: (NSString*) userName
                                         password : (NSString*) password
                                            phone : (NSString*) phone
                                      countryCode : (NSString*) countryCode
                                           apiKey : (NSString*) apiKey
                                        completion:( void (^)(NSMutableDictionary *results, NSError *error) )completion;


@end
