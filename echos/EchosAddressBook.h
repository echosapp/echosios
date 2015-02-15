//
//  EchosAddressBook.h
//  echos
//
//  Created by Niraj Khandekar on 2/15/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

@interface EchosAddressBook : NSObject

-( BOOL) isEmpty;
-( NSArray * ) normalizeContactsWithRecords : ( ABRecordRef* ) records;
-( void ) persistContactsWithRecords : ( NSArray* ) records;
-( void ) syncAddressBookWithUpdate;
-( void ) syncChangedContactsWithEchos : (NSArray*) changedRecords ;
-( NSArray* ) getAllContacts;

/*

1. Friends Tab -> ask for contact book permission -> get ABRecordRef*
 

2. ABRecordRef* -> pass to EchosManager.normalizeAndPersistContacts( contactdict ) ? async or sync? -> called from?
 
 2.a echosManager [self.addressBook normalizeContacts : contactdict ]
 
 EchosContact* contactArray = [[ NSArray alloc ] initWithCapacity: ABRecordRef.length ]
 
 while( ABRecordRef != nil ) and [ self.addressBook isEmpty ]:
    rec = ABRecordRef->next()
    phones = rec.phones()
    name   = rec.Name()
    for ph in phones:
        echosContact is a derived object from NSPhoneNumber
        class EchosContact: NSPhoneNumber
            bool isEchosUser;
 
        echosContact* ec = [ [ echosContact alloc ] initWithName: name Phone:ph ];
        
        [ contactArray addObject: ec ];

 2.b Once we receive the contact array (array of objects), echosManager [self.addressBook persistContacts : contactArray]
 ->make a core data entry for each object and update corresponding fields.
 
 3. Sync address book with echos addressBook.
 -> Function is launched in background every time the app is opened. (apple notification manager will be the optimized way to do this.)

*/


@end
