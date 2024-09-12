var firstName: String = "Margulan"
var lastName: String = "Kalykul"
let currentYear: Int = 2024
var birthYear: Int = 2003
var age: Int = currentYear - birthYear
var isStudent: Bool = true
var height: Double = 1.8
var city: String = "Almaty"

var hobby: String = "watching movies"
var numberOfHobbies: Int = 3
var favoriteNumber: Int = 5
var isHobbyCreative: Bool = false

var lifeStory: String = """
My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). I am currently \(isStudent ? "" : "not") a student. I enjoy \(hobby), which is \(isHobbyCreative ? "" : "not") a creative hobby. I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber). I live in \(city). 
"""
var futureGoals: String = "In the future, I want to create my own company."

lifeStory += futureGoals

print(lifeStory)
