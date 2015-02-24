//
//  echosTests.m
//  echosTests
//
//  Created by Niraj Khandekar on 1/28/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "EchosManager.h"
#import "EchosClient.h"
#import "EchosContact.h"

@interface echosTests : XCTestCase

@end

@implementation echosTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/*
- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
*/

-( void ) test_currentUser
{
    EchosManager* em = [ EchosManager sharedClient];
    NSLog( @"%@", [ em currentUser] );

    
}


-(void)test_validateUser
{
    EchosManager* em = [ EchosManager sharedClient];
}


 
-(void) testManager{
    
    BOOL anError;
    NSMutableArray * arrayToPass;
    
    RHAddressBook *ab = [[RHAddressBook alloc]init];
    NSArray* all = [ab people];
    long* numberOfPeople = [ab numberOfPeople];
    NSLog(@"numberOfPeple: %ld", numberOfPeople);
    /*if(!(numberOfPeople = -1)){
    for (NSInteger i =0; i < numberOfPeople; i++) {
        RHPerson *person = [all objectAtIndex:i];
        BOOL status = [ab removePerson:person];
        NSLog(@"status :%d", (int)status);
    }
    }*/
    RHPerson *newPerson = [ab newPersonInDefaultSource];  // create a person
    //NSString *phone = @"17326683140"; // the phone number to add
    //NSString *phone1 = @"17326683141";
    
    //Phone number is a list of phone number, so create a multivalue
    RHMultiStringValue *phoneMultiValue ;
    RHMutableMultiStringValue *mutablePhoneMultiValue = [phoneMultiValue mutableCopy];
    if (! mutablePhoneMultiValue) mutablePhoneMultiValue = [[RHMutableMultiStringValue alloc] initWithType:kABMultiStringPropertyType];
    
    //RHPersonPhoneIPhoneLabel casts kABPersonPhoneIPhoneLabel to the correct toll free bridged type, see RHPersonLabels.h
    [mutablePhoneMultiValue addValue:@"17326683140" withLabel:RHPersonPhoneIPhoneLabel];
    [mutablePhoneMultiValue addValue:@"17326683141" withLabel:RHPersonPhoneMobileLabel];
    [newPerson setPhoneNumbers:mutablePhoneMultiValue];
    NSString *first = @"rajesh";
    NSString *last = @"narasaiah";
    [newPerson setFirstName:first];
    [newPerson setLastName:last];
    [newPerson save];
    anError = [ab addPerson:newPerson];
    
    if (!anError) {
        NSLog( @"Error while adding the record to the address book for person 1 ");
    }
    
    RHPerson *newPerson1 = [ab newPersonInDefaultSource]; // create a person
    
    NSString *ph = @"17326683142"; // the phone number to add
    
    RHMultiStringValue *phMultiValue = [newPerson phoneNumbers];
    RHMutableMultiStringValue *mutablePhMultiValue = [phMultiValue mutableCopy];
    [mutablePhMultiValue addValue:ph withLabel:RHPersonPhoneIPhoneLabel];
    [newPerson1 setPhoneNumbers:mutablePhMultiValue];
    NSString *first1 = @"niraj";
    NSString *last1 = @"khandekar";
    [newPerson1 setFirstName:first1];
    [newPerson1 setLastName:last1];
    [newPerson1 save];
    anError = [ab addPerson:newPerson1];
    
    if (!anError) {
        NSLog(@"Error while adding the record to the address book for person 2 ");
    }
    
    NSArray *contArray = [ab people];
    NSLog(@"array count %ld", [contArray count]);
    EchosManager *em = [[EchosManager alloc]init];
    [em normalizeAndPersistContacts:contArray];
    
    
    
}

@end
