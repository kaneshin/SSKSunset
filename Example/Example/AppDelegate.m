//
//  AppDelegate.m
//  Example
//
//  Created by Shintaro Kaneko on 2/21/15.
//  Copyright (c) 2015 Shintaro Kaneko. All rights reserved.
//

#import "AppDelegate.h"

#import <SSKSunset/SSKSunset.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSString *text = @"# Example\n\n-a";
    SSKSunsetParser *parser = [[SSKSunsetParser alloc] initWithText:text];
    NSLog(@"%@", parser.toHTML);
}

@end
