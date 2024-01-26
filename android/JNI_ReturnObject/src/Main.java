import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello from Java!");

        JavaClass nativeObj = new JavaClass();

        System.out.println("Create complex from Java:");
        Complex a = new Complex(10.1, 22.2);
        System.out.println(a);
        System.out.println();

        System.out.println("Create complex from Native:");
        Complex b = nativeObj.createComplex(5.55, -3.33);
        System.out.println(b);
        System.out.println();

        System.out.println("Create complex[] from Native:");
        Complex[] lst = nativeObj.createListOfComplex(10, 1.1, 2.2);
        for (int i = 0; i < lst.length; ++i) {
            System.out.print(lst[i] + " ");
        }
        System.out.println("\n");

        System.out.println("Generate complex[] from Native (data from c++):");
        lst = nativeObj.generateListOfComplex(7);
        for (int i = 0; i < lst.length; ++i) {
            System.out.print(lst[i] + " ");
        }
        System.out.println("\n");

        System.out.println("Create complex[][] from Native:");
        Complex[][] lst2d = nativeObj.create2DListOfComplex(5, 3, 1.1, -8.0);
        for(int i = 0; i < lst2d.length; ++i) {
            System.out.println(Arrays.toString(lst2d[i]));
        }
        System.out.println();

        System.out.println("Generate complex[][] from Native (data from c++):");
        lst2d = nativeObj.generate2DListOfComplex(5, 3);
        for(int i = 0; i < lst2d.length; ++i) {
            System.out.println(Arrays.toString(lst2d[i]));
        }
        System.out.println();

        System.out.println("Goodbye from Java!");
    }
}
