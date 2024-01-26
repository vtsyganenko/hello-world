public class Complex {
    public double real;
    public double imag;
    public Complex(double realVal, double imagVal) {
        System.out.println("Complex::Complex(" + realVal + ", " + imagVal + ")");
        real = realVal;
        imag = imagVal;
    }

    public String toString() {
        if(imag < 0) {
            return String.valueOf(real) + String.valueOf(imag) + "i";
        } else {
            return String.valueOf(real) + "+" + String.valueOf(imag) + "i";
        }
    }
}
