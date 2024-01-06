
class Calculator {
    class DivideByZeroException(message: String) : Exception(message)
    class WrongAction(message: String) : Exception(message)
    fun calc(first: Double, action: ArithmeticAction, second:Double): Double {
        when(action) {
            ArithmeticAction.Plus -> return first + second
            ArithmeticAction.Minus -> return first - second
            ArithmeticAction.Multiply -> return first * second
            ArithmeticAction.Divide -> {
                if(second == 0.0) {
                    throw DivideByZeroException("Calculator: division by zero!")
                } else {
                    return first / second
                }
            }
            else -> {
                throw WrongAction("Calculator: wrong arithmetic action!")
            }
        }
    }
}
