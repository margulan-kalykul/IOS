// Easy Tasks
// 1
var fruits: [String] = ["apple", "banana", "pineapple", "peach", "melon"]
print(fruits[2])
// 2
var favNums: Set<Int> = [7, 9, 13, 1999]
favNums.insert(64)
print(favNums)
// 3
var langRelease: [String: Int] = ["C++": 1985, "Python": 1994, "Java": 1996, "Swift": 2014]
print(langRelease["Swift"]!)
// 4
var colors: [String] = ["red", "green", "blue", "yellow"]
colors[1] = "cyan"
print(colors)

// Medium Tasks
// 1
var set1: Set<Int> = [1, 2, 3, 4], set2: Set<Int> = [3, 4, 5, 6]
print(set1.intersection(set2))
// 2
var studentScores: [String: Int] = ["Almas": 78, "Zhandos": 92, "Bekzat": 84]
studentScores["Zhandos"] = 89
print(studentScores)
// 3
var arr1: [String] = ["apple", "banana"], arr2: [String] = ["cherry", 
"date"]
arr1 += arr2
print(arr1)

// Hard Tasks
// 1
var countryPop: [String: Int] = ["UK": 66970000, "US": 333330000, "France": 67970000]
countryPop["Brazil"] = 215300000
print(countryPop)
// 2
var pets1: Set<String> = ["cat", "dog"], pets2: Set<String> = ["dog", "mouse"]
pets1 = pets1.union(pets2)
pets1 = pets1.subtracting(pets2)
print(pets1)
// 3
var studentGrades: Dictionary<String, Array<Int>> = ["Abai": [66, 78, 34], "Aigul": [44, 67, 19], "Sultan": [78, 99, 55]]
print(studentGrades["Sultan"]![1])