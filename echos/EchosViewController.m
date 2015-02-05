//
//  EchosViewController.m
//  echos
//
//  Created by Niraj Khandekar on 2/2/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosViewController.h"
#import "EchosClient.h"
#import "AFHTTPSessionManager.h"

@implementation EchosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickValidate:(id)sender
{
    EchosManager* em = [ EchosManager sharedClient ];
    [ em validateUserWithuserName:@"nirajk" password:@"niraj" phone:@"7323190083" countryCode:@"1" completion:^(NSMutableDictionary * res) {
        NSLog(@"%@", res );
    }];
}

- (IBAction)onClickValidateCustom:(id)sender
{
    
    NSLog(@"abc");
}
@end
