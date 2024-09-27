import Foundation

var students: [String: Double] = [:]

// Accept input for student names and scores
while true {
    print("Enter student name or type 'exit' to finish: ")
    guard let name = readLine(), name.lowercased() != "exit" else {
        break
    }
    
    print("Enter score for \(name):")
    if let scoreInput = readLine(), let score = Double(scoreInput) {
        students[name] = score
    } 
    else {
        print("Invalid input")
    }
}

// Calculate average, highest, and lowest scores
var totalScores = 0.0
for (_, val) in students {
    totalScores += val
}
let averageScore = totalScores / Double(students.count)
let highestScore = students.values.max() ?? 0
let lowestScore = students.values.min() ?? 0

// Display results
print("Student scores: ")
for (name, score) in students {
    let comparison = score >= averageScore ? "above" : "below"
    print("\(name): \(score) is \(comparison) average")
}

print("\nAverage Score: \(averageScore)")
print("Highest Score: \(highestScore)")
print("Lowest Score: \(lowestScore)\n")
