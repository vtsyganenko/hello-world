Example of using C++ libraries from NDK (Android Studio).
We build libplus.so and libminus.a within the project. 
After that, these libraries are linked to JNI library (libnativelibrary.so from native-lib.cpp).
Java code calls JNI methods, they call methods from C++ libraries.
