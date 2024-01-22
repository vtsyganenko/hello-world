#include "JavaClass.h"

#include "Handle.h" // getHandle<T>(...)
#include "./cpp/CppClass.h"

#include <iostream>

JNIEXPORT jlong JNICALL Java_JavaClass_createNative__(JNIEnv *, jobject) {
    std::cout << "C++ JavaClass::createNative()" << std::endl;
    return reinterpret_cast<jlong>(new CppClass());
}

JNIEXPORT jlong JNICALL Java_JavaClass_createNative__II(JNIEnv *, jobject, jint x, jint y) {
    std::cout << "C++ JavaClass::createNative(" << x << ", " << y << ")" << std::endl;
    return reinterpret_cast<jlong>(new CppClass(x, y));
}

JNIEXPORT void JNICALL Java_JavaClass_destroyNative(JNIEnv *, jobject, jlong ptr) {
    std::cout << "C++ JavaClass::destroyNative()" << std::endl;
    CppClass* obj = reinterpret_cast<CppClass*>(ptr);
    if(obj) {
        delete obj;
    }
}

JNIEXPORT void JNICALL Java_JavaClass_setX(JNIEnv *env, jobject obj, jint x) {
    std::cout << "C++ JavaClass::setX( " << x << " )" << std::endl;
    CppClass* handle = getHandle<CppClass>(env, obj);
    if(handle) { handle->setX(x); }
}

JNIEXPORT void JNICALL Java_JavaClass_setY(JNIEnv *env, jobject obj, jint y) {
    std::cout << "C++ JavaClass::setY( " << y << " )" << std::endl;
    CppClass* handle = getHandle<CppClass>(env, obj);
    if(handle) { handle->setY(y); }
}

JNIEXPORT jint JNICALL Java_JavaClass_sum(JNIEnv *env, jobject obj) {
    std::cout << "C++ JavaClass::sum()" << std::endl;
    CppClass* handle = getHandle<CppClass>(env, obj);
    if(handle) {
        return handle->sum();
    }
    return 0;
}
