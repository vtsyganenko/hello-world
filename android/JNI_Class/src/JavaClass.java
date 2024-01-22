public class JavaClass implements AutoCloseable {
    static {
        System.loadLibrary("JavaClassLibrary");
    }
    private long nativeHandle;
    private native long createNative();
    private native long createNative(int x, int y);
    private native void destroyNative(long ptr);

    public JavaClass() {
        System.out.println("JavaClass()");
        nativeHandle = createNative();
    }
    public JavaClass(int x, int y) {
        System.out.println("JavaClass(" + x + ", " + y + ")");
        nativeHandle = createNative(x, y);
    }
    public void close() {
        System.out.println("JavaClass close()");
        destroyNative(nativeHandle);
    }

    public native void setX(int x);
    public native void setY(int y);
    public native int sum();
}
