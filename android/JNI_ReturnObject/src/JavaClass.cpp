#include "JavaClass.h"

#include <iostream>

JNIEXPORT jobject JNICALL Java_JavaClass_createComplex(JNIEnv *env, jobject, jdouble real, jdouble imag) {
    std::cout << "C++ JavaClass::createComplex(real=" << real << " imag=" << imag << ")" << std::endl;
    jclass ComplexClass = env->FindClass("Complex");
    jmethodID methodId = env->GetMethodID(ComplexClass, "<init>", "(DD)V");
    jobject complexObj = env->NewObject(ComplexClass, methodId, real, imag);
    return complexObj;
}

JNIEXPORT jobjectArray JNICALL Java_JavaClass_createListOfComplex(JNIEnv *env, jobject, jint size, jdouble real, jdouble imag) {
    jclass ComplexClass = env->FindClass("Complex");
    jmethodID ctor = env->GetMethodID(ComplexClass, "<init>", "(DD)V");
    // create array with objects
    jobjectArray result = env->NewObjectArray(size, ComplexClass, env->NewObject(ComplexClass, ctor, real, imag));
    return result;
}

JNIEXPORT jobjectArray JNICALL Java_JavaClass_generateListOfComplex(JNIEnv *env, jobject, jint size) {
    jclass ComplexClass = env->FindClass("Complex");
    jmethodID ctor = env->GetMethodID(ComplexClass, "<init>", "(DD)V");
    // create empty array
    jobjectArray result = env->NewObjectArray(size, ComplexClass, NULL);
    double real = 1.1;
    double imag = -10.1;
    for(int i=0; i<size; ++i) {
        jobject obj = env->NewObject(ComplexClass, ctor, real, imag);
        env->SetObjectArrayElement(result, i, obj);

        real += 0.1;
        imag += 0.1;
    }
    return result;
}

// we can create 2d array this way:
// create array with default value -> array with default value -> Complex object
//    jobjectArray array = env->NewObjectArray(size1, ComplexClass,
//            env->NewObjectArray(size2, ComplexClass, env->NewObject(ComplexClass, ctor, real, imag)));
// But in this situation we create array with a references to one object !!!

JNIEXPORT jobjectArray JNICALL Java_JavaClass_create2DListOfComplex(JNIEnv *env, jobject,
    jint size1, jint size2, jdouble real, jdouble imag) {

    // lambda for creation lines of 2d array
    auto createArray = [](JNIEnv* env, jclass objectType, jmethodID objectConstructor,
                            int length, double real, double imag) -> jobjectArray
    {
        jobjectArray array = env->NewObjectArray(length, objectType, NULL);
        for(int i=0; i<length; ++i) {
            jobject obj = env->NewObject(objectType, objectConstructor, real, imag);
            env->SetObjectArrayElement(array, i, obj);
        }
        return array;
    };

    jclass ComplexClass = env->FindClass("Complex");
    jmethodID ctor = env->GetMethodID(ComplexClass, "<init>", "(DD)V");

    // create first line separately to retrieve type Complex[] for outer array creation
    jobjectArray inner0 = createArray(env, ComplexClass, ctor, size2, real, imag);

    jobjectArray outer = env->NewObjectArray(size1, env->GetObjectClass(inner0), 0);
    env->SetObjectArrayElement(outer, 0, inner0);
    env->DeleteLocalRef(inner0);

    // create other lines
    for(int i=1; i<size1; ++i) {
        jobjectArray inner = createArray(env, ComplexClass, ctor, size2, real, imag);
        env->SetObjectArrayElement(outer, i, inner);
        env->DeleteLocalRef(inner);
    }

    return outer;
}

JNIEXPORT jobjectArray JNICALL Java_JavaClass_generate2DListOfComplex(JNIEnv *env, jobject, jint size1, jint size2) {
    // values came from C++ layer
    double realValues[size1][size2];
    double real = 1.0;
    double imagValues[size1][size2];
    double imag = 8.0;
    for(int i=0; i<size1; ++i) {
        for(int j=0; j<size2; ++j) {
            realValues[i][j] = real;
            real += 0.1;
            imagValues[i][j] = imag;
            imag += 0.1;
        }
    }

    // lambda for creation lines of 2d array
    auto createArray = [](JNIEnv* env, jclass objectType, jmethodID objectConstructor,
                            int length, double* realArray, double* imagArray) -> jobjectArray
    {
        jobjectArray array = env->NewObjectArray(length, objectType, NULL);
        for(int i=0; i<length; ++i) {
            jobject obj = env->NewObject(objectType, objectConstructor, realArray[i], imagArray[i]);
            env->SetObjectArrayElement(array, i, obj);
        }
        return array;
    };

    jclass ComplexClass = env->FindClass("Complex");
    jmethodID ctor = env->GetMethodID(ComplexClass, "<init>", "(DD)V");

    // create first line separately to retrieve type Complex[] for outer array creation
    jobjectArray inner0 = createArray(env, ComplexClass, ctor, size2, realValues[0], imagValues[0]);

    jobjectArray outer = env->NewObjectArray(size1, env->GetObjectClass(inner0), 0);
    env->SetObjectArrayElement(outer, 0, inner0);
    env->DeleteLocalRef(inner0);

    // create other lines
    for(int i=1; i<size1; ++i) {
        jobjectArray inner = createArray(env, ComplexClass, ctor, size2, realValues[i], imagValues[i]);
        env->SetObjectArrayElement(outer, i, inner);
        env->DeleteLocalRef(inner);
    }

    return outer;
}
