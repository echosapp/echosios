//
//  EchosTextField.h
//  test
//
//  Created by Niraj Khandekar on 2/25/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EchosTextField : UITextField < UIPickerViewDataSource, UIPickerViewDelegate >

- (instancetype) initWithFrame:(CGRect)frame
           withPlaceholderText:(NSString*)text
                      isPicker:(BOOL) isPicker
          withPickerDataSource:(NSArray*) pickerDataSource;

@end
