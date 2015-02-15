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
#import "EchosObject.h"


@interface EchosManager : EchosObject

// public functions

+(instancetype) sharedClient;

-( NSInteger* ) currentUser;

// Validate Functions
- (NSURLSessionDataTask* )   validateUserWithuserName:(NSString *)userName
                                            password:(NSString *)password
                                               phone:(NSString *)phone
                                         countryCode:(NSString *)countryCode
                                          completion:(void (^)(NSMutableDictionary * res))completion;



// Session Functions
- ( NSMutableDictionary* ) createSessionWithloginCredentials: ( NSString* )loginName
                                                   password : ( NSString* )password;


// User Functions
-( NSMutableDictionary* ) createUserwithsessionToken: ( NSString * )sessionToken
                                     validationCode : ( NSInteger * )validationCode;


-( NSURLSessionDataTask* ) getInstalledUsersWithPhone: (NSArray * )phoneNumbers
                                          completion: (void (^) (NSMutableDictionary * res)) completion;
// we pass an array of phone numbers - formatted to E164 - and get a dictionary with installed user information.









@end
