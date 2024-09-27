print("Input a temperature value: ")

if let input = readLine(), let temp = Double(input) {
    print("Specify the unit of the entered temperature (C, F, or K): ")
    if let unit = readLine()?.uppercased() {
        switch unit {
        case "C":
            let f = temp * 9 / 5 + 32, k = temp + 273.15
            print("\(temp)°C is \(f)°F and \(k)K")
        case "F":
            let c = (temp - 32) * 5 / 9, k = c + 273.15
            print("\(temp)°F is \(c)°C and \(k)K")
        case "K":
            let c = temp - 273.15, f = c * 9 / 5 + 32
            print("\(temp)K is \(c)°C and \(f)°F")
        default:
            print("Invalid unit. Please enter C, F, or K: ")
        }
    }
} 
else {
    print("Invalid temperature input. Please enter a numeric value.")
}