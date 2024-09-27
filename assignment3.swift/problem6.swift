func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 {
        return []
    }
    if n == 1 {
        return [1]
    }
    
    var fib: [Int] = [1, 1]
    for i in stride(from: 2, through: n-1, by: 1) {
        fib.append(fib[i-1] + fib[i-2])
    }
    return fib
}

print("Enter n: ")
if let input = readLine(), let n = Int(input) {
    let result = fibonacci(n)
    print("First \(n) numbers of the Fibonacci sequence: \(result)")
} 
else {
    print("Invalid input")
}