//
//  CPAppDelegate.m
//  ColorPaste
//
//  Created by leafduo on 11/22/12.
//  Copyright (c) 2012 leafduo.com. All rights reserved.
//

#import "CPAppDelegate.h"
#import "NSString+Hex2UIColor.h"
#import "NSString+PasteBoard.h"

@implementation CPAppDelegate {
    NSStatusItem *_statusItem;
    NSTimer *_timer;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{    
    [self activateStatusMenu];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(convertDataInPasterBoard:) userInfo:nil repeats:YES];
}

- (void)convertDataInPasterBoard:(NSTimer *)timer {
    NSString *hexString = [NSString stringFromPasteBoard];
    NSString *uiColorString = [NSString stringOfUIColorFromHexString:hexString];
    if (uiColorString) {
        [[NSPasteboard generalPasteboard] clearContents];
        [[NSPasteboard generalPasteboard] writeObjects:@[uiColorString]];
        NSUserNotification *notification = [[NSUserNotification alloc] init];
        notification.title = @"Color Coverted";
        notification.informativeText = uiColorString;
        notification.soundName = NSUserNotificationDefaultSoundName;
        [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];
    }
}

- (void)activateStatusMenu {
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    NSMenu *menu = [[NSMenu alloc] init];
    [menu addItemWithTitle:@"Quit" action:@selector(quit:) keyEquivalent:@""];
    
    [_statusItem setTitle: NSLocalizedString(@"UIcolor",@"")];
    [_statusItem setHighlightMode:YES];
    [_statusItem setMenu:menu];
}

- (IBAction)quit:(id)sender {
    [NSApp terminate:self];
}

@end
