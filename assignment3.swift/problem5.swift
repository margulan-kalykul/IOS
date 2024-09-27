import Foundation

// Function to count word frequencies
func count(_ sentence: String) -> [String: Int] {
    var wordFrequencies: [String: Int] = [:]
    
    // Split the sentence into words
    let words = sentence.lowercased().components(separatedBy: " ")
    
    // Iterate through words and remove punctuation
    for word in words {
        let newWord = word.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: ";", with: "").replacingOccurrences(of: ":", with: "").replacingOccurrences(of: "?", with: "").replacingOccurrences(of: "!", with: "")
        wordFrequencies[newWord, default: 0] += 1
    }
    
    return wordFrequencies
}

// Main program
print("Enter a sentence: ")
if let sentence = readLine() {
    let frequencies = count(sentence)
    
    // Display the word frequencies
    print("Word Frequencies: ")
    for (word, count) in frequencies {
        print("\(word): \(count)")
    }
} 
else {
    print("Invalid input")
}
