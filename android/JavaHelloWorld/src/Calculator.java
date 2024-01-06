
public class Calculator {
    public static class DivisionByZeroException extends Exception {
        public DivisionByZeroException(String message) {
            super(message);
        }
    }

    public static double calc(double firstVal, ArithmeticAction action, double secondVal) throws DivisionByZeroException {
        switch (action.getType()) {
            case ADD:
                return firstVal + secondVal;
            case SUB:
                return firstVal - secondVal;
            case MULT:
                return firstVal * secondVal;
            case DIV:
                if(secondVal == 0) {
                    throw new DivisionByZeroException("Calculator: division by zero!");
                } else {
                    return firstVal / secondVal;
                }
            default:
                return 0;
        }
    }
}
