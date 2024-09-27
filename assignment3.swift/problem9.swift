while true {
    print("Enter the first number:")
    guard let input1 = readLine(), let num1 = Double(input1) else {
        print("Invalid input. Please enter a numeric value.")
        continue
    }

    print("Enter the second number:")
    guard let input2 = readLine(), let num2 = Double(input2) else {
        print("Invalid input. Please enter a numeric value.")
        continue
    }

    print("Choose an operation (+, -, *, /) or type 'exit' to quit:")
    guard let operation = readLine() else { continue }

    switch operation {
    case "+":
        let result = num1 + num2
        print("Result: \(num1) + \(num2) = \(result)")
    case "-":
        let result = num1 - num2
        print("Result: \(num1) - \(num2) = \(result)")
    case "*":
        let result = num1 * num2
        print("Result: \(num1) * \(num2) = \(result)")
    case "/":
        if let result = num2 != 0 ? num1 / num2 : nil {
            print("Result: \(num1) / \(num2) = \(result)")
        } else {
            print("Error: Division by zero is not allowed")
        }
    case "exit":
        print("Exiting")
        break
    default:
        print("Invalid operation")
    }
}
