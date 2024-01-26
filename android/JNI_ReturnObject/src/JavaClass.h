/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class JavaClass */

#ifndef _Included_JavaClass
#define _Included_JavaClass
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     JavaClass
 * Method:    createComplex
 * Signature: (DD)LComplex;
 */
JNIEXPORT jobject JNICALL Java_JavaClass_createComplex
  (JNIEnv *, jobject, jdouble, jdouble);

/*
 * Class:     JavaClass
 * Method:    createListOfComplex
 * Signature: (IDD)[LComplex;
 */
JNIEXPORT jobjectArray JNICALL Java_JavaClass_createListOfComplex
  (JNIEnv *, jobject, jint, jdouble, jdouble);

/*
 * Class:     JavaClass
 * Method:    generateListOfComplex
 * Signature: (I)[LComplex;
 */
JNIEXPORT jobjectArray JNICALL Java_JavaClass_generateListOfComplex
  (JNIEnv *, jobject, jint);

/*
 * Class:     JavaClass
 * Method:    create2DListOfComplex
 * Signature: (IIDD)[[LComplex;
 */
JNIEXPORT jobjectArray JNICALL Java_JavaClass_create2DListOfComplex
  (JNIEnv *, jobject, jint, jint, jdouble, jdouble);

/*
 * Class:     JavaClass
 * Method:    generate2DListOfComplex
 * Signature: (II)[[LComplex;
 */
JNIEXPORT jobjectArray JNICALL Java_JavaClass_generate2DListOfComplex
  (JNIEnv *, jobject, jint, jint);

#ifdef __cplusplus
}
#endif
#endif
