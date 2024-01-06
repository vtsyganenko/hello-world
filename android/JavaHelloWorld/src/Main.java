import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello from Java!");
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        double firstValue = inputValue("Input first value: ", reader);
        ArithmeticAction action = inputAction(reader);
        double secondValue = inputValue("Input second value: ", reader);
        double result = 0.0;
        try {
            result = Calculator.calc(firstValue, action, secondValue);
        }
        catch (Calculator.DivisionByZeroException ex) {
            System.out.println(ex.getMessage());
            return;
        }
        System.out.println("Result: " + firstValue + " " + action + " " + secondValue + " = " + result);
    }

    private static double inputValue(String requestMessage, BufferedReader reader) {
        boolean gotValue = false;
        double resultValue = 0.0;
        while(!gotValue) {
            System.out.print(requestMessage);
            try {
                String input = reader.readLine();
                resultValue = Double.parseDouble(input.trim());
                gotValue = true;
            }
            catch (IOException ex) {
                System.out.println("Unable to read a line!");
                return resultValue;
            }
            catch (NumberFormatException ex) {
                System.out.println("Incorrect value!");
                // continue input cycle
            }
        }
        return resultValue;
    }

    private static ArithmeticAction inputAction(BufferedReader reader) {
        while(true) {
            System.out.print("Input action (+, -, *, /): ");
            try {
                String input = reader.readLine();
                return ArithmeticAction.fromString(input.trim());
            }
            catch (IOException ex) {
                System.out.println("Unable to read a line!");
                return new ArithmeticAction(ArithmeticAction.Type.UNKNOWN);
            }
            catch (ArithmeticAction.ArithmeticActionParsingException ex) {
                System.out.println("Incorrect value!");
                // continue input cycle
            }
        }
    }
}
