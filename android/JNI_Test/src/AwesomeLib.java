public class AwesomeLib {
    static {
        System.loadLibrary("native");
    }

    public native void helloFromCPP();
}
