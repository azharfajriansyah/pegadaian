import UIKit

//===========================
// Basic Data Types
//===========================

//***************************
// Int
//***************************
// Used for integer values (whole numbers).
// It supports both positive and negative values, as well as zero.
let year: Int = 2024


//***************************
// Double
//***************************
// Used for floating-point numbers (numbers with decimal points).
// It offers double-precision, meaning it can store more significant digits.
let temperature: Double = 36.5


//***************************
// String
//***************************
// Represents text or characters.
// Strings are enclosed within double quotes " ".
let greeting: String = "Hello, World!"

// String Interpolation: Combine variables or constants into a string using \(expression).
let name = "Alice"
let message = "Hello, \(name)!" // Output: "Hello, Alice!"


//***************************
// Bool
//***************************
// Represents Boolean values, either true or false.
let isLoggedIn: Bool = true





//===========================
// Collection Data Types
//===========================

//***************************
// Array
//***************************
// An ordered collection of values, where each value has the same type.
// You can create arrays using square brackets [ ].
var numbers: [Int] = [1, 2, 3, 4, 5]
numbers.append(6) // Adding a new element to the array

// Accessing Elements:
// You can access elements using an index, starting from 0.
let firstNumber = numbers[0] // Output: 1


//***************************
// Dictionary
//***************************
// A collection of key-value pairs, where each key and value can be of different types.
// Keys must be unique within a dictionary.
var capitals: [String: Any] = ["USA": "Washington, D.C.", "France": "Paris"]
capitals["Japan"] = "Tokyo" // Adding a new key-value pair

// Accessing Values:
// You can access a value by referencing its key.
let capitalOfUSA = capitals["USA"] // Output: Washington, D.C.


//***************************
// Set
//***************************
// A collection of unique values, where the order is not important.
// Use Set when you need to store distinct elements without duplicates.
var uniqueNumbers: Set<Int> = [1, 2, 3, 3, 4]
uniqueNumbers.insert(5) // Adding a new element





//===========================
// Type Inference
//===========================
// Swift is capable of inferring the type of a variable or constant based on the assigned value, so explicit type annotations are often not necessary.
// However, type annotations are useful when you want to specify the type explicitly, or when the initial value does not provide enough information for Swift to infer the type.
let language = "Swift" // Swift infers this as a String
var score = 100        // Swift infers this as an Int




//===========================
// Type Safety
//===========================
// Swift is a type-safe language, meaning it prevents you from mixing types that are incompatible.
let age: Int = 25
// let incorrectSum = age + " years old" // Error: Cannot add Int and String

// To combine different types, you’ll need to perform type conversions.
// let age = 25
// let message = "I am " + String(age) + " years old."

class Customer {
    weak var card: Card?
    
    init(){}
    
    deinit {
        debugPrint("Customer deallocated")
    }
}

class Card {
    var customer: Customer?
    
    init(){}
    
    deinit {
        debugPrint("Card deallocated")
    }
}

var customer: Customer? = Customer()
var card: Card? = Card()

customer?.card = card
card?.customer = customer

customer = nil

debugPrint(customer)
debugPrint(card)
