//
//  EchosContact.m
//  echos
//
//  Created by Niraj Khandekar on 2/15/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosContact.h"


@interface EchosContact ()
// private attributes go here
@end

@implementation EchosContact

-(instancetype)initwithName:(NSString *)name phone:(NSString *)phone
{
    //self = [super init];
    //NSString* EPhone = [ self normalizePhone: phone ];
    return self;
}

- ( BOOL) isInstalledUser
{
    return false;
}

-(void)setValues:(NSString *)name phone:(NSString *)phone isUser:(BOOL)isUser{
    _formattedPhoneNumber = phone;
    _fullName = name;
    _echosUser = isUser;
    
}

-(NSString*) normalizePhoneNumber : (NSString*)number
                      countryCode : (NSString*)countryCode
{
    NBPhoneNumberUtil *phoneUtil = [NBPhoneNumberUtil sharedInstance];
    NSError *error =  nil;
    
    //TODO!!!
    //populate the countryCode programatically. The user selects the country from the picker and the corresponding code needs to be populated as the default region
    
    NSString *phoneNumberWithCode = [NSString stringWithFormat:@"%@%@",countryCode,number];
    NSLog(@"phoneNumberWithCode: %@", phoneNumberWithCode);
    
    NBPhoneNumber *myNumber = [phoneUtil parse:phoneNumberWithCode defaultRegion:countryCode error:&error];
    NSLog(@"isValidPhoneNumber ? [%@]", [phoneUtil isValidNumber:myNumber] ? @"YES":@"NO");
    
    if (error == nil && ([phoneUtil isValidNumber:myNumber] ? 1:0)) {
        
        
        //E164
        NSLog(@"E164 : %@", [phoneUtil format:myNumber
                                 numberFormat:NBEPhoneNumberFormatE164
                                        error:&error]);
        return @"Success";
    }
    else {
        NSLog(@"Error : %@", [error localizedDescription]);
        return @"Failure";
    }
}

@end
