//
//  EchosContact.h
//  echos
//
//  Created by Niraj Khandekar on 2/15/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NBPhoneNumberUtil.h"

@interface EchosContact : NSObject

// rajesh
- ( BOOL) isInstalledUser;
-(instancetype) initwithName: (NSString*) name
                       phone: (NSString*) phone;

-(NSString*) normalizePhoneNumber : (NSString*)number
                      countryCode : (NSString*)countryCode;

-(void) setValues : (NSString*)name
             phone: (NSString*)phone
            isUser: (BOOL)isUser;

@end
