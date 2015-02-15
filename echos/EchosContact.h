//
//  EchosContact.h
//  echos
//
//  Created by Niraj Khandekar on 2/15/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EchosContact : NSObject


- ( BOOL) isInstalledUser;
-(instancetype) initwithName: (NSString*) name
                       phone: (NSString*) phone;

@end
