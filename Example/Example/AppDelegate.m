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
    NSString *text = @"# Example\n\n| aaa | bbbb |\n|-----|------|\n|hello|sailor|\n\naaThis is normal text\n\n```\nLink to [Google][1]\n\n[1]: http://google.com\n```";
    SSKSunsetParser *parser = [[SSKSunsetParser alloc] initWithText:text];
    parser.extensions = MKDEXT_TABLES|MKDEXT_FENCED_CODE;
    NSLog(@"%@", parser.toHTML);
}

@end
