//
//  EchosObject.m
//  echos
//
//  Created by Niraj Khandekar on 2/5/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosObject.h"

@implementation EchosObject

-(NSMutableDictionary*) parseError: (NSError*) error
{
    NSString*  JSONErrorResponseKey = @"JSONErrorResponseKey";
    NSString*err = [ [error userInfo] objectForKey:JSONErrorResponseKey ];
    NSData *data = [ err dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableDictionary* res = [ [ NSMutableDictionary  alloc ] initWithObjectsAndKeys:json,@"error", nil];
    return res;
}

-(NSMutableDictionary*) parseResult: (NSMutableDictionary*) result
{
    NSMutableDictionary* res = [ [ NSMutableDictionary  alloc ] initWithObjectsAndKeys:result,@"response", nil];
    return res;
}

@end
