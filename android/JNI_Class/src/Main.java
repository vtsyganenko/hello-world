public class Main {
    public static void main(String[] args) {
        System.out.println("Hello from Java!");

        // need for calling JavaClass::close()
        try (JavaClass nativeObject = new JavaClass()) {
            System.out.println("sum after creation: " + nativeObject.sum());
            nativeObject.setX(10);
            nativeObject.setY(12);
            System.out.println("sum after x=10 and y=12: " + nativeObject.sum());
        }
        System.out.println();

        try (JavaClass nativeObject = new JavaClass(100, 200)) {
            System.out.println("sum after creation: " + nativeObject.sum());
        }

        System.out.println("Goodbye from Java!");
    }
}
