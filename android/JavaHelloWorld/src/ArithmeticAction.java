
public class ArithmeticAction {
    public enum Type {
        ADD, SUB, MULT, DIV, UNKNOWN
    }

    private final Type action;

    public ArithmeticAction() { this.action = Type.UNKNOWN; }
    public ArithmeticAction(Type action) {
        this.action = action;
    }

    public ArithmeticAction.Type getType() {
        return action;
    }

    public String toString() {
        switch (action) {
            case ADD:
                return "+";
            case SUB:
                return "-";
            case MULT:
                return "*";
            case DIV:
                return "/";
            case UNKNOWN:
                return "UNKNOWN";
            default:
                return "";
        }
    }

    public static class ArithmeticActionParsingException extends Exception {
        public ArithmeticActionParsingException(String message) {
            super(message);
        }
    }

    public static ArithmeticAction fromString(String string) throws ArithmeticActionParsingException {
        switch (string) {
            case "+":
                return new ArithmeticAction(Type.ADD);
            case "-":
                return new ArithmeticAction(Type.SUB);
            case "*":
                return new ArithmeticAction(Type.MULT);
            case "/":
                return new ArithmeticAction(Type.DIV);
            default:
                throw new ArithmeticActionParsingException("string " + string + " is wrong!");
        }
    }
}
