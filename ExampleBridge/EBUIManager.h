//
//  EBUIManager.h
//  ExampleBridge
//
//  Created by Alexey Kureev on 19/10/2016.
//  Copyright © 2016 oss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EBUIManager : NSObject

+ (instancetype)sharedInstance;
- (void)addValue:(id)value forKey:(NSString *)key;

@end
