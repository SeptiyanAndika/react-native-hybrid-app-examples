//
//  PassingDataViewController.m
//  RNEmbeddedAppExample
//
//  Created by Dave Sibiski on 9/2/15.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "PassingDataViewController.h"
#import "AppDelegate.h"
#import "RCTRootView.h"

@interface PassingDataViewController ()

@end

@implementation PassingDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Passing Data";
    
    // We need a reference to the AppDelegate since that is where we stored our `RCTBridge`.
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Here we create a `RCTRootView` that initializes with the `RCTBridge` that we already pre-loaded.
    // initialProperies will be a `prop` in the `PassingData` component.
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:delegate.bridge
                                                     moduleName:@"PassingData"
                                              initialProperties:[self data]];
    
    // We want this view to take up the entire screen.
    // It's surprising that we need absolute coordinates here, and need to place this below
    // the 20pt status bar and 44 pt nav bar.
    rootView.frame = CGRectMake(0, 64.0,
                                [UIScreen mainScreen].bounds.size.width,
                                [UIScreen mainScreen].bounds.size.height - 64.0);

    // Each `ViewController` comes with it's own "base" view, here we just want to add our `RCTRootView`
    // to that "base" view so that it is visible on the screen.
    [self.view addSubview:rootView];
}

// Just some random data. It is an `NSDictionary` with an `NSArray` that has the key `data`. In our React
// component it can be accessed as `this.props.data`.
- (NSDictionary *)data {
    return @{
        @"data": @[
            @"Here",
            @"is",
            @"an",
            @"example",
            @"of",
            @"passing",
            @"data",
            @"into",
            @"a",
            @"React",
            @"View",
            @"that",
            @"is",
            @"embedded",
            @"in",
            @"a",
            @"Native",
            @"View",
        ]
    };
}

@end
