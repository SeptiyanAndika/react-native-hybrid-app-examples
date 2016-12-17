/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"
#import "MenuViewController.h"
#import "RCTBundleURLProvider.h"

@implementation AppDelegate

@synthesize bridge;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSURL *jsCodeLocation;
    
    /**
     * Loading JavaScript code - uncomment the one you want.
     *
     * OPTION 1
     * Load the standard way.
     */
    
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
    
    /**
     * OPTION 2
     * Load from pre-bundled file on disk. To re-generate the static bundle
     * from the root of your project directory, run
     *
     * $ react-native bundle --minify
     *
     * see http://facebook.github.io/react-native/docs/integration-with-existing-apps.html
     */
    
    //   jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
    
    // Here we are instantiating the `RCTBridge` to be used in other parts of the app later.
    bridge = [[RCTBridge alloc] initWithBundleURL:jsCodeLocation
                                   moduleProvider:nil
                                    launchOptions:launchOptions];
    
     // Instead of creating a `RCTRootView` here and setting it as the `rootViewController`, we are
     // creating a `menuViewController` for Demo purposes.
    MenuViewController *menuViewController = [[MenuViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:menuViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (id)nativeModuleForString:(NSString *)moduleName {

    return [self.bridge moduleForName:moduleName];
}

@end
