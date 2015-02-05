//
//  EchosObject.h
//  echos
//
//  Created by Niraj Khandekar on 2/5/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface EchosObject : NSObject

-(NSMutableDictionary*) parseError: (NSError*) error;
-(NSMutableDictionary*) parseResult: (NSMutableDictionary*) result;

@end
