public class Main {
    public static void main(String[] args) {
        System.out.println("Hello from Java!");

        AwesomeLib nativeLib = new AwesomeLib();
        nativeLib.helloFromCPP();
    }
}
