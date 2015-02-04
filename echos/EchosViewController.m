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
    //EchosClient* ec = [EchosClient sharedClient];
    
    //AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSDictionary *param = @{@"username":@"kniraj",
                            @"password":@"niraj", @"phone":@"+17323190083", @"countryCode":@"1",@"apiKey":@"2c0c46dc97cce383b9f8530c4c47f853f36e2fd1a2b452fd"};
    NSURL *url = [NSURL URLWithString:@"https://echos-app.appspot.com/api/v1.0/"];
    NSString *uu = [[NSURL URLWithString:@"/validation/" relativeToURL:url] absoluteString];
    NSLog( @"%@",uu );
    // Ensure terminal slash for baseURL path, so that NSURL +URLWithString:relativeToURL: works as expected
    if ([[url path] length] > 0 && ![[url absoluteString] hasSuffix:@"/"]) {
        url = [url URLByAppendingPathComponent:@""];
    }
    NSLog(@"%@", [url absoluteString] );

    //[ URL URLWithString:@"" relativePath: URL];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    [ manager POST:@"/validation/" parameters:param success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"succes");
        NSDictionary* res = (NSDictionary *)responseObject;
        NSLog(@"Received: %@", res);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error");
        //NSLog(error);
    }];

    
}
@end
