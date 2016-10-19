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

static JsRuntimeHandle runtime;
static JsContextRef context;

JsValueRef render(JsValueRef callee, bool isConstructCall, JsValueRef *arguments, unsigned short argumentCount, void *callbackState) {
    NSString *type = [NSString stringWithUTF8String:ChakraUtils::toString(arguments[1])];
    double w {ChakraUtils::toDouble(arguments[2])};
    double h {ChakraUtils::toDouble(arguments[3])};
    
    dispatch_async(dispatch_get_main_queue(), ^{
        id delegate = [[NSApplication sharedApplication] delegate];
        
        [delegate renderElementOfType:type size:NSMakeSize((CGFloat)w, (CGFloat)h)];
    });
    
    return JS_INVALID_REFERENCE;
}

JsErrorCode SetupGlobalEnvironment() {
    JsValueRef globalObject;
    JsGetGlobalObject(&globalObject);
    
    JsValueRef bridgeObject;
    JsCreateObject(&bridgeObject);
    
    ChakraUtils::setObjectProperty(globalObject, "bridge", bridgeObject);
    ChakraUtils::setObjectFunctionProperty(bridgeObject, "render", render);
    
    return JsNoError;
}

@implementation ChakraProxy

-(void)run {
    unsigned currentSourceContext = 0;
    
    // Read file from the bundle
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"js"];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];
    
    if (error)
        NSLog(@"Error reading file: %@", error.localizedDescription);
    
    // Your script; try replace hello-world with something else
    const char *script = [fileContents cStringUsingEncoding:NSASCIIStringEncoding];
    
    // Create a runtime
    JsCreateRuntime(JsRuntimeAttributeNone, nullptr, &runtime);
    
    // Create a context
    JsCreateContext(runtime, &context);
    JsSetCurrentContext(context);
    
    // Add global environment to runtime and patch it by "bridge" hosted object
    SetupGlobalEnvironment();
    
    // Run the script.
    JsErrorCode code = JsRunScriptUtf8(script, currentSourceContext++, "", nullptr);
}

@end
