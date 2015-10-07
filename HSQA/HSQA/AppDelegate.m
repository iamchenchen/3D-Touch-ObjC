//
//  AppDelegate.m
//  HSQA
//
//  Created by Chenchen Zheng on 10/7/15.
//  Copyright © 2015 Chenchen Zheng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate {
    UIApplicationShortcutItem *launchedShortcutItem;
}

- (BOOL) handleShortCutItem:(UIApplicationShortcutItem *)shortcutItem {
    BOOL handled = false;
    
    NSString *shortCutType = shortcutItem.type;
    if (shortCutType != nil && shortCutType.length != 0) {
        if ([shortCutType isEqualToString:@"com.iamchenchen.HSQA.openfavorites"]) {
            handled = true;
        } else if ([shortCutType isEqualToString:@"com.iamchenchen.HSQA.newmessage"]) {
            handled = true;
        }
    } else {
        return false;
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ShortCut Handled" message:shortcutItem.localizedTitle preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    
    return handled;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    BOOL shouldPerformAdditionalDelegateHandling = true;
    UIApplicationShortcutItem *shortcutItem = [launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey];
    
    if (shortcutItem != nil) {
        //use samething!
        
        launchedShortcutItem = shortcutItem;
        
        shouldPerformAdditionalDelegateHandling = false;
        
    }
    
    return shouldPerformAdditionalDelegateHandling;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    if (launchedShortcutItem == nil) {
        return;
    }
    
    [self handleShortCutItem:launchedShortcutItem];
    
    launchedShortcutItem = nil;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    BOOL handleShortCutItem = [self handleShortCutItem:shortcutItem];
    
    completionHandler(handleShortCutItem);
    
}

@end
