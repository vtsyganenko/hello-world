public class JavaClass {
    static {
        System.loadLibrary("JavaClassLibrary");
    }

    public native Complex createComplex(double real, double imag);
    // create list with provided values
    public native Complex[] createListOfComplex(int size, double real, double imag);
    // values come from C++ layer
    public native Complex[] generateListOfComplex(int size);
    // create list with provided values
    public native Complex[][] create2DListOfComplex(int size1, int size2, double real, double imag);
    // values come from C++ layer
    public native Complex[][] generate2DListOfComplex(int size1, int size2);
}
