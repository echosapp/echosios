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
    
    CFErrorRef *anError;
    NSMutableArray * arrayToPass;
    
    ABAddressBookRef addBook = ABAddressBookCreateWithOptions(NULL, nil); // create address book record
    ABRecordRef person = ABPersonCreate(); // create a person
    
    NSString *phone = @"17326683140"; // the phone number to add
    NSString *phone1 = @"17326683141";
    
    //Phone number is a list of phone number, so create a multivalue
    ABMutableMultiValueRef phoneNumberMultiValue  = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    ABMultiValueAddValueAndLabel(phoneNumberMultiValue, (__bridge CFTypeRef)(phone), kABPersonPhoneMobileLabel, NULL);
    ABMultiValueAddValueAndLabel(phoneNumberMultiValue, (__bridge CFTypeRef)(phone1), kABPersonPhoneIPhoneLabel, NULL);
    ABRecordSetValue(person, kABPersonFirstNameProperty, @"Rajesh" , nil); // first name of the new person
    ABRecordSetValue(person, kABPersonLastNameProperty, @"Narasaiah", nil); // his last name
    ABRecordSetValue(person, kABPersonPhoneProperty, phoneNumberMultiValue, nil); // set the phone number property
    BOOL add = ABAddressBookAddRecord(addBook, person, anError); //add the new person to the record
    
    if (anError != nil) {
        NSLog( @"Error while adding the record to the address book for person 1 : %@", CFErrorCopyFailureReason(*anError));
    }
    
    ABRecordRef person1 = ABPersonCreate(); // create a person
    
    NSString *ph = @"17326683142"; // the phone number to add
    NSString *ph1 = @"017326683143";
    
    //Phone number is a list of phone number, so create a multivalue
    ABMutableMultiValueRef phNumberMultiValue  = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    ABMultiValueAddValueAndLabel(phNumberMultiValue, (__bridge CFTypeRef)(ph), kABPersonPhoneMobileLabel, NULL);
    ABMultiValueAddValueAndLabel(phNumberMultiValue, (__bridge CFTypeRef)(ph1), kABPersonPhoneIPhoneLabel, NULL);
    ABRecordSetValue(person1, kABPersonFirstNameProperty, @"Nirak" , nil); // first name of the new person
    ABRecordSetValue(person1, kABPersonLastNameProperty, @"Khandekar", nil); // his last name
    ABRecordSetValue(person1, kABPersonPhoneProperty, phNumberMultiValue, nil); // set the phone number property
    ABAddressBookAddRecord(addBook, person1, anError); //add the new person to the record
    if (anError!=nil) {
        NSLog(@"Error while adding the record to the address book for person 2 : %@", CFErrorCopyFailureReason(*anError));
    }
    
    
    CFArrayRef testArray = ABAddressBookCopyArrayOfAllPeople(addBook);
    BOOL status;
    for (NSInteger i =0; i < CFArrayGetCount(testArray); i++) {
        ABRecordRef contactRef = CFArrayGetValueAtIndex(testArray, i);
        status = ABAddressBookRemoveRecord(addBook, contactRef, nil);
    }
    
    status = ABAddressBookAddRecord(addBook, person, nil);
    ABAddressBookSave(addBook, nil);
    status = ABAddressBookAddRecord(addBook, person1, nil);
    ABAddressBookSave(addBook, nil);
    testArray = ABAddressBookCopyArrayOfAllPeople(addBook);
    NSLog(@"array count %ld", CFArrayGetCount(testArray));
    ABRecordRef *secondEntry = CFArrayGetValueAtIndex(testArray, 1);
    NSLog(@"name: %@ , phoneNumber : %@", ABRecordCopyValue(secondEntry, kABPersonFirstNameProperty), ABRecordCopyValue(secondEntry, kABPersonPhoneProperty));
    EchosManager *em = [[EchosManager alloc]init];
    [em normalizeAndPersistContacts:&testArray];
    
    CFRelease(person);
    CFRelease(person1); // relase the ABRecordRef  variable
    CFRelease(addBook);
    
    
}

@end
