import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello from Java!");

        AwesomeLib nativeLib = new AwesomeLib();
        nativeLib.helloFromCPP();
        System.out.println();

        int value = nativeLib.getRandomValue();
        System.out.printf("Random value from native lib is %d%n", value);
        System.out.println();

        int[] intArray = new int[]{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
        nativeLib.printList(intArray);
        System.out.println();

        float[][] floatArray = new float[][]{ {1.0f, 2.0f, 3.0f}, {10.5f, 11.5f, 12.5f}, {0.1f, 0.2f, 0.3f} };
        nativeLib.printMatrix(floatArray);
        System.out.println();

        System.out.println("Array before:");
        System.out.println(Arrays.toString(intArray));
        nativeLib.modifyList(intArray);
        System.out.println("Array after:");
        System.out.println(Arrays.toString(intArray));
        System.out.println();

        System.out.printf("Generated array of value %d with size %d%n", 5, 20);
        int[] generatedArray = nativeLib.createList(20, 5);
        System.out.println(Arrays.toString(generatedArray));
        System.out.println();

        System.out.println("Call AwesomeLib.nativeMethod()");
        nativeLib.nativeMethod();
    }
}
