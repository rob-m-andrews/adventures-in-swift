// Treehouse
// Swift 2.0 Enumerations and Optionals
// https://teamtreehouse.com/library/swift-20-enumerations-and-optionals

////////////////////////////////////////////////////////
// Part 1: Optionals
////////////////////////////////////////////////////////

// So, we have this Person struct, but it's lacking a middle name
// struct Person {
//     let firstName: String
//     let lastName: String
// }

// Let's add a middle name
// struct Person {
//     let firstName: String
//     let middleName: String
//     let lastName: String
// }

// What if we try to create a Person with no middle name?
// The statement below won't compile...

// let noMiddlePerson = Person(firstName: "Person", middleName: nil, lastName: "Guy")

// OK, so how can we make the person's middle name optional?
// Change the middleName to an optional string type!!!
// struct Person {
//     let firstName: String
//     let middleName: String?
//     let lastName: String
// }

// Now this stament below will work!
// let noMiddlePerson = Person(firstName: "Person", middleName: nil, lastName: "Guy")

// SUCCESS!

// So. That works, but what _really_ is an optional?
// It's actually an enum under the hood!
//
// It's this:
// enum Optional<T> {
//     case Some(T)
//     case None
// }

// If the value exists, the compiler returns the associated value. This is done behind the scenes.

// ANY custom type you create can be made optional by appending the ? character to a type.

////////////////////////////////////////////////////////
// Part 2: Working with Optional Types
////////////////////////////////////////////////////////

// Let's work with the struct from above and add a func to get full name!

// Here we go:
// struct Person {
//     let firstName: String
//     let middleName: String?
//     let lastName: String
//     
//     func getFullName() -> String {
//         return firstName + " " + middleName + " " + lastName
//     }
// }

// So.... the above func won't compile, since middleName is an optional. We can't
// concatenate something that isn't _actually_ a string.

// We need to unwrap the optional value in order to work with it!

// Most basic way: if statement
// Let's check if the middle name is equal to nil

// struct Person {
//     let firstName: String
//     let middleName: String?
//     let lastName: String
//
//     func getFullName() -> String {
//         if middleName == nil {
//             return firstName + " " + lastName
//         } else {
//             // The exclamation mark appended to middleName will FORCE unwrap the middleName value
//             return firstName + " " + middleName! + " " + lastName
//         }
//     }
// }


// OK, so the if statement works. But... it SUCKS! It's bad code!
// You should not be force unwrapping like this!

// Soon, we'll learn better ways to work with this optional type.

////////////////////////////////////////////////////////
// Part 3: Optional Binding
////////////////////////////////////////////////////////

// If you'll remember Dictionaries always return an optional value.


let airportCodes = ["CDG" : "Charles de Gaulle"]

// Now, get a value out, using a key that we know doesn't exist.
let newYorkAirport = airportCodes["JFK"]

// You can see in the results area in Swift Playgrounds, the value is nil.
// What if we didn't know what the contents of 'airportCodes' was, and 
// had no idea if JFK existed as a key in the dict?

// We could go about checking it this way
// This is called optional binding. We do this to find out if an optional contains a value
if let airportNewYork = airportCodes["JFK"] {
    // bind to a temporary constant we create in the if statement
    // This temp constant can only be used inside the if statement block
    print(airportNewYork)
} else {
    print("That key doesn't exist!")
}


// The difference between the force unwrapping and optional binding is, we let
// the compiler do the unwrapping for you

// Many optional binds can be included in ONE if statement.

// Example -- Take this more complicated structure
let weatherDictionary: [String : [String : String]] = ["currently": ["temp": "22.3"], "daily": ["temp": "22.3"], "weekly": ["temp": "22.3"]]

// This code below works, but it's really freaking ugly... It looks like a pyramid when turned sideways
// The swift community calls this the 'optional pyramid of doom' :)

//if let dailyWeather = weatherDictionary["daily"] {
//    if let highTemperature = dailyWeather["temp"] {
//        print(highTemperature)
//    }
//}

// This code looks _slightly_ better.
if let dailyWeather = weatherDictionary["daily"],
    let highTemperature = dailyWeather["temp"] {
    print(highTemperature)
}

// There are some downsides to the approach above, that we'll soon learn.