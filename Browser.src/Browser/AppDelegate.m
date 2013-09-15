//
//  AppDelegate.m
//  Browser
//
//  Created by Eugene Burmako on 15.09.13.
//  Copyright (c) 2013 Eugene Burmako. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)getUrl:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{
	NSString *url = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath: @"/usr/local/bin/browser"];
    NSArray *arguments = [NSArray arrayWithObjects: url, nil];
    [task setArguments: arguments];
    [task launch];
}

- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    [[NSAppleEventManager sharedAppleEventManager] setEventHandler:self andSelector:@selector(getUrl:withReplyEvent:) forEventClass:kInternetEventClass andEventID:kAEGetURL];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath: @"/usr/local/bin/browser"];
    [task setArguments: [[NSProcessInfo processInfo] arguments]];
    [task launch];
}

@end
