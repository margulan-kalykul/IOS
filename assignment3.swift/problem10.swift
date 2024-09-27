func hasUniqueCharacters(_ text: String) -> Bool {
    var characterSet: Set<Character> = []

    // Iterate through each character in the string
    for char in text {
        // If the character is already in the set, return false
        if characterSet.contains(char) {
            return false
        }
        // Otherwise add the character
        characterSet.insert(char)
    }

    // If no duplicates were found, return true
    return true
}

print("Enter string: ")
if let input = readLine() {
    if hasUniqueCharacters(input) {
        print("All characters are unique")
    } 
    else {
        print("Not all characters are unique")
    }
}
