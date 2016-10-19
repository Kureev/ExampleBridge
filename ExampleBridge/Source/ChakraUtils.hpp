//
//  ChakraUtils.hpp
//  ExampleBridge
//
//  Created by Alexey Kureev on 18/10/2016.
//  Copyright © 2016 oss. All rights reserved.
//

#ifndef ChakraUtils_hpp
#define ChakraUtils_hpp

#include "ChakraCore.h"
#include <stdio.h>

namespace ChakraUtils {
    int getObjectIntProperty(const JsValueRef &object, const char *name);
    void setObjectProperty(const JsValueRef &object, const char *name, const JsValueRef &value);
    void setObjectFunctionProperty(const JsValueRef &object, const char *name, JsNativeFunction fn);
    const char *toString(JsValueRef ref);
    int toInt(JsValueRef ref);
    
    JsValueRef toObject(JsValueRef ref);
};

#endif /* ChakraUtils_hpp */
