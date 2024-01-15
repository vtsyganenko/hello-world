#include "AwesomeLib.h"

#include <iostream>

JNIEXPORT void JNICALL Java_AwesomeLib_helloFromCPP
  (JNIEnv *, jobject) {
    std::cout << "Hello from C++!" << std::endl;
    std::cout << "More info from C++" << std::endl;
}
