//
//  EchosClient.h
//  echos
//
//  Created by Niraj Khandekar on 1/29/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface EchosClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
