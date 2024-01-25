#include "AwesomeLib.h"

#include <iostream>
#include <ctime>

JNIEXPORT void JNICALL Java_AwesomeLib_helloFromCPP(JNIEnv *, jobject) {
    std::cout << "Hello from C++!" << std::endl;
}

JNIEXPORT jint JNICALL Java_AwesomeLib_getRandomValue(JNIEnv *, jobject) {
    std::srand(std::time(nullptr));
    int randomValue = std::rand();
    return randomValue;
}

JNIEXPORT void JNICALL Java_AwesomeLib_printList(JNIEnv *env, jobject, jintArray array) {
    int length = env->GetArrayLength(array);
    std::cout << "C++ printList() got array with length " << length << std::endl;

    jint* elements = env->GetIntArrayElements(array, 0);
    for(int i=0; i<length; ++i) {
        std::cout << elements[i] << " ";
    }
    std::cout << std::endl;

    // since we used GetIntArrayElements
    env->ReleaseIntArrayElements(array, elements, 0);
}

JNIEXPORT void JNICALL Java_AwesomeLib_printMatrix(JNIEnv *env, jobject, jobjectArray matrix) {
    std::cout << "C++ printMatrix()" << std::endl;
    int outLength = env->GetArrayLength(matrix);

    for(int i=0; i<outLength; ++i) {
        jfloatArray inArray = (jfloatArray) env->GetObjectArrayElement(matrix, i);

        int inLength = env->GetArrayLength(inArray);
        jfloat* elements = env->GetFloatArrayElements(inArray, 0);

        for(int j=0; j<inLength; ++j) {
            std::cout << elements[j] << " ";
        }
        std::cout << std::endl;

        // since we used GetFloatArrayElements
        env->ReleaseFloatArrayElements(inArray, elements, 0);
        // since we used GetObjectArrayElement
        env->DeleteLocalRef(inArray);
    }
}

JNIEXPORT void JNICALL Java_AwesomeLib_modifyList(JNIEnv *env, jobject, jintArray array) {
    int length = env->GetArrayLength(array);

    jint* elements = env->GetIntArrayElements(array, 0);
    for(int i=0; i<length; ++i) {
        elements[i] = elements[i] * 2;
    }

    env->ReleaseIntArrayElements(array, elements, 0);
}

JNIEXPORT jintArray JNICALL Java_AwesomeLib_createList(JNIEnv *env, jobject, jint size, jint initialValue) {
    jintArray result;
    result = env->NewIntArray(size);
    if(result == NULL) return NULL;
    std::cout << "C++: created int array with size " << size << std::endl;

    jint fill[size];
    for(int i=0; i<size; ++i) {
        fill[i] = initialValue;
    }

    env->SetIntArrayRegion(result, 0, size, fill);
    return result;
}

JNIEXPORT jobjectArray JNICALL Java_AwesomeLib_create2DList(JNIEnv *env, jobject, jint size1, jint size2, jfloat initialValue) {
    jclass FloatArrayClass = env->FindClass("[F");
    if(FloatArrayClass == NULL) return NULL;

    jobjectArray outer = env->NewObjectArray(size1, FloatArrayClass, NULL);
    if(outer == NULL) return NULL;

    for(int i=0; i<size1; ++i) {
        jfloat tmp[size2];
        for(int index=0; index<size2; ++index) tmp[index] = initialValue;

        jfloatArray inner = env->NewFloatArray(size2);
        if(inner == NULL) return NULL;
        env->SetFloatArrayRegion(inner, 0, size2, tmp);

        env->SetObjectArrayElement(outer, i, inner);
        env->DeleteLocalRef(inner);
    }
    return outer;
}

JNIEXPORT void JNICALL Java_AwesomeLib_nativeMethod(JNIEnv *env, jobject thisObject) {
    std::cout << "C++ nativeMethod() is called" << std::endl;

    jclass cls_awesome_lib = env->GetObjectClass(thisObject);
    jmethodID mult_and_print = env->GetMethodID(cls_awesome_lib, "MultiplyAndPrintResult", "(FI)V");

    // call method
    env->CallVoidMethod(thisObject, mult_and_print, 2.0, 3);
}
