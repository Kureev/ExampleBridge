//
//  EBWindow.m
//  ExampleBridge
//
//  Created by Alexey Kureev on 18/10/2016.
//  Copyright © 2016 oss. All rights reserved.
//

#import "EBWindow.h"

@implementation EBWindow

-(void)openWithSize:(NSSize)dimensions {
    NSInteger mask = 0b1111;
    
    _window = [[NSWindow alloc]
               initWithContentRect:NSMakeRect(100, 100, dimensions.width, dimensions.height)
               styleMask:mask
               backing:NSBackingStoreBuffered defer:NO];
    
    [_window makeKeyAndOrderFront:NSApp];
    [NSApp activateIgnoringOtherApps:YES];
}

@end
