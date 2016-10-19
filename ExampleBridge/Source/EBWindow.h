//
//  EBWindow.h
//  ExampleBridge
//
//  Created by Alexey Kureev on 18/10/2016.
//  Copyright © 2016 oss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface EBWindow : NSObject

@property (nonatomic, copy) NSWindow *window;

-(void)openWithSize:(NSSize)dimensions;

@end
