#include <jni.h>
#include <string>

#include "plus.h"
#include "minus.h"

extern "C" JNIEXPORT jstring JNICALL
Java_com_example_usingnativelibsexample_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {
    std::string hello = "Hello from C++";
    return env->NewStringUTF(hello.c_str());
}
extern "C"
JNIEXPORT jint JNICALL
Java_com_example_usingnativelibsexample_MainActivity_plusAction(JNIEnv *env, jobject thiz,
                                                                jint value1, jint value2) {
    return addTwoValues(value1, value2);
}
extern "C"
JNIEXPORT jint JNICALL
Java_com_example_usingnativelibsexample_MainActivity_minusAction(JNIEnv *env, jobject thiz,
                                                                 jint value1, jint value2) {
    return subTwoValues(value1, value2);
}
