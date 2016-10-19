//
//  ChakraProxy.m
//  ExampleBridge
//
//  Created by Alexey Kureev on 28/09/2016.
//  Copyright © 2016 oss. All rights reserved.
//

#import "ChakraProxy.h"
#import "ChakraCore.h"
#import "iostream"
#import "EBWindow.h"
#import "AppDelegate.h"
#import "ChakraUtils.hpp"

@implementation ChakraProxy

-(void)run {
    NSLog(@"Hello from the JSVM thread!");
}

@end
