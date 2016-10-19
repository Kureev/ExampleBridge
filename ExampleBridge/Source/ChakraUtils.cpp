//
//  ChakraUtils.cpp
//  ExampleBridge
//
//  Created by Alexey Kureev on 18/10/2016.
//  Copyright © 2016 oss. All rights reserved.
//

#include "ChakraUtils.hpp"
//
//  ChakraUtils.cpp
//  GoldenGate
//
//  Created by Alexey Kureev on 19/09/16.
//  Copyright © 2016 oss. All rights reserved.
//

#include "ChakraUtils.hpp"

namespace ChakraUtils {
    int getObjectIntProperty(const JsValueRef &object, const char *name) {
        JsPropertyIdRef valueIR;
        JsGetPropertyIdFromNameUtf8(name, &valueIR);
        JsValueRef valueVR;
        int value;
        JsGetProperty(object, valueIR, &valueVR);
        JsNumberToInt(valueVR, &value);
        return value;
    }
    
    const char *toString(JsValueRef ref) {
        JsValueRef msg;
        JsConvertValueToString(ref, &msg);
        char *msg_str;
        size_t length;
        JsStringToPointerUtf8Copy(msg, &msg_str, &length);
        return msg_str;
    }
    
    int toInt(JsValueRef ref) {
        JsValueRef vref;
        JsConvertValueToString(ref, &vref);
        int value;
        JsNumberToInt(vref, &value);
        return value;
    }
    
    JsValueRef toObject(JsValueRef ref) {
        JsValueRef vref;
        JsConvertValueToObject(ref, &vref);
        return vref;
    }
    
    void setObjectProperty(const JsValueRef &object, const char *name, const JsValueRef &value) {
        JsPropertyIdRef propertyId;
        JsGetPropertyIdFromNameUtf8(name, &propertyId);
        JsSetProperty(object, propertyId, value, true);
    }
    
    void setObjectFunctionProperty(const JsValueRef &object, const char *name, JsNativeFunction fn) {
        JsValueRef vref;
        JsCreateFunction(fn, nullptr, &vref);
        
        JsPropertyIdRef propertyId;
        JsGetPropertyIdFromNameUtf8(name, &propertyId);
        JsSetProperty(object, propertyId, vref, true);
    }
}
