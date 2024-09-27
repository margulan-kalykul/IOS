func isPrime(_ number: Int) -> Bool {
    // Special case 1
    if number == 1 {
        return false
    }

    // Check all possible divisors of the number, exept 1 and number
    for i in stride(from: 2, through: number-1, by: 1) {
        if number % i == 0 {
            return false
        }
    }
    return true
}

for i in 1...100 {
    if isPrime(i) {
        print(i, terminator: " ")
    }
}