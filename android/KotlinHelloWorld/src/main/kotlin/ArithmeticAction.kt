import java.util.*

enum class ArithmeticAction(val value: String) {
    Plus("+"),
    Minus("-"),
    Multiply("*"),
    Divide("/"),
    Unknown("?");
    companion object {
        public fun fromValue(value: String): ArithmeticAction = when (value) {
            "+" -> Plus
            "-" -> Minus
            "*" -> Multiply
            "/" -> Divide
            else -> throw IllegalArgumentException()
        }
    }
}

fun inputArithmeticActionValue(scanner: Scanner): ArithmeticAction {
    while(true) {
        print("Enter action (+,-,*,/): ")
        try {
            return ArithmeticAction.fromValue(scanner.next())
        } catch (ex: Exception) {
            print("Wrong input! ")
        }
    }
}
