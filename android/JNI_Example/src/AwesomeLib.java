public class AwesomeLib {
    static {
        System.loadLibrary("native");
    }

    public native void helloFromCPP();

    public native int getRandomValue();

    public native void printList(int[] array);

    public native void printMatrix(float[][] matrix);

    public native void modifyList(int[] array);

    public native int[] createList(int size, int initialValue);

    public native float[][] create2DList(int size1, int size2, float initialValue);

    // let's try to call Java from CPP
    public native void nativeMethod();
    public void MultiplyAndPrintResult(float value, int coef) {
        System.out.printf("Java: MultiplyAndPrintResult(%f, %d)%n", value, coef);
        System.out.printf("Java: MultiplyAndPrintResult result is %f%n", value * coef);
    }
}
