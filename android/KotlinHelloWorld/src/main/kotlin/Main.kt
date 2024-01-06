import java.util.Scanner

fun main(args: Array<String>) {
    val reader = Scanner(System.`in`)
    val first: Double = inputDoubleValue("Enter first value: ", reader)
    val action: ArithmeticAction = inputArithmeticActionValue(reader)
    val second: Double = inputDoubleValue("Enter second value: ", reader)

    val calc = Calculator()
    var result = 0.0
    try {
        result = calc.calc(first, action, second)
    }
    catch (ex: Exception) {
        println(ex.message)
        return
    }
    print("$first ${action.value} $second = ")
    print(result)
}

fun inputDoubleValue(message: String, scanner: Scanner): Double {
    var value: Double? = null
    while(value == null) {
        print(message)
        try {
            value = scanner.next().toDoubleOrNull()
            if(value == null) {
                print("Wrong input! ")
            }
        }
        catch (ex: Exception) {
            System.out.println(ex.message)
        }
    }
    return value ?: 0.0;
}
