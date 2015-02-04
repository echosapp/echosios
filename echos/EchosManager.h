//
//  EchosManager.h
//  echos
//
//  Created by Niraj Khandekar on 1/28/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EchosUser.h"
#import "EchosValidation.h"
#import "EchosSession.h"
#import "SSKeychain.h"


@interface EchosManager : NSObject

// public functions

+(instancetype) sharedClient;

-( NSInteger* ) currentUser;

// Validate Functions
- ( NSMutableDictionary* ) validateUserWithuserName: ( NSString* )userName
                                           password: ( NSString * )password
                                             phone : ( NSString * )phone
                                       countryCode : ( NSString * )countryCode;



// Session Functions
- ( NSMutableDictionary* ) createSessionWithloginCredentials: ( NSString* )loginName
                                                   password : ( NSString* )password;


// User Functions
-( NSMutableDictionary* ) createUserwithsessionToken: ( NSString * )sessionToken
                                     validationCode : ( NSInteger * )validationCode;






@end
