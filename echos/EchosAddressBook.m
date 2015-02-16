//
//  EchosAddressBook.m
//  echos
//
//  Created by Niraj Khandekar on 2/15/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosAddressBook.h"


@implementation EchosAddressBook


/*
-(void) syncChangedContactsWithEchos:(NSArray *)changedRecords
{
    NSDictionary *param = @{@"phone":changedRecords,
                            @"apiKey":apiKey};
    NSURLSessionDataTask *task = [
                                  [ EchosClient sharedClient ] GET:@"users/"
                                  parameters:param
                                  success:^(NSURLSessionDataTask *task, id responseObject)
                                  {
                                      // on success dispatch the response to completion handler
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          NSMutableDictionary* res = (NSMutableDictionary *)responseObject;
                                          completion(res, nil);
                                      });
                                  }
                                  failure:^(NSURLSessionDataTask *task, NSError *error)
                                  {
                                      // on failure dispatch the error to failure handler
                                      dispatch_async(dispatch_get_main_queue(), ^{
                                          completion(nil, error);
                                      });
                                  }
                                  ];
    return task;
    
}

*/

-( BOOL) isEmpty
{
    return true;
}
-( NSArray * ) normalizeContactsWithRecords : ( ABRecordRef* ) records
{
    NSArray* contactArray = @[];
    return contactArray;
}

-( void ) persistContactsWithRecords : ( NSArray* ) records
{
    
}

-( void ) syncAddressBookWithUpdate
{
    
}

-( void ) syncChangedContactsWithEchos : (NSArray*) changedRecords
{
    
}

-( NSArray* ) getAllContacts
{
    NSArray* contactArray = @[];
    return contactArray;
}

@end
