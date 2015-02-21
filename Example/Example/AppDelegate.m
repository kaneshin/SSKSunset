//
//  AppDelegate.m
//  Example
//
//  Created by Shintaro Kaneko on 2/21/15.
//  Copyright (c) 2015 Shintaro Kaneko. All rights reserved.
//

#import "AppDelegate.h"

#import <WebKit/WebKit.h>

#import <SSKSunset/SSKSunset.h>

#define D(...) #__VA_ARGS__ "\n";

@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet WebView *webView;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSString *markdownText = @"# Example\n\n## List\n\n- [GitHub](https://github.com)\n- 2\n\n| aaa | bbbb |\n|-----|------|\n|hello|sailor|\n\nThis is normal text\n\n```\nLink to [Google][1]\n\n[1]: http://google.com\n```";
    SSKSunsetParser *parser = [[SSKSunsetParser alloc] initWithText:markdownText];
    parser.extensions = SSKSunsetMarkdown_TABLES | SSKSunsetMarkdown_FENCED_CODE;
    [self.webView.mainFrame loadHTMLString:parser.toHTML baseURL:nil];
}

@end
