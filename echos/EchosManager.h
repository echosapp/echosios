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
#import "EchosContact.h"
#import <AddressBook/AddressBook.h>


@interface EchosManager : EchosObject

// public functions

+(instancetype) sharedClient;

-( NSString* ) currentUser;


// Validate Functions
// niraj
- (NSURLSessionDataTask*) validateUserWithPhone:(NSString *)phone
                                    countryCode:(NSString *)countryCode
                                     completion:(void (^)(NSMutableDictionary* res)) completion;



// Session Functions
// niraj
- ( NSURLSessionDataTask* ) refreshSessionWithToken;


// User Functions
// niraj
-( NSURLSessionDataTask* ) createUserwithsessionToken: ( NSString * )sessionToken
                                     validationCode : ( NSInteger * )validationCode
                                          completion: (void (^)(NSMutableDictionary* res)) completion;

// niraj
-( NSURLSessionDataTask* ) editProfilePictureWithImage: (NSData*) imageData;

//niraj
-( NSURLSessionDataTask* ) editDisplayNameWithName: (NSString*) displayName;




// rajesh
-( NSURLSessionDataTask* ) getInstalledUsersWithPhone: (NSArray * )phoneNumbers
                                          completion: (void (^) (NSMutableDictionary * res)) completion;
// return = key, lastupdatedtime and phone
// we pass an array of phone numbers - formatted to E164 - and get a dictionary with installed user information.


// Friends endpoint




// address book
// rajesh
-(NSMutableArray*) normalizeAndPersistContacts: (CFArrayRef*)contactsArray;



@end
