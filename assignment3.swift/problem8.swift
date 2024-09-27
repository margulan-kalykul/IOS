import Foundation

func isPalindrome(_ text: String) -> Bool {
    let allowedCharacters = CharacterSet.alphanumerics
    
    // Filter the string to keep only alpanumeric characters and make it lowercase
    let filteredText = text
        .lowercased()
        .filter { allowedCharacters.contains($0.unicodeScalars.first!) }
    
    /// Check if the filtered text is equal to its reverse
    return filteredText == String(filteredText.reversed())
}

print("Enter string: ")
if let input = readLine() {
    if isPalindrome(input) {
        print("The string is a palindrome.")
    } else {
        print("The string is not a palindrome.")
    }
}
