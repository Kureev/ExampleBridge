//
//  EBUIManager.m
//  ExampleBridge
//
//  Created by Alexey Kureev on 19/10/2016.
//  Copyright © 2016 oss. All rights reserved.
//

#import "EBUIManager.h"

@implementation EBUIManager

NSMutableDictionary *registry;

+ (instancetype)sharedInstance {
    static EBUIManager *sharedInstance = nil;
    @synchronized (self) {
        if (!sharedInstance) {
            sharedInstance = [[self alloc] init];
            registry = [NSMutableDictionary new];
        }
    }
    return sharedInstance;
}

- (void)addValue:(id)value forKey:(NSString *)key {
    [registry setValue:value forKey:key];
}

@end
