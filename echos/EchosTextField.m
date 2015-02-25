//
//  EchosTextField.m
//  test
//
//  Created by Niraj Khandekar on 2/25/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosTextField.h"

@interface EchosTextField()
{
    NSString* _placeholderText;
    BOOL _isPicker;
    NSArray* _pickerDataSource;
}

@property( strong, nonatomic) UIPickerView* pickerView;

@end

@implementation EchosTextField

- (instancetype)initWithFrame:(CGRect)frame withPlaceholderText:(NSString *)text isPicker:(BOOL)isPicker withPickerDataSource:(NSArray *)pickerDataSource
{
    self = [super initWithFrame:frame];
    if ( self )
    {
    
        self.placeholder = text;
        self.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight"  size:15];
        
        if ( isPicker )
        {
            _pickerDataSource = pickerDataSource;
            self.pickerView = [[ UIPickerView alloc ] initWithFrame: CGRectMake(0, 0, 0, 0) ];
            self.pickerView.showsSelectionIndicator = YES;
            self.pickerView.dataSource = self;
            self.pickerView.delegate = self;
            self.inputView = self.pickerView;
        }
        
    
    }
    
    return self;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return _pickerDataSource.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString* country = (NSString*)_pickerDataSource[row];
    [ self setText:country ];
    return country;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self resignFirstResponder];// this will do the trick
}

@end
