//
//  EchosManager.m
//  echos
//
//  Created by Niraj Khandekar on 1/28/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosManager.h"

#define SERVICE_NAME @"Echos"
#define AUTH_TOKEN_KEY @"auth_token"
#define USERKEY @"userkey"
#define PASSKEY @"passkey"
#define UPDATE_TIME @"updatetime"

@interface EchosManager ()
// public attributes
@property( nonatomic, strong ) NSString* apiKey;
@property (nonatomic, strong) EchosUser *user;
@property (nonatomic, strong) EchosSession *session;
@property (nonatomic, strong) EchosValidation* validate;
@property (nonatomic, strong) SSKeychain *keychain;
//@property (nonatomic, strong) UIActivityIndicatorView *indicator;
@end

@implementation EchosManager

#pragma mark Singleton Methods

+ (instancetype)sharedInstance {
    static EchosManager *sharedEchosManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedEchosManager = [[self alloc] init];
    });
    return sharedEchosManager;
}


- (id)init {
    if (self = [super init])
    {
        self.apiKey = @"2c0c46dc97cce383b9f8530c4c47f853f36e2fd1a2b452fd";
        self.user = [[EchosUser alloc] init ];
        self.session = [[ EchosSession alloc ] init ];
        self.validate = [[ EchosValidation alloc ] init];
        self.keychain = [[ SSKeychain alloc ] init ];
        
    }
    return self;
}

- (void)clearSavedCredentials
{
    [ self setSessionToken:nil];
    [ self setUserKey:nil];
    [ self setPasswordKey:nil];
}

- (NSString *)sessionToken {
    return [self secureValueForKey:AUTH_TOKEN_KEY];
}

- (void)setSessionToken:(NSString *)sessionToken
{
    [self setSecureValue:sessionToken forKey:AUTH_TOKEN_KEY];
    [self setSecureValue: [NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]] forKey:UPDATE_TIME ];
}

- (NSString *)userKey {
    return [self secureValueForKey:USERKEY];
}

- (void)setUserKey:(NSString*) userkey
{
    [self setSecureValue:userkey forKey:USERKEY];
}

-(NSString *)passwordKey {
    return [self secureValueForKey:PASSKEY];
}

- (void)setPasswordKey:(NSString*) passwordkey
{
    [self setSecureValue:passwordkey forKey:PASSKEY];
}

- (void)setSecureValue:(NSString *)value forKey:(NSString *)key
{
    if (value) {
        [SSKeychain setPassword:value
                     forService:SERVICE_NAME
                        account:key];
    } else {
        [SSKeychain deletePasswordForService:SERVICE_NAME account:key];
    }
}

- (NSString *)secureValueForKey:(NSString *)key {
    return [SSKeychain passwordForService:SERVICE_NAME account:key];
}


// get current user
-( NSInteger* ) currentUser
{
    if ( [self sessionToken] )
    {
        double updatetime = [ [ self secureValueForKey:UPDATE_TIME ] doubleValue];
        double cTime = (double) [ [NSDate date] timeIntervalSince1970];
        if ( (cTime - updatetime) > 596160 )
        {
            NSMutableDictionary* result = [ self createSessionWithloginCredentials:[self userKey] password:[self passwordKey] ];
            if ( [result valueForKey:@"error" ] == nil )
            {
                [ self setSessionToken:[ result valueForKey:@"sessionToken"]];
                return (NSInteger*) 1;
            }
        }
    }
    return nil;
}

#pragma mark validation methods
- (NSMutableDictionary* ) validateUserWithuserName:(NSString *)userName password:(NSString *)password phone:(NSString *)phone countryCode:(NSString *)countryCode
{
    __block NSMutableDictionary* res = nil;
    NSURLSessionDataTask *task = [ [EchosValidation sharedClient] validateUserWithuserName:userName password:password phone:phone countryCode:countryCode apiKey:self.apiKey completion:^(NSMutableDictionary *results, NSError *error) {
        if ( results )
        {
            res = results;
        }
        else
        {
            res = [ @{@"error":(NSString*)error} mutableCopy ];
        }
        
    }];
    NSLog( @"%@", [ task description] );
    return res;
}

- ( NSMutableDictionary* ) createSessionWithloginCredentials: ( NSString* )loginName
                                        password : ( NSString* )password
{
    return nil;
}

- (NSMutableDictionary* ) createUserwithsessionToken:(NSString *)sessionToken validationCode:(NSInteger *)validationCode
{
    return nil;
}


@end
