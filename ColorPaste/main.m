//
//  main.m
//  ColorPaste
//
//  Created by leafduo on 11/22/12.
//  Copyright (c) 2012 leafduo.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CPAppDelegate.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSApplication * application = [NSApplication sharedApplication];
        
        CPAppDelegate * appDelegate = [[CPAppDelegate alloc] init];
        
        [application setDelegate:appDelegate];
        [application run];
    }
    return EXIT_SUCCESS;
}
