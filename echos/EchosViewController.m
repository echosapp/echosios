//
//  EchosViewController.m
//  echos
//
//  Created by Niraj Khandekar on 2/2/15.
//  Copyright (c) 2015 echosapp. All rights reserved.
//

#import "EchosViewController.h"


@interface EchosViewController()
{
    UIImageView *_echosBackground;
    FBShimmeringView *_echosShimmer;
    UILabel *_echosLabel;
}
@end

@implementation EchosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup the splash screen
    [ self setupSplashScreen];
    
    // get handle to the echos manager
    // check for current user
    // if user present -> route to home view
    // else route to login view
    
    [ self performUserCheck ];
    
    
}

-(void) setupSplashScreen
{
    
    _echosBackground = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _echosBackground.image = [UIImage imageNamed:@"echosbg"];
    _echosBackground.contentMode = UIViewContentModeScaleAspectFill;
    _echosBackground.alpha = 0.8f;
    [self.view addSubview:_echosBackground];
    
    
    
    _echosShimmer = [ [ FBShimmeringView alloc] init ];
    _echosShimmer.shimmering = YES;
    _echosShimmer.shimmeringBeginFadeDuration = 0.3;
    _echosShimmer.shimmeringOpacity = 0.0f;
    _echosShimmer.shimmeringSpeed = 150.0f;
    
    [ self.view addSubview:_echosShimmer ];
    
    _echosLabel = [[UILabel alloc] initWithFrame:_echosShimmer.bounds];
    _echosLabel.text = @"Echos";
    _echosLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:70.0];
    _echosLabel.textColor = [UIColor whiteColor];
    _echosLabel.textAlignment = NSTextAlignmentCenter;
    _echosLabel.backgroundColor = [UIColor clearColor];
    _echosShimmer.contentView = _echosLabel;
}


-( void ) performUserCheck
{
    EchosManager* em = [ EchosManager sharedClient];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@", [ defaults objectForKey:@"appKey"]);
    if ( [ em currentUser ] )
    {
        
    }
    else
    {
                
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGRect shimmeringFrame = self.view.bounds;
    shimmeringFrame.origin.y = shimmeringFrame.size.height * 0.60;
    shimmeringFrame.size.height = shimmeringFrame.size.height * 0.32;
    _echosShimmer.frame = shimmeringFrame;
}

@end
