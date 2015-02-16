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
// private attributes
@property( nonatomic, strong ) NSString* apiKey;
@property (nonatomic, strong) EchosUser *user;
@property (nonatomic, strong) EchosSession *session;
@property (nonatomic, strong) EchosValidation* validate;
@property (nonatomic, strong) SSKeychain *keychain;
@property (nonatomic, strong) UIActivityIndicatorView *indicator;
@end

@implementation EchosManager

#pragma mark Singleton Methods

+ (instancetype)sharedClient {
    static EchosManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[EchosManager alloc] initSharedClient ];
    });
    
    return _sharedClient;
}


- ( instancetype )initSharedClient {
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


// get current user TODO: this method still needs to be fixed. fix once the session method is fixed
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

#pragma mark validation endpoint functions
// /api/v1.0/validation/

- (NSURLSessionDataTask* ) validateUserWithuserName:(NSString *)userName password:(NSString *)password phone:(NSString *)phone countryCode:(NSString *)countryCode completion:(void (^)(NSMutableDictionary * res))completion
{
    NSURLSessionDataTask *task = [ self.validate validateUserWithuserName:userName password:password phone:phone countryCode:countryCode apiKey:self.apiKey completion:^(NSMutableDictionary *result, NSError *error) {
        __block NSMutableDictionary* res = nil;
        if ( result )
        {
            res = [self parseResult:result];
        }
        else
        {
            res = [self parseError:error];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completion( res );
        });
        
    }];
    return task;
}

#pragma mark session methods
- ( NSMutableDictionary* ) createSessionWithloginCredentials: ( NSString* )loginName
                                        password : ( NSString* )password
{
    return nil;
}


#pragma mark user methods
- (NSMutableDictionary* ) createUserwithsessionToken:(NSString *)sessionToken validationCode:(NSInteger *)validationCode
{
    return nil;
}


-( NSURLSessionDataTask* ) getInstalledUsersWithPhone: (NSArray * )phoneNumbers
                                           completion: (void (^) (NSMutableDictionary * res)) completion
{
    return nil;
}

@end
