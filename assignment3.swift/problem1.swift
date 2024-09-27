// for-in loop for iterating
for num in 1...100 {
    // Condition for both 3 and 5
    if num % 3 == 0 && num % 5 == 0 {
        print("FizzBuzz")
    }
    // Condition when multiple of 3
    else if num % 3 == 0 {
        print("Fizz")
    }
    // Condition when multiple of 5
    else if num % 5 == 0 {
        print("Buzz")
    }
    // Rest of the numbers
    else {
        print(num)
    }
}